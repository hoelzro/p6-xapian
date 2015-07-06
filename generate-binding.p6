=begin LICENSE
Generate C wrapper and Perl 6 bindings for a C++ class
Copyright (C) 2015 Rob Hoelz (rob AT hoelz.ro)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
=end LICENSE

my $*LIB-NAME = 'xapian-helper';

sub camel-to-snake-case(Str $name) {
    $name.subst(/(<[a..z]>)(<[A..Z]>)/, { "$0_$1" }, :g)
}

my %c-typemap = (
    'std::string'       => 'const char *',
    'Xapian::docid'     => 'unsigned int',
    'Xapian::termcount' => 'unsigned int',
);

my %perl-typemap = (
    'std::string'       => 'Str',
    'bool'              => 'Bool',
    'Xapian::docid'     => 'uint',
    'Xapian::termcount' => 'uint',
);

class CppType {
    has Str $.Str;

    method gist { $.Str }

    method new(Str $Str is copy) {
        if $Str !~~ /^Xapian/ && $Str ~~ /^<[A..Z]>/ {
            $Str = 'Xapian::' ~ $Str;
        }
        self.bless(:$Str)
    }

    method c-type {
        %c-typemap{$.Str}:exists
            ?? %c-typemap{$.Str}
            !! camel-to-snake-case($.Str.subst(/'::'/, '_', :g)).lc
    }

    method perl6-type {
        %perl-typemap{$.Str}:exists
            ?? %perl-typemap{$.Str}
            !! $.Str.subst(/^ 'Xapian::'/, '')
    }
}

class CppArgument {
    has CppType $.type;
    has $.name;
    has $.has-default-value;
    has Bool $.is-reference;
}

multi infix:<eqv>(CppType $a, CppType $b) { $a.Str eq $b.Str }

sub generate-arguments-declaration(@arguments is copy) {
    if @arguments {
        @arguments.map({
            $^arg.type.c-type ~ ' ' ~ $^arg.name
        }).join(', ')
    } else {
        'void'
    }
}

sub generate-arguments-call(@arguments is copy) {
    if @arguments {
        @arguments.shift if @arguments[0].name eq 'self';

        @arguments.map({
            $^arg.type.Str eq 'std::string'
                ?? "std::string($^arg.name())"
                !! ($^arg.is-reference ?? '*' !! '') ~ $^arg.name
        }).join(', ')
    } else {
        ''
    }
}

sub generate-perl6-arguments(@arguments is copy) {
    @arguments.map({
        $^arg.type.perl6-type ~ ' $' ~ $^arg.name
    }).join(', ')
}

sub generate-perl6-call(@arguments is copy) {
    @arguments.map({
        ($^arg.name eq 'self' ?? '' !! '$') ~ $^arg.name
    }).join(', ')
}

sub gather-typedefs($definition) {
    my %types;

    %types{$definition<type>.Str} = $definition<type>;

    for $definition<methods>.list -> $method {
        next if $method.should-skip;

        for $method.?arguments.grep(*.defined) -> $arg {
            if $arg.type.Str ~~ /^ 'Xapian::' <[A..Z]> / {
                %types{$arg.type.Str} = $arg.type;
            }
        }
    }

    join("\n", %types.values.map(-> $cpp-type {
        "typedef $cpp-type *$cpp-type.c-type();"
    }));
}

sub gather-multis($definition) {
    my %has-multi;

    for $definition<methods>.list -> $method {
        next if $method.should-skip;

        %has-multi{$method.name}++;
        %has-multi{$method.name} = 2 if any($method.?arguments».has-default-value);
    }
    # XXX can I do this with map?
    gather for %has-multi.kv -> $k, $v {
        take $k, True if $v > 1;
    }
}

class CppDestructor {
    method name {
        '~' ~ $*CPP-CLASS
    }

    method should-skip {
        False
    }

    method generate-c-wrappers {
        my $c-type = $*CPP-CLASS.c-type;
        return qq:to/END_CPP/;
        void
        {$c-type}_free($c-type self) throw ()
        \{
            delete self;
        \}
        END_CPP
    }

    method generate-perl6-stubs {
        my $function-name = $*CPP-CLASS.c-type ~ '_free';

        "my sub {$function-name}($*PERL6-CLASS \$self) is native('$*LIB-NAME') \{ * \}"
    }

    method generate-perl6-methods {
        my $function-name = $*CPP-CLASS.c-type ~ '_free';

        "method DESTROY() \{ {$function-name}(self) \}"
    }
}

class CppConstructor {
    has @.arguments;

    method name {
        $*CPP-CLASS.Str
    }

    method generate-c-wrappers {
        my @arguments = @.arguments;
        my $suffix = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;

        my $c-type = $*CPP-CLASS.c-type;

        return qq:to/END_CPP/;
        $c-type
        {$c-type}_new{$suffix}({generate-arguments-declaration(@arguments)}) throw ()
        \{
            return new {$*CPP-CLASS}({generate-arguments-call(@arguments)});
        \}
        END_CPP
    }

    method generate-perl6-stubs {
        my $arguments     = generate-perl6-arguments(@.arguments);
        my $suffix        = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
        my $function-name = $*CPP-CLASS.c-type ~ '_new' ~ $suffix;

        "my sub {$function-name}($arguments) returns $*PERL6-CLASS is native('$*LIB-NAME') \{ * \}"
    }

    method generate-perl6-methods {
        my $method-name   = 'new';
        my $arguments     = generate-perl6-arguments(@.arguments);
        my $call          = generate-perl6-call(@.arguments);
        my $suffix        = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
        my $function-name = $*CPP-CLASS.c-type ~ '_new' ~ $suffix;

        "{$*MULTI}method {$method-name}($arguments) returns $*PERL6-CLASS \{ {$function-name}($call) \}"
    }

    method should-skip {
        my @arguments = @.arguments;

        if @arguments == 1 && @arguments[0].type eqv $*CPP-CLASS {
            # copy constructor, skip it
            return True
        }

        if any(@arguments».type.Str) ~~ /'::Internal'/ {
            # uses an internal type, skip it
            return True
        }

        return False
    }
}

class CppMethod {
    has @.arguments;
    has $.name;
    has CppType $.return-type;

    method c-name {
        my $suffix = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
        $*CPP-CLASS.c-type ~ '_' ~ $.name ~ $suffix
    }

    method perl-name {
        $.name
    }

    method generate-c-wrappers {
        my @arguments = @.arguments;
        @arguments.unshift: CppArgument.new(
            :type($*CPP-CLASS),
            :name<self>,
        );

        my $is-void = $.return-type.Str eq 'void';

        my $first-optional-arg-index = @arguments.first-index(*.has-default-value) // +@arguments;

        gather for ($first-optional-arg-index..+@arguments) -> $last-index {
            my $suffix = ($*COUNTER // 0) == 0 ?? '' !! $*COUNTER + 1;

            my $call-arguments = generate-arguments-call(@arguments[0..^$last-index]);
            my $body =
                do if $.return-type.Str eq 'std::string' {
                    "std::string value = self->{$.name}($call-arguments);\n    return strdup(value.c_str());"
                } else {
                    "{$is-void ?? '' !! 'return'} self->{$.name}($call-arguments);"
                };

            take qq:to/END_CPP/;
            $.return-type().c-type()
            $*CPP-CLASS.c-type()_{$.name}{$suffix}({generate-arguments-declaration(@arguments[0..^$last-index])}) throw ()
            \{
                $body
            \}
            END_CPP
        }
    }

    method should-skip {
        if $.name ~~ /^operator/ {
            # operator overload, skip it (for now)
            return True
        }

        return False
    }

    method generate-perl6-stubs {
        my @arguments = @.arguments;
        @arguments.unshift: CppArgument.new(:type($*CPP-CLASS), :name<self>);

        my $first-optional-arg-index = @arguments.first-index(*.has-default-value) // +@arguments;
        my $returns                  = $.return-type.Str eq 'void' ?? '' !! ' returns ' ~ $.return-type.perl6-type;

        gather for ($first-optional-arg-index .. +@arguments) -> $last-index {
            my $suffix        = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
            my $function-name = $*CPP-CLASS.c-type ~ '_' ~ $.name ~ $suffix;
            my $arguments     = generate-perl6-arguments(@arguments[0..^$last-index]);

            take "my sub {$function-name}($arguments)$returns is native('$*LIB-NAME') \{ * \}"
        }
    }

    method generate-perl6-methods {
        my @arguments = @.arguments;
        @arguments.unshift: CppArgument.new(:type($*CPP-CLASS), :name<self>);

        my $first-optional-arg-index = @arguments.first-index(*.has-default-value) // +@arguments;
        my $returns                  = $.return-type.Str eq 'void' ?? '' !! ' returns ' ~ $.return-type.perl6-type;

        gather for ($first-optional-arg-index .. +@arguments) -> $last-index {
            my $suffix        = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
            my $function-name = $*CPP-CLASS.c-type ~ '_' ~ $.name ~ $suffix;
            my $method-name   = $.name;
            my $arguments     = generate-perl6-arguments(@arguments[1..^$last-index]);
            my $call          = generate-perl6-call(@arguments[0..^$last-index]);

            take "{$*MULTI}method {$method-name}($arguments)$returns \{ {$function-name}($call) \}"
        }
    }
}

grammar CppGrammar {
    rule TOP {
        :my $*SCOPE = 'private';

        ^ $<ws>=<.ws>
        <class-definition>
        $
    }

    token ws {
        <!ww>
        [ <.comment> || \s ]*
    }

    proto token comment { * }
    token comment:sym<//> {
        <sym> ~ $$ .*?
    }
    token comment:sym</*> {
        <sym> ~ '*/' .*?
    }

    rule class-definition {
        'class' $<name>=<.identifier>
        <inheritance>?
        '{' ~ '};' <class-thing>* % <.ws>
    }

    proto token class-thing { * }
    token class-thing:visibility-declaration {
        <visibility> ':'
    }

    rule class-thing:constructor {
        <method-modifier>*
        <.identifier> # XXX should be the same as the class
        '(' ~ ');' <arguments-declaration>
    }

    rule class-thing:method-declaration {
        <method-modifier>*
        $<return-type>=<.type>
        $<name>=[
            'operator' .
            || <.identifier>
        ]
        '(' ~ ')' <arguments-declaration>
        <method-post-modifier>*
        [ <.block> | ';' ]
    }

    rule class-thing:destructor {
        <method-modifier>*
        '~'
        <identifier> # XXX should be the same as the class
        '(' ');'
    }

    rule arguments-declaration {
        <argument>* % ','
    }

    rule argument {
        <type-modifier>*
        <type>

        $<pointy>=[<[&*]>*]

        $<name>=<.identifier>

        [
            '='
            $<default-value>=<literal>
        ]?
    }

    proto token literal { * }

    token literal:integer { \d+ }
    token literal:boolean { 'true' || 'false' }

    token type-modifier {
        'const'
    }

    token method-modifier {
        'virtual' || 'explicit' # XXX explicit is technically only for constructors...
    }

    token method-post-modifier {
        'const'
    }

    proto token type { * }
    token type:builtin {
        'void'
    }

    token type:identifier {
        <identifier>
    }

    token identifier {
        [ \w+ ]+ % '::'
    }

    rule inheritance {
        ':'
        [ <visibility> <identifier> ]+ % ','
    }

    token visibility {
        'public' || 'protected' || 'private'
    }

    rule block {
        '{' ~ '}' .*? # probably not great, but good enough
    }
}

class CppActions {
    sub make-args($/) {
        gather for $<argument>.list -> $/ {
            my $is-reference = do {
                my $/ = OUTER::<$/>;
                (~$<pointy> ~~ /'&'/).Bool
            };
            take CppArgument.new(
                :type(CppType.new(~$<type>)),
                :name(~$<name>),
                :$is-reference,
                :has-default-value($<default-value>.defined),
            );
        }
    }

    method TOP($/) {
        make $<class-definition>.made;
    }

    method class-definition($/) {
        my @made = $<class-thing>.map: *.made;
        @made .= grep({ .defined });
        make {
            :type(CppType.new('Xapian::' ~ $<name>)),
            :methods(@made),
        };
    }

    method class-thing:visibility-declaration ($/) {
        $*SCOPE = ~$<visibility>;
    }

    method class-thing:constructor ($/) {
        if $*SCOPE ne 'public' {
            return;
        }
        make CppConstructor.new(:arguments(make-args($<arguments-declaration>)));
    }

    method class-thing:destructor ($/) {
        # hopefully we don't have to worry about scope...
        make CppDestructor.new;
    }

    method class-thing:method-declaration ($/) {
        if $*SCOPE ne 'public' {
            return;
        }
        make CppMethod.new(:name(~$<name>), :arguments(make-args($<arguments-declaration>)), :return-type(CppType.new(~$<return-type>)));
    }
}

sub generate-c-binding($definition) {
    my $*CPP-CLASS = $definition<type>;

    my @function-definitions;
    my $typedefs = gather-typedefs($definition);

    my %method-counters;

    for $definition<methods>.list -> $method {
        next if $method.should-skip;

        my $*COUNTER := %method-counters{$method.name};
        $*COUNTER //= 0;

        for $method.generate-c-wrappers.list -> $wrapper {
            @function-definitions.push($wrapper);
            $*COUNTER++;
        }
    }

    my $function-definitions = @function-definitions.join("\n");

    qq:!closure:to/END_CPP_TEMPLATE/;
    #include <cstring>
    #include <string>

    #include <xapian.h>

    extern "C" {

    $typedefs

    $function-definitions
    }
    END_CPP_TEMPLATE
}

sub generate-perl6-binding($definition) {
    my $*PERL6-CLASS = $definition<type>.Str.subst(/^'Xapian::'/, '');

    my $*CPP-CLASS = $definition<type>;

    my @plumbing;
    my @porcelain;
    my %method-counters;
    my %has-multi = gather-multis($definition);

    for $definition<methods>.list -> $method {
        next if $method.should-skip;

        my $*COUNTER := %method-counters{$method.name};
        $*COUNTER //= 0;

        my $*MULTI = %has-multi{$method.name} ?? 'multi ' !! '';

        for $method.generate-perl6-stubs Z $method.generate-perl6-methods -> [$stub, $method] {
            @plumbing.push("    $stub");
            @porcelain.push("    $method");
            $*COUNTER++;
        }
    }

    my $plumbing  = @plumbing.join("\n");
    my $porcelain = @porcelain.join("\n");

    qq:!closure:to/END_PERL6/;
    class $*PERL6-CLASS is repr('CPointer') {
    $plumbing

    $porcelain
    }
    END_PERL6
}

my $source = slurp 'database.h';
my $definition = CppGrammar.parse($source, :actions(CppActions)).made;

#say generate-c-binding($definition);
say generate-perl6-binding($definition);

=begin pod

Bad definitions

	Document::Internal * get_document_lazily(Xapian::docid did) const;

	PostingIterator postlist_end(const std::string &) const {
	    return PostingIterator();
	}

	Xapian::TermIterator synonym_keys_begin(const std::string &prefix = std::string()) const;

=end pod
