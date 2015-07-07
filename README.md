# Name

Xapian

# Author

Rob Hoelz <rob AT hoelz.ro>

# Synopsis

```perl6
    use Xapian;

    my $db = Xapian::WritableDatabase.new('test.db', Xapian::DB_CREATE_OR_OPEN);
    my $term = Xapian::TermGenerator.new;
    $term.set_stemmer(Xapian::Stem.new('en'));
    LEAVE $db.close;

    for @documents -> $text {
        my $doc = Xapian::Document.new;
        $term.set_document($doc);
        $term.index_text($text);
        $db.add_document($doc);
    }
```

# Description

This module provides bindings for ([Xapian](http://xapian.org)) for Perl 6 via NativeCall.

# License

Perl 6 bindings for the Xapian library Copyright (C) 2015 Rob Hoelz (rob AT hoelz.ro)

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 51 Franklin
Street, Fifth Floor, Boston, MA 02110-1301, USA.
