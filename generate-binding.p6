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

sub snake-to-kebab-case(Str $name) {
    $name.subst(/'_'/, '-', :g)
}

sub is-xapian-class(Str $type-name) returns Bool {
    ($type-name ~~ /^ 'Xapian::' [ \w+ '::' ]*: <[A..Z]>/).Bool
}

sub is-xapian-inty(Str $type-name) returns Bool {
    ($type-name ~~ /^ 'Xapian::'? [ \w+ '::']*: <[a..z]>/).Bool
}

my %c-typemap = (
    'std::string'           => 'const char *',
    'Xapian::Query::op'     => 'unsigned int',
    'Xapian::docid'         => 'unsigned int',
    'Xapian::doccount'      => 'unsigned int',
    'Xapian::doclength'     => 'unsigned int',
    'Xapian::flags'         => 'unsigned int',
    'Xapian::stem_strategy' => 'unsigned int',
    'Xapian::termcount'     => 'unsigned int',
    'Xapian::termpos'       => 'unsigned int',
    'Xapian::valueno'       => 'unsigned int',
    'unsigned'              => 'unsigned int',
);

my %native-typemap = (
    'std::string'           => 'Str',
    'bool'                  => 'Bool',
    'Xapian::Query::op'     => 'uint',
    'Xapian::docid'         => 'uint',
    'Xapian::doccount'      => 'uint',
    'Xapian::doclength'     => 'uint',
    'Xapian::flags'         => 'uint',
    'Xapian::stem_strategy' => 'uint',
    'Xapian::termcount'     => 'uint',
    'Xapian::termpos'       => 'uint',
    'Xapian::valueno'       => 'uint',
    'unsigned'              => 'uint',
    'const char *'          => 'Str',
);

my %perl-typemap = (
    'std::string'           => 'Str',
    'bool'                  => 'Bool',
    'Xapian::Query::op'     => 'Int',
    'Xapian::docid'         => 'Int',
    'Xapian::doccount'      => 'Int',
    'Xapian::doclength'     => 'Int',
    'Xapian::flags'         => 'Int',
    'Xapian::stem_strategy' => 'Int',
    'Xapian::termcount'     => 'Int',
    'Xapian::termpos'       => 'Int',
    'Xapian::valueno'       => 'Int',
    'unsigned'              => 'Int',
    'int'                   => 'Int',
    'const char *'          => 'Str',
);

for (%c-typemap.item, %native-typemap.item, %perl-typemap.item) -> $typemap {
    for $typemap.kv -> $k, $v {
        next unless $k ~~ /^ 'Xapian::' (.*) /;
        $typemap{$0} = $v;
    }
}

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

    method perl6-type(Bool :$native = True) {
        my $typemap = $native ?? %native-typemap !! %perl-typemap;

        $typemap{$.Str}:exists
            ?? $typemap{$.Str}
            !! $.Str.subst(/^ 'Xapian::'/, '')
    }

    # this is awful
    method empty {
        given $.Str {
            when is-xapian-class($_) {
                'NULL'
            }
            when 'std::string' {
                'NULL'
            }
            when 'const char *' {
                'NULL'
            }
            when 'bool' {
                'false'
            }
            when is-xapian-inty($_) {
                '0'
            }
            default {
                die "shit: $.Str";
            }
        }
    }
}

class CppEnum {
    has $.name is rw;
    has %.values;

    method should-skip {
        'it is an enum'
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
    my @c-arguments = @arguments.map({
        $^arg.type.c-type ~ ' ' ~ $^arg.name
    });
    @c-arguments.push: 'void (*handle_exception)(const Xapian::Error *)';
    @c-arguments.join(', ')
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

sub generate-perl6-arguments(@arguments is copy, Bool :$native = True, Bool :$error-handler = False) {
    my @perl6-arguments = @arguments.map({
        $^arg.type.perl6-type(:$native) ~ ' $' ~ $^arg.name
    });

    if $error-handler {
        @perl6-arguments.push: '&handle-error (NativeError)';
    }

    @perl6-arguments.join(', ')
}

sub generate-perl6-call(@arguments is copy) {
    my @perl6-arguments = @arguments.map({
        ($^arg.name eq 'self' ?? '' !! '$') ~ $^arg.name
    });

    @perl6-arguments.push: '-> NativeError $error { $ex = Error.new($error) }';

    @perl6-arguments.join(', ')
}

sub gather-typedefs($definition) {
    my %types;

    %types{$definition<type>.Str} = $definition<type>;

    for $definition<methods>.list -> $method {
        my $skip-reason = $method.should-skip;
        if $skip-reason {
            note "skipping $method.name() because $skip-reason";
            next;
        }

        my @types = $method.?arguments.grep(*.defined).map(*.type);
        @types.push: $method.return-type if $method.can('return-type');

        for @types -> $type {
            if is-xapian-class($type.Str) {
                %types{$type.Str} = $type;
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
        my $skip-reason = $method.should-skip;
        if $skip-reason {
            note "skipping $method.name() because $skip-reason";
            next;
        }

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
        Str
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

        "    submethod DESTROY() \{ {$function-name}(self) \}\n"
    }
}

role PolymorphicFunction {
    has @.arguments;

    method argument-slices {
        my @arguments = @.arguments;

        my $first-optional-arg-index = @arguments.first-index(*.has-default-value) // +@arguments;

        gather for ($first-optional-arg-index..+@arguments) -> $last-index {
            take @arguments[0..^$last-index];
        }
    }

}

class CppConstructor {
    also does PolymorphicFunction;

    method name {
        $*CPP-CLASS.Str
    }

    method generate-c-wrappers {
        gather for self.argument-slices() -> @arguments {
            my $suffix = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;

            my $c-type = $*CPP-CLASS.c-type;

            take qq:to/END_CPP/;
            $c-type
            {$c-type}_new{$suffix}({generate-arguments-declaration(@arguments)}) throw ()
            \{
                try \{
                    return new {$*CPP-CLASS}({generate-arguments-call(@arguments)});
                \} catch(const Xapian::Error &error) \{
                    handle_exception(&error);
                    return {$*CPP-CLASS.empty};
                \}
            \}
            END_CPP
        }
    }

    method generate-perl6-stubs {
        gather for self.argument-slices() -> @arguments {
            my $arguments     = generate-perl6-arguments(@arguments, :error-handler);
            my $suffix        = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
            my $function-name = $*CPP-CLASS.c-type ~ '_new' ~ $suffix;

            take "my sub {$function-name}($arguments) returns $*PERL6-CLASS is native('$*LIB-NAME') \{ * \}";
        }
    }

    method generate-perl6-methods {
        gather for self.argument-slices() -> @arguments {
            my $method-name   = 'new';
            my $arguments     = generate-perl6-arguments(@arguments, :!native);
            my $call          = generate-perl6-call(@arguments);
            my $suffix        = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
            my $function-name = $*CPP-CLASS.c-type ~ '_new' ~ $suffix;

            take qq:to/END_CPP/;
                {$*MULTI}method {$method-name}($arguments) returns $*PERL6-CLASS \{
                    my \$ex;
                    my \$result = {$function-name}($call);
                    \$ex.throw if \$ex;
                    \$result
                \}
            END_CPP

        }
    }

    method should-skip {
        my @arguments = @.arguments;

        if @arguments == 1 && @arguments[0].type eqv $*CPP-CLASS {
            # copy constructor, skip it
            return 'it is a copy constructor'
        }

        if any(@arguments».type».Str) ~~ /'::Internal' || 'Implementation'/ {
            return 'it takes an internal/implementation type as an argument'
        }

        return Str
    }
}

class CppMethod {
    also does PolymorphicFunction;

    has $.name;
    has CppType $.return-type;
    has $.is-static;

    method c-name {
        my $suffix = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;

        my $basename = $*CPP-CLASS.c-type ~ '_' ~
            do if self!operator-name -> $operator {
                given $operator {
                    when '()' {
                        'call'
                    }

                    default {
                        die "Don't know what to call operator $operator in C"
                    }
                }
            } else {
                $.name
            }
        $basename ~ $suffix
    }

    method perl-name {
        if self!operator-name -> $operator {
            given $operator {
                when '()' {
                    'CALL-ME'
                }

                default {
                    die "Don't know what to call operator $operator in Perl 6"
                }
            }
        } else {
            $.name
        }
    }

    method arguments {
        my @arguments = @!arguments;
        @arguments.unshift: CppArgument.new(
            :type($*CPP-CLASS),
            :name<self>,
        );
        @arguments
    }

    method !operator-name {
        if $.name ~~ /^ 'operator' (.*) / {
            $0
        } else {
            Str
        }
    }

    method !generate-call($arguments) {
        if self!operator-name -> $operator {
            given $operator {
                when '()' {
                    "(*self)($arguments)"
                }

                default {
                    die "Don't know how to call operator $operator";
                }
            }
        } else {
            "self->{$.name}($arguments)"
        }
    }

    method generate-c-wrappers {
        my $is-void = $.return-type.Str eq 'void';

        gather for self.argument-slices() -> @arguments {
            my $suffix = ($*COUNTER // 0) == 0 ?? '' !! $*COUNTER + 1;

            my $call-arguments = generate-arguments-call(@arguments);
            my $body =
                do if $.return-type.Str eq 'std::string' {
                    "std::string value = {self!generate-call($call-arguments)};\n        return strdup(value.c_str());"
                } elsif is-xapian-class($.return-type.Str) {
                    "$.return-type *value = new {$.return-type}();\n        *value = {self!generate-call($call-arguments)};\n        return value;"
                } else {
                    "{$is-void ?? '' !! 'return '}{self!generate-call($call-arguments)};"
                };

            take qq:to/END_CPP/;
            $.return-type().c-type()
            {$.c-name}({generate-arguments-declaration(@arguments)}) throw ()
            \{
                try \{
                    $body
                \} catch(const Xapian::Error &error) \{
                    handle_exception(&error);
                    {$is-void ?? '' !! "return {$.return-type.empty};"}
                \}

            \}
            END_CPP
        }
    }

    method should-skip {
        if $.name ~~ /^'operator='/ {
            # assignment operator overload, skip it
            return 'it is an assignment operator overload'
        }

        if $.return-type.Str ~~ /'::Internal'/ {
            # returns an internal type, skip it
            return 'it returns an internal type'
        }

        if $.is-static {
            return 'it is static'
        }

        if any(@.arguments».type».Str) eq 'Xapian::Utf8Iterator' {
            return 'it uses Utf8Iterator'
        }

        return False
    }

    method generate-perl6-stubs {
        my $returns = $.return-type.Str eq 'void' ?? '' !! ' returns ' ~ $.return-type.perl6-type;

        gather for self.argument-slices() -> @arguments {
            my $suffix    = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
            my $arguments = generate-perl6-arguments(@arguments, :error-handler);

            take "my sub {$.c-name}($arguments)$returns is native('$*LIB-NAME') \{ * \}"
        }
    }

    method generate-perl6-methods {
        my $returns = $.return-type.Str eq 'void' ?? '' !! ' returns ' ~ $.return-type.perl6-type(:!native);

        gather {
            for self.argument-slices() -> @arguments {
                my $suffix      = $*COUNTER == 0 ?? '' !! $*COUNTER + 1;
                my $method-name = $.perl-name;
                my $arguments   = generate-perl6-arguments(@arguments[1..*], :!native);
                my $call        = generate-perl6-call(@arguments);

                my @methods;

                @methods.push: qq:to/END_CPP/;
                    {$*MULTI}method {$method-name}($arguments)$returns \{
                        my \$ex;
                        my \$result = {$.c-name}($call);
                        \$ex.throw if \$ex;
                        \$result
                    \}
                END_CPP

                if $method-name ~~ /'_'/ {
                    @methods.push: qq:to/END_CPP/;
                        {$*MULTI}method {snake-to-kebab-case($method-name)}($arguments)$returns \{
                            my \$ex;
                            my \$result = {$.c-name}($call);
                            \$ex.throw if \$ex;
                            \$result
                        \}
                    END_CPP
                }

                if $method-name eq 'get_description' {
                    @methods.push: qq:to/END_CPP/;
                        method gist() returns Str \{
                            my \$ex;
                            my \$result = {$.c-name}($call);
                            \$ex.throw if \$ex;
                            \$result
                        \}
                    END_CPP
                }

                take @methods.item; # XXX without .item?
            }
        }
    }
}

grammar CppGrammar {
    sub line-number($/) {
        $/.orig.substr(0, $/.to).lines.elems
    }

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
        '{' ~ ['};' || { die "Couldn't parse class-thing at line {line-number($/)}"}] <class-thing>* % <.ws>
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
            'operator' ['()' || .]
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

    rule class-thing:enum {
        'enum' $<name>=<.identifier>?
        '{' ~ '}' <enum-value>+ % ','

        ';'?
    }

    rule enum-value {
        <identifier> [ '=' $<value>=\d+ ]?
    }

    rule class-thing:typedef {
        'typedef' <class-thing> # this allows typedef public: and methods, but that's ok for now
        $<name>=<identifier>
        ';'
    }

    rule arguments-declaration {
        <argument>* % ','
    }

    rule argument {
        <type>

        $<name>=<.identifier>?

        [
            '='
            $<default-value>=<literal>
        ]?
    }

    proto token literal { * }

    token literal:integer { \d+ }
    token literal:boolean { 'true' || 'false' }
    token literal:null { 'NULL' }
    token literal:std_string { 'std::string()' }
    token literal:flags { 'flags(' <.ws> \d+ <.ws> ')' }

    token type-modifier {
        'const'
    }

    token method-modifier {
        'virtual' || 'explicit' || 'static' # XXX explicit is technically only for constructors...
    }

    token method-post-modifier {
        'const'
    }

    proto token type { * }
    token type:builtin {
        [
            || 'void'
            || [ 'const'? <.ws> 'char' <.ws> '*' ]
        ]
    }

    token type:identifier {
        <.type-modifier>*
        <.ws>
        <identifier> <!{ $<identifier> eq 'char' }>
        <.ws>
        $<pointy>=[<[&*]>* % <.ws>]

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
        my @anon_names := (1..*).map: { "_anon_$_"};

        gather for $<argument>.list -> $/ {
            my $is-reference = do {
                my $/ = OUTER::<$/>;
                (~$<type><pointy> ~~ /'&'/).Bool
            };
            take CppArgument.new(
                :type($<type>.made),
                :name($<name> ?? ~$<name> !! @anon_names.shift),
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
        my @modifiers = @<method-modifier>.map(*.Str);
        my $is-static = any(@modifiers) eq 'static';
        make CppMethod.new(:name(~$<name>), :arguments(make-args($<arguments-declaration>)), :return-type($<return-type>.made), :$is-static);
    }

    method class-thing:enum ($/) {
        my $name = $<name> ?? ~$<name> !! Str;

        my %names-to-values;

        my $current-value = 0;
        for @<enum-value> -> $/ {
            my $name  = $<identifier>;
            my $value = $<value> ?? +$<value> !! $current-value;

            $current-value = $value + 1;

            %names-to-values{$name} = $value;
        }

        make CppEnum.new(
            :$name,
            :values(%names-to-values),
        );
    }

    method class-thing:typedef ($/) {
        my $class-thing = $<class-thing>.made;
        $class-thing.name = ~$<name>;

        make $class-thing;
    }

    method type:builtin ($/) {
        make CppType.new(~$/);
    }

    method type:identifier ($/) {
        make CppType.new(~$<identifier>);
    }
}

sub generate-c-binding($definition) {
    my $*CPP-CLASS = $definition<type>;

    my @function-definitions;
    my $typedefs = gather-typedefs($definition);

    my %method-counters;

    for $definition<methods>.list -> $method {
        my $skip-reason = $method.should-skip;
        if $skip-reason {
            note "skipping $method.name() because $skip-reason";
            next;
        }

        my $*COUNTER := %method-counters{$method.name};
        $*COUNTER //= 0;

        for $method.generate-c-wrappers.list -> $wrapper {
            @function-definitions.push($wrapper);
            $*COUNTER++;
        }
    }

    my $function-definitions = @function-definitions.join("\n");

    qq:!closure:to/END_CPP_TEMPLATE/.trim;
    /*
     * Generated C wrapper for $*CPP-CLASS.Str()
     * Copyright (C) 2015 Rob Hoelz (rob AT hoelz.ro)
     *
     * This program is free software; you can redistribute it and/or
     * modify it under the terms of the GNU General Public License
     * as published by the Free Software Foundation; either version 2
     * of the License, or (at your option) any later version.
     *
     * This program is distributed in the hope that it will be useful,
     * but WITHOUT ANY WARRANTY; without even the implied warranty of
     * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     * GNU General Public License for more details.
     *
     * You should have received a copy of the GNU General Public License
     * along with this program; if not, write to the Free Software
     * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
     */

    #include <cstring>
    #include <string>

    #include <xapian.h>

    #include "version-check.h"

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
        my $skip-reason = $method.should-skip;
        if $skip-reason {
            note "skipping $method.name() because $skip-reason";
            next;
        }

        my $*COUNTER := %method-counters{$method.name};
        $*COUNTER //= 0;

        my $*MULTI = %has-multi{$method.name} ?? 'multi ' !! '';

        # XXX I expected to be able to use [ $stub, @methods ]
        for $method.generate-perl6-stubs Z $method.generate-perl6-methods -> ( $stub, $methods ) {
            @plumbing.push("    $stub");
            @porcelain.push($_) for @($methods);
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

sub MAIN(Str $header-file, Bool :$perl, Bool :$cpp) {
    if $perl && $cpp {
        die "--perl and --cpp are mutually exclusive";
    } elsif !$perl && !$cpp {
        die "One of --perl or --cpp is required";
    }

    my $source     = slurp $header-file;
    my $definition = CppGrammar.parse($source, :actions(CppActions));

    unless $definition {
        die "The parse of $header-file failed, and I don't know why =(";
    }

    $definition .= made;

    if $perl {
        say generate-perl6-binding($definition);
    } elsif $cpp {
        say generate-c-binding($definition);
    }
}
