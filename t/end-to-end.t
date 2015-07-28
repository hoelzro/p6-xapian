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
}

pass 'made it to the end';
