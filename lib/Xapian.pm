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

        method set_stemmer(Stem $stemmer) {
            xapian_term_generator_set_stemmer(self, $stemmer)
        }

        #`(
        method set_stopper(xapian_stopper $stopper) {
            xapian_term_generator_set_stopper(self, $stopper)
        }
        )

        method set_document(Document $document) {
            xapian_term_generator_set_document(self, $document)
        }

        #`(
        method set_database(xapian_writable_database $db) {
            xapian_term_generator_set_database(self, $db)
        }
        )

        method set_max_word_length(uint $max-word-length) {
            xapian_term_generator_set_max_word_length(self, $max-word-length);
        }

        multi method index_text(Str $text) {
            xapian_term_generator_index_text(self, $text)
        }

        multi method index_text(Str $text, uint $wdf-inc) {
            xapian_term_generator_index_text2(self, $text, $wdf-inc)
        }

        multi method index_text(Str $text, uint $wdf-inc, Str $prefix) {
            xapian_term_generator_index_text3(self, $text, $wdf-inc, $prefix)
        }

        multi method index_text_without_positions(Str $text) {
            xapian_term_generator_index_text_without_positions(self, $text)
        }

        multi method index_text_without_positions(Str $text, uint $wdf-inc) {
            xapian_term_generator_index_text_without_positions2(self, $text, $wdf-inc)
        }

        multi method index_text_without_positions(Str $text, uint $wdf-inc, Str $prefix) {
            xapian_term_generator_index_text_without_positions3(self, $text, $wdf-inc, $prefix)
        }

        multi method increase_termpos() {
            xapian_term_generator_increase_termpos(self)
        }

        multi method increase_termpos(uint $delta) {
            xapian_term_generator_increase_termpos2(self, $delta)
        }

        method get_termpos() returns uint {
            xapian_term_generator_get_termpos(self)
        }

        method set_termpos(uint $termpos) {
            xapian_term_generator_set_termpos(self, $termpos)
        }

        method get_description() returns Str {
            xapian_term_generator_get_description(self)
        }
    }

    class WritableDatabase is repr('CPointer') {
        my sub xapian_writable_database_free(WritableDatabase $self) is native('xapian-helper') { * }
        my sub xapian_writable_database_new() returns WritableDatabase is native('xapian-helper') { * }
        my sub xapian_writable_database_new2(Str $path, int $action) returns WritableDatabase is native('xapian-helper') { * }
        my sub xapian_writable_database_commit(WritableDatabase $self) is native('xapian-helper') { * }
        my sub xapian_writable_database_flush(WritableDatabase $self) is native('xapian-helper') { * }
        my sub xapian_writable_database_begin_transaction(WritableDatabase $self) is native('xapian-helper') { * }
        my sub xapian_writable_database_begin_transaction2(WritableDatabase $self, Bool $flushed) is native('xapian-helper') { * }
        my sub xapian_writable_database_commit_transaction(WritableDatabase $self) is native('xapian-helper') { * }
        my sub xapian_writable_database_cancel_transaction(WritableDatabase $self) is native('xapian-helper') { * }
        my sub xapian_writable_database_add_document(WritableDatabase $self, Document $document) returns uint is native('xapian-helper') { * }
        my sub xapian_writable_database_delete_document(WritableDatabase $self, uint $did) is native('xapian-helper') { * }
        my sub xapian_writable_database_delete_document2(WritableDatabase $self, Str $unique_term) is native('xapian-helper') { * }
        my sub xapian_writable_database_replace_document(WritableDatabase $self, uint $did, Document $document) is native('xapian-helper') { * }
        my sub xapian_writable_database_replace_document2(WritableDatabase $self, Str $unique_term, Document $document) returns uint is native('xapian-helper') { * }
        my sub xapian_writable_database_add_spelling(WritableDatabase $self, Str $word) is native('xapian-helper') { * }
        my sub xapian_writable_database_add_spelling2(WritableDatabase $self, Str $word, uint $freqinc) is native('xapian-helper') { * }
        my sub xapian_writable_database_remove_spelling(WritableDatabase $self, Str $word) is native('xapian-helper') { * }
        my sub xapian_writable_database_remove_spelling2(WritableDatabase $self, Str $word, uint $freqdec) is native('xapian-helper') { * }
        my sub xapian_writable_database_add_synonym(WritableDatabase $self, Str $term, Str $synonym) is native('xapian-helper') { * }
        my sub xapian_writable_database_remove_synonym(WritableDatabase $self, Str $term, Str $synonym) is native('xapian-helper') { * }
        my sub xapian_writable_database_clear_synonyms(WritableDatabase $self, Str $term) is native('xapian-helper') { * }
        my sub xapian_writable_database_set_metadata(WritableDatabase $self, Str $key, Str $value) is native('xapian-helper') { * }
        my sub xapian_writable_database_get_description(WritableDatabase $self) returns Str is native('xapian-helper') { * }

        method DESTROY() { xapian_writable_database_free(self) }
        proto method new(*@args) { * }
        multi method new() returns WritableDatabase { xapian_writable_database_new() }
        multi method new(Str $path, Int $action) returns WritableDatabase { xapian_writable_database_new2($path, $action) }
        method commit() { xapian_writable_database_commit(self) }
        method flush() { xapian_writable_database_flush(self) }
        multi method begin_transaction() { xapian_writable_database_begin_transaction(self) }
        multi method begin_transaction(Bool $flushed) { xapian_writable_database_begin_transaction2(self, $flushed) }
        method commit_transaction() { xapian_writable_database_commit_transaction(self) }
        method cancel_transaction() { xapian_writable_database_cancel_transaction(self) }
        method add_document(Document $document) returns uint { xapian_writable_database_add_document(self, $document) }
        multi method delete_document(uint $did) { xapian_writable_database_delete_document(self, $did) }
        multi method delete_document(Str $unique_term) { xapian_writable_database_delete_document2(self, $unique_term) }
        multi method replace_document(uint $did, Document $document) { xapian_writable_database_replace_document(self, $did, $document) }
        multi method replace_document(Str $unique_term, Document $document) returns uint { xapian_writable_database_replace_document2(self, $unique_term, $document) }
        multi method add_spelling(Str $word) { xapian_writable_database_add_spelling(self, $word) }
        multi method add_spelling(Str $word, uint $freqinc) { xapian_writable_database_add_spelling2(self, $word, $freqinc) }
        multi method remove_spelling(Str $word) { xapian_writable_database_remove_spelling(self, $word) }
        multi method remove_spelling(Str $word, uint $freqdec) { xapian_writable_database_remove_spelling2(self, $word, $freqdec) }
        method add_synonym(Str $term, Str $synonym) { xapian_writable_database_add_synonym(self, $term, $synonym) }
        method remove_synonym(Str $term, Str $synonym) { xapian_writable_database_remove_synonym(self, $term, $synonym) }
        method clear_synonyms(Str $term) { xapian_writable_database_clear_synonyms(self, $term) }
        method set_metadata(Str $key, Str $value) { xapian_writable_database_set_metadata(self, $key, $value) }
        method get_description() returns Str { xapian_writable_database_get_description(self) }
    }
}
