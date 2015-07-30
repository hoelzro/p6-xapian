use v6;

use Xapian;
use Test;

plan 1;

class CyrillicOnlyStopper is repr('CPointer') is Xapian::Stopper {
    method CALL-ME(Str $term) returns Bool {
        ($term ~~ /<-:Cyrillic>/).Bool
    }
}

my $text = q:to/END_TEXT/;
Он сказал мне «Something brilliant» по-англиский.
END_TEXT

my $stemmer = Xapian::Stem.new: 'ru';
my $stopper = CyrillicOnlyStopper.new;
my $term    = Xapian::TermGenerator.new;
my $doc     = Xapian::Document.new;

$term.set_stemmer($stemmer);
$term.set_stopper($stopper);
$term.set_document($doc);

$term.index_text($text);

my $it  = $doc.termlist-begin;
my $end = $doc.termlist-end;

my $non-cyrillic;

while $it !eqv $end {
    my $term = $it.deref;
    if $term ~~ /^ Z <-:Cyrillic> / {
        $non-cyrillic = $term;
        last;
    }
    $it++;
}

ok !$non-cyrillic.defined, q{CyrillicOnlyStopper's behavior should be used as a stopword algorithm} or diag "$non-cyrillic was found";
