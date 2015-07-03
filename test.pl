use v6;
use lib 'lib';
use Xapian;

my $text = q:to/END_TEXT/;
Зыд запиэнтэм дэмокритум ад. Шэа пробо эквюедым пожйдонёюм нэ. Ат пэр фюйзчыт
ёнкорруптэ, незл модо хаж эа. Ыт прё кашы еллум декат. Луптатум квюаырэндум
мэль ку. Ан ючю алиё минемум.

Хёз ийжквюы индоктум эа. Дёкант пырикульа шэа ад, йн квюач съюммо ыюм, нужквюам
модыратиюз рыпрэхэндунт ат вяш. Заэпы юрбанйтаж зыд йн, мэя йн квюиж дольор
адолэжкэнс. Кюм алььтыра кончюлату ад. Хаж нихйл зальютатуж эи. Вяш ан аэквюы
алььтыра, векж омнеж путант экз.

Ыт выльёт адолэжкэнс мэль, мэя ку молэчтёэ альиквуандо. Ты ючю квюод пырфэкто.
Ыюм тимэам нужквюам эи, но дуо номинатй азжюывырит зюжкепиантюр. Эа эррэм
интылльэгэбат про. Эа квюандо вивэндюм кюм, кэтэро еракюндйа ыкжпэтэндяз ты
нык, нам пыртенакж мныжаркхюм ан.

Ыт вим незл кибо, квюо толлйт шынчебюз дежпютатионй эю, вяш эю ридэнж элыктрам
консэквюат. Ут дикунт лыгэндоч тхэопхражтуз квуй. Ат эжт аляквюид омнэжквюы
жкрибэнтур, дуо квюод патриоквюы азжюывырит эа. Мэя ку золэт экшырки рыпудяары,
ед квуым вюльпутаты нам, шэа ыт ыёрмод инзтруктеор. Ед прё вирйз вёртюты, хаж
конгуы позтюлант ку. Йн ёужто бонорюм хёз, попюльо дёжкэрэ адвыржаряюм эю эож.

Ыёюз молэчтёэ эю прё, эа фэугяат факёльиси нык, мыа эним путант маиорюм ыт. Нык
ку ножтрюм фачтидёе, продыжщэт адолэжкэнс ометтантур экз векж. Ыррор мэльиорэ
эа еюж. Йн жят дёкант тэмпорибуз, прё эю заэпы эрепюят ёнвидюнт. Мэя ты элитр
ыльигэнди ылаборарэт, лудуз граэкы эа прё.

Мэя ат алььтэрюм докэндё мныжаркхюм, но рыбюм пожтэа прёнкипыз хёз, ку мыа
кхоро чингюльищ. Пэр ыт тымпор фачтидёе консэквюат. Незл луптатум эож ат. Нэ
маиорюм эффикеэнди рэпудёандаэ квюо, ты вим дёко ылаборарэт, экз мыа видишчы
констятюам. Эи жят адмодум янжольэнж, ыюм фюгит дытыррюизщэт эи. Эрюдитя
ёнэрмйщ плььатонэм эож экз, нэ про аккюмзан зигнёфэрумквюы, ад векж декат
путант.

Зыд квуым эквюедым янтэрэсщэт эи, кюм эю эрож консэквюат форынчйбюж. Эррэм
компльыктётюр ад нам, ты выро эрат тэмпорибуз нык. Еюж порро алььтыра ютроквюы
ыт, дуо ут орнатюс аппарэат вольуптатибюж. Ат вим аляквюид опортэры, мэль ку
рыпудяары консэквюат. Мыа ыльит лаудым зюжкепиантюр эа, хёз эю вёвындо
эффикеэнди.

Ыам ыт видырэр мэнандря квюаырэндум. Жят ан ыёрмод жплэндидэ ылаборарэт.
Попюльо мольлиз ёнкорруптэ ыюм ыт, ад жольюта тымпор кюм. Эож юрбанйтаж
дэмокритум ед, эю еюж ёнанй клита.

Аликвюип зючкёпит опортэры нэ векж, ты омйттам констятюам кюм, эи жямиляквюы
зэнтынтиаэ инкедыринт прё. Ат ютенам индоктум вэл. Ут зыд пожжёт компрэхэнжам.
Квуй эа ёнанй фэугяат компрэхэнжам, ыт квюо чонэт жольюта эрепюят, видырэр
мальорум пондэрюм ты нык.

Зыд но факилиз ывыртятюр. Экз зыд порро ножтрюд дэбетиз, дыкоры дикунт вэрыар
йн квюо. Мыа ыт дэлььынётё дёзсэнтёаш чадипжкёнг, дуо но конжюль патриоквюы
модыратиюз. Экз одео дольор мыа. Еюж омныз абхоррэант кончэктэтюыр экз, прё
фюгит партым ыльигэнди эи, эю зыд нюлльам конжтетуто. Ыам ед ырант жкрипта
льюкяльиюч. Эю тимэам кевёбюж адолэжкэнс мэя, мэя экз этёам дектаж вокынт.
END_TEXT

my $term = Xapian::TermGenerator.new;
$term.set_stemmer(Xapian::Stem.new('ru'));
my $db = Xapian::WritableDatabase.new('test.db', 1);

my @paras = $text.split(/\n\n/);

for @paras -> $paragraph {
    my $doc = Xapian::Document.new;
    $term.set_document($doc);
    $term.index_text($paragraph);
    $db.add_document($doc);
}
$db.flush;
