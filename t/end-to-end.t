use v6;
use lib 'lib';
use Xapian;

use Test;

plan 1;

my $text = q:to/END_TEXT/;
Зыд запиэнтэм дэмокритум ад. Шэа пробо эквюедым пожйдонёюм нэ. Ат пэр фюйзчыт
ёнкорруптэ, незл модо хаж эа. Ыт прё кашы еллум декат. Луптатум квюаырэндум
мэль ку. Ан ючю алиё минемум.
END_TEXT

my $term = Xapian::TermGenerator.new;
$term.set_stemmer(Xapian::Stem.new('ru'));
do {
    my $db = Xapian::WritableDatabase.new('test.db', Xapian::DB_CREATE_OR_OPEN);
    LEAVE $db.close;

    my @paras = $text.split(/\n\n/);

    for @paras -> $paragraph {
        my $doc = Xapian::Document.new;
        $term.set_document($doc);
        $term.index_text($paragraph);
        $db.add_document($doc);
    }

    my $enq = Xapian::Enquire.new($db);
    my $query = Xapian::Query.new('');
    # XXX MatchAll
    $enq.set-query: $query; # XXX I think that $enq's reference to the Xapian Query doesn't prevent GC
    my $mset = $enq.get-mset(0, 10);
    my $it = $mset.begin;
    my $end = $mset.end;

    while $it !eqv $end {
        say $it.deref;
        last;
        $it++;
    }
}

pass 'made it to the end';
