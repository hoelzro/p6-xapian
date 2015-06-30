use v6;
use NativeCall;

module Xapian {
    class Document is repr('CPointer') {
        my sub xapian_document_new() returns Document is native('xapian-helper') { * } 
        my sub xapian_document_free(Document $self) is native('xapian-helper') { * }
        my sub xapian_document_get_value(Document $self, int $slot) returns Str is native('xapian-helper') { * }
        my sub xapian_document_add_value(Document $self, int $slot, Str $value) is native('xapian-helper') { * }
        my sub xapian_document_remove_value(Document $self, int $slot) is native('xapian-helper') { * }
        my sub xapian_document_clear_values(Document $self) is native('xapian-helper') { * }
        my sub xapian_document_get_data(Document $self) returns Str is native('xapian-helper') { * }
        my sub xapian_document_set_data(Document $self, Str $data) is native('xapian-helper') { * }
        my sub xapian_document_add_posting(Document $self, Str $term, uint $tpos) is native('xapian-helper') { * }
        my sub xapian_document_add_posting2(Document $self, Str $term, uint $tpos, uint $wdfinc) is native('xapian-helper') { * }
        my sub xapian_document_add_term(Document $self, Str $term) is native('xapian-helper') { * }
        my sub xapian_document_add_term2(Document $self, Str $term, uint $wdfinc) is native('xapian-helper') { * }
        my sub xapian_document_add_boolean_term(Document $self, Str $term) is native('xapian-helper') { * }
        my sub xapian_document_remove_posting(Document $self, Str $term, uint $tpos) is native('xapian-helper') { * }
        my sub xapian_document_remove_posting2(Document $self, Str $term, uint $tpos, uint $wdfdec) is native('xapian-helper') { * }
        my sub xapian_document_remove_term(Document $self, Str $term) is native('xapian-helper') { * }
        my sub xapian_document_clear_terms(Document $self) is native('xapian-helper') { * }
        my sub xapian_document_termlist_count(Document $self) returns uint is native('xapian-helper') { * }
        my sub xapian_document_values_count(Document $self) returns uint is native('xapian-helper') { * }
        my sub xapian_document_get_docid(Document $self) returns uint is native('xapian-helper') { * }
        my sub xapian_document_get_description(Document $self) returns Str is native('xapian-helper') { * }

        method new {
            xapian_document_new()
        }

        submethod DESTROY {
            xapian_document_free(self)
        }

        method get_value(int $slot) returns Str {
            xapian_document_get_value(self, $slot)
        }

        method add_value(int $slot, Str $value) {
            xapian_document_add_value(self, $slot, $value)
        }

        method remove_value(int $slot) {
            xapian_document_remove_value(self, $slot)
        }

        method clear_values() {
            xapian_document_clear_values(self)
        }

        method get_data() returns Str {
            xapian_document_get_data(self)
        }

        method set_data(Str $data) {
            xapian_document_set_data(self, $data)
        }

        multi method add_posting(Str $term, uint $tpos) {
            xapian_document_add_posting(self, $term, $tpos)
        }

        multi method add_posting(Str $term, uint $tpos, uint $wdfinc) {
            xapian_document_add_posting2(self, $term, $tpos, $wdfinc)
        }

        multi method add_term(Str $term) {
            xapian_document_add_term(self, $term)
        }

        multi method add_term(Str $term, uint $wdfinc) {
            xapian_document_add_term2(self, $term, $wdfinc)
        }

        method add_boolean_term(Str $term) {
            xapian_document_add_boolean_term(self, $term)
        }

        multi method remove_posting(Str $term, uint $tpos) {
            xapian_document_remove_posting(self, $term, $tpos)
        }

        multi method remove_posting(Str $term, uint $tpos, uint $wdfdec) {
            xapian_document_remove_posting2(self, $term, $tpos, $wdfdec)
        }

        method remove_term(Str $term) {
            xapian_document_remove_term(self, $term)
        }

        method clear_terms() {
            xapian_document_clear_terms(self)
        }

        method termlist_count() returns uint {
            xapian_document_termlist_count(self)
        }

        method values_count() returns uint {
            xapian_document_values_count(self)
        }

        method get_docid() returns uint {
            xapian_document_get_docid(self)
        }

        method get_description() returns Str {
            xapian_document_get_description(self)
        }
    }

    class Stem is repr('CPointer') {
        my sub xapian_stem_new returns Stem is native('xapian-helper') { * }
        my sub xapian_stem_new_language(Str $language) returns Stem is native('xapian-helper') { * }
        my sub xapian_stem_free(Stem $self) is native('xapian-helper') { * }
        my sub xapian_stem_call(Stem $self, Str $word) returns Str is native('xapian-helper') { * }
        my sub xapian_stem_description(Stem $self) returns Str is native('xapian-helper') { * }

        method new(Str $language?) {
            $language.defined
                ?? xapian_stem_new_language($language)
                !! xapian_stem_new()
        }

        submethod DESTROY {
            xapian_stem_free(self)
        }

        method CALL-ME(Str $word) returns Str {
            xapian_stem_call(self, $word)
        }

        method description returns Str {
            xapian_stem_description(self)
        }
    }

    class TermGenerator is repr('CPointer') {
        my sub xapian_term_generator_new() returns TermGenerator is native('xapian-helper') { * }
        my sub xapian_term_generator_free(TermGenerator $self) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_stemmer(TermGenerator $self, Stem $stemmer) is native('xapian-helper') { * }
        #my sub xapian_term_generator_set_stopper(TermGenerator $self, xapian_stopper $stopper) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_document(TermGenerator $self, Document $document) is native('xapian-helper') { * }
        #my sub xapian_term_generator_set_database(TermGenerator $self, xapian_writable_database $db) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_max_word_length(TermGenerator $self, uint $max-word-length) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text(TermGenerator $self, Str $text) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text2(TermGenerator $self, Str $text, uint $wdf_inc) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text3(TermGenerator $self, Str $text, uint $wdf_inc, Str $prefix) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text_without_positions(TermGenerator $self, Str $text) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text_without_positions2(TermGenerator $self, Str $text, uint $wdf_inc) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text_without_positions3(TermGenerator $self, Str $text, uint $wdf_inc, Str $prefix) is native('xapian-helper') { * }
        my sub xapian_term_generator_increase_termpos(TermGenerator $self) is native('xapian-helper') { * }
        my sub xapian_term_generator_increase_termpos2(TermGenerator $self, uint $delta) is native('xapian-helper') { * }
        my sub xapian_term_generator_get_termpos(TermGenerator $self)  returns uint  is native('xapian-helper') { * }
        my sub xapian_term_generator_set_termpos(TermGenerator $self, uint $termpos) is native('xapian-helper') { * }
        my sub xapian_term_generator_get_description(TermGenerator $self) returns Str is native('xapian-helper') { * }

        method new() returns TermGenerator {
            xapian_term_generator_new()
        }

        submethod DESTROY() {
            xapian_term_generator_free(self)
        }

        method set_stemmer(TermGenerator $self, Stem $stemmer) {
            xapian_term_generator_set_stemmer($self, $stemmer)
        }

        #`(
        method set_stopper(TermGenerator $self, xapian_stopper $stopper) {
            xapian_term_generator_set_stopper($self, $stopper)
        }
        )

        method set_document(TermGenerator $self, Document $document) {
            xapian_term_generator_set_document($self, $document)
        }

        #`(
        method set_database(TermGenerator $self, xapian_writable_database $db) {
            xapian_term_generator_set_database($self, $db)
        }
        )

        method set_max_word_length(TermGenerator $self, uint $max-word-length) {
            xapian_term_generator_set_max_word_length($self, $max-word-length);
        }

        multi method index_text(TermGenerator $self, Str $text) {
            xapian_term_generator_index_text($self, $text)
        }

        multi method index_text(TermGenerator $self, Str $text, uint $wdf-inc) {
            xapian_term_generator_index_text2($self, $text, $wdf-inc)
        }

        multi method index_text(TermGenerator $self, Str $text, uint $wdf-inc, Str $prefix) {
            xapian_term_generator_index_text3($self, $text, $wdf-inc, $prefix)
        }

        multi method index_text_without_positions(TermGenerator $self, Str $text) {
            xapian_term_generator_index_text_without_positions($self, $text)
        }

        multi method index_text_without_positions(TermGenerator $self, Str $text, uint $wdf-inc) {
            xapian_term_generator_index_text_without_positions2($self, $text, $wdf-inc)
        }

        multi method index_text_without_positions(TermGenerator $self, Str $text, uint $wdf-inc, Str $prefix) {
            xapian_term_generator_index_text_without_positions3($self, $text, $wdf-inc, $prefix)
        }

        multi method increase_termpos(TermGenerator $self) {
            xapian_term_generator_increase_termpos($self)
        }

        multi method increase_termpos(TermGenerator $self, uint $delta) {
            xapian_term_generator_increase_termpos2($self, $delta)
        }

        method get_termpos(TermGenerator $self) returns uint {
            xapian_term_generator_get_termpos($self)
        }

        method set_termpos(TermGenerator $self, uint $termpos) {
            xapian_term_generator_set_termpos($self, $termpos)
        }

        method get_description(TermGenerator $self) returns Str {
            xapian_term_generator_get_description($self)
        }
    }
}
