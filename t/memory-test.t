use v6;
use nqp;

use Test;
use Xapian;

plan 1;

sub no-op {}

my $stem = Xapian::Stem.new: 'en';
my $term = Xapian::TermGenerator.new;
$term.set-stemmer: $stem;
$term.set-stopper: Xapian::SimpleStopper.new;

no-op();

nqp::force_gc();

no-op();

$term.index-text('hello, world!');

pass 'made it through';
