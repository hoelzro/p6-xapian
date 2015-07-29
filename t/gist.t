use v6;

use Xapian;
use Test;

plan 2;

ok Xapian::Query.new('').gist ~~ Str, 'A defined Query should gist to a Str';
ok Xapian::Query.gist         ~~ Str, 'An undefined Query should gist to a Str';
