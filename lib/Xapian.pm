# Perl 6 bindings for the Xapian library
# Copyright (C) 2015 Rob Hoelz (rob AT hoelz.ro)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

use v6;
use NativeCall;

module Xapian {
    constant DB_CREATE_OR_OPEN      = 1;
    constant DB_CREATE              = 2;
    constant DB_CREATE_OR_OVERWRITE = 3;
    constant DB_OPEN                = 4;

    constant BAD_VALUENO = -1;

    class NativeError is repr('CPointer') {
        my sub xapian_error_get_type(NativeError $self) returns Str is native('xapian-helper') { * }
        my sub xapian_error_get_msg(NativeError $self) returns Str is native('xapian-helper') { * }
        my sub xapian_error_get_context(NativeError $self) returns Str is native('xapian-helper') { * }
        my sub xapian_error_get_error_string(NativeError $self) returns Str is native('xapian-helper') { * }
        my sub xapian_error_get_description(NativeError $self) returns Str is native('xapian-helper') { * }

        method get_type() returns Str { xapian_error_get_type(self) }
        method get-type() returns Str { xapian_error_get_type(self) }
        method get_msg() returns Str { xapian_error_get_msg(self) }
        method get-msg() returns Str { xapian_error_get_msg(self) }
        method get_context() returns Str { xapian_error_get_context(self) }
        method get-context() returns Str { xapian_error_get_context(self) }
        method get_error_string() returns Str { xapian_error_get_error_string(self) }
        method get-error-string() returns Str { xapian_error_get_error_string(self) }
        method get_description() returns Str { xapian_error_get_description(self) }
        method get-description() returns Str { xapian_error_get_description(self) }
        method gist() returns Str { xapian_error_get_description(self) }
    }

    class Error is Exception {
        has Str $.type;
        has Str $.message;
        has Str $.context;
        has Str $.error-string;
        has Str $.description;

        method new(NativeError $native) {
            self.bless(
                :type($native.get_type),
                :message($native.get_msg),
                :context($native.get_context),
                :error-string($native.get_error_string),
                :description($native.get_description),
            )
        }
    }

    class PositionIterator is repr('CPointer') {
    }

    class PostingIterator is repr('CPointer') {
    }

    class TermIterator is repr('CPointer') {
    }

    class ValueIterator is repr('CPointer') {
    }

    class ValueIteratorEnd_ is repr('CPointer') {
    }

    class Stopper is repr('CPointer') {
    }

    class WritableDatabase is repr('CPointer') { ... }

    class Document is repr('CPointer') {
        my sub xapian_document_new(&handle-error (NativeError)) returns Document is native('xapian-helper') { * }
        my sub xapian_document_free(Document $self) is native('xapian-helper') { * }
        my sub xapian_document_get_value(Document $self, uint $slot, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_document_add_value(Document $self, uint $slot, Str $value, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_remove_value(Document $self, uint $slot, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_clear_values(Document $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_get_data(Document $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_document_set_data(Document $self, Str $data, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_add_posting(Document $self, Str $tname, uint $tpos, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_add_posting2(Document $self, Str $tname, uint $tpos, uint $wdfinc, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_add_term(Document $self, Str $tname, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_add_term2(Document $self, Str $tname, uint $wdfinc, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_add_boolean_term(Document $self, Str $term, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_remove_posting(Document $self, Str $tname, uint $tpos, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_remove_posting2(Document $self, Str $tname, uint $tpos, uint $wdfdec, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_remove_term(Document $self, Str $tname, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_clear_terms(Document $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_document_termlist_count(Document $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_document_termlist_begin(Document $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_document_termlist_end(Document $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_document_values_count(Document $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_document_values_begin(Document $self, &handle-error (NativeError)) returns ValueIterator is native('xapian-helper') { * }
        my sub xapian_document_values_end(Document $self, &handle-error (NativeError)) returns ValueIteratorEnd_ is native('xapian-helper') { * }
        my sub xapian_document_get_docid(Document $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_document_serialise(Document $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_document_get_description(Document $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_document_unserialise(Str $s, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }

        method new() returns Document {
            my $ex;
            my $result = xapian_document_new(-> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        submethod DESTROY() { xapian_document_free(self) }

        method get_value(Int $slot) returns Str {
            my $ex;
            my $result = xapian_document_get_value(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-value(Int $slot) returns Str {
            my $ex;
            my $result = xapian_document_get_value(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add_value(Int $slot, Str $value) {
            my $ex;
            my $result = xapian_document_add_value(self, $slot, $value, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add-value(Int $slot, Str $value) {
            my $ex;
            my $result = xapian_document_add_value(self, $slot, $value, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method remove_value(Int $slot) {
            my $ex;
            my $result = xapian_document_remove_value(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method remove-value(Int $slot) {
            my $ex;
            my $result = xapian_document_remove_value(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method clear_values() {
            my $ex;
            my $result = xapian_document_clear_values(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method clear-values() {
            my $ex;
            my $result = xapian_document_clear_values(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_data() returns Str {
            my $ex;
            my $result = xapian_document_get_data(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-data() returns Str {
            my $ex;
            my $result = xapian_document_get_data(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set_data(Str $data) {
            my $ex;
            my $result = xapian_document_set_data(self, $data, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-data(Str $data) {
            my $ex;
            my $result = xapian_document_set_data(self, $data, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add_posting(Str $tname, Int $tpos) {
            my $ex;
            my $result = xapian_document_add_posting(self, $tname, $tpos, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add-posting(Str $tname, Int $tpos) {
            my $ex;
            my $result = xapian_document_add_posting(self, $tname, $tpos, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add_posting(Str $tname, Int $tpos, Int $wdfinc) {
            my $ex;
            my $result = xapian_document_add_posting2(self, $tname, $tpos, $wdfinc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add-posting(Str $tname, Int $tpos, Int $wdfinc) {
            my $ex;
            my $result = xapian_document_add_posting2(self, $tname, $tpos, $wdfinc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add_term(Str $tname) {
            my $ex;
            my $result = xapian_document_add_term(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add-term(Str $tname) {
            my $ex;
            my $result = xapian_document_add_term(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add_term(Str $tname, Int $wdfinc) {
            my $ex;
            my $result = xapian_document_add_term2(self, $tname, $wdfinc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add-term(Str $tname, Int $wdfinc) {
            my $ex;
            my $result = xapian_document_add_term2(self, $tname, $wdfinc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add_boolean_term(Str $term) {
            my $ex;
            my $result = xapian_document_add_boolean_term(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add-boolean-term(Str $term) {
            my $ex;
            my $result = xapian_document_add_boolean_term(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove_posting(Str $tname, Int $tpos) {
            my $ex;
            my $result = xapian_document_remove_posting(self, $tname, $tpos, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove-posting(Str $tname, Int $tpos) {
            my $ex;
            my $result = xapian_document_remove_posting(self, $tname, $tpos, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove_posting(Str $tname, Int $tpos, Int $wdfdec) {
            my $ex;
            my $result = xapian_document_remove_posting2(self, $tname, $tpos, $wdfdec, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove-posting(Str $tname, Int $tpos, Int $wdfdec) {
            my $ex;
            my $result = xapian_document_remove_posting2(self, $tname, $tpos, $wdfdec, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method remove_term(Str $tname) {
            my $ex;
            my $result = xapian_document_remove_term(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method remove-term(Str $tname) {
            my $ex;
            my $result = xapian_document_remove_term(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method clear_terms() {
            my $ex;
            my $result = xapian_document_clear_terms(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method clear-terms() {
            my $ex;
            my $result = xapian_document_clear_terms(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist_count() returns Int {
            my $ex;
            my $result = xapian_document_termlist_count(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist-count() returns Int {
            my $ex;
            my $result = xapian_document_termlist_count(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist_begin() returns TermIterator {
            my $ex;
            my $result = xapian_document_termlist_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist-begin() returns TermIterator {
            my $ex;
            my $result = xapian_document_termlist_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist_end() returns TermIterator {
            my $ex;
            my $result = xapian_document_termlist_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist-end() returns TermIterator {
            my $ex;
            my $result = xapian_document_termlist_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method values_count() returns Int {
            my $ex;
            my $result = xapian_document_values_count(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method values-count() returns Int {
            my $ex;
            my $result = xapian_document_values_count(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method values_begin() returns ValueIterator {
            my $ex;
            my $result = xapian_document_values_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method values-begin() returns ValueIterator {
            my $ex;
            my $result = xapian_document_values_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method values_end() returns ValueIteratorEnd_ {
            my $ex;
            my $result = xapian_document_values_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method values-end() returns ValueIteratorEnd_ {
            my $ex;
            my $result = xapian_document_values_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_docid() returns Int {
            my $ex;
            my $result = xapian_document_get_docid(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-docid() returns Int {
            my $ex;
            my $result = xapian_document_get_docid(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method serialise() returns Str {
            my $ex;
            my $result = xapian_document_serialise(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_description() returns Str {
            my $ex;
            my $result = xapian_document_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-description() returns Str {
            my $ex;
            my $result = xapian_document_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method gist() returns Str {
            my $ex;
            my $result = xapian_document_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method unserialise(Str $s) returns Document {
            my $ex;
            my $result = xapian_document_unserialise($s, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }
    }

    class Stem is repr('CPointer') {
        my sub xapian_stem_new(&handle-error (NativeError)) returns Stem is native('xapian-helper') { * }
        my sub xapian_stem_new2(Str $language, &handle-error (NativeError)) returns Stem is native('xapian-helper') { * }
        my sub xapian_stem_free(Stem $self) is native('xapian-helper') { * }
        my sub xapian_stem_call(Stem $self, Str $word, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_stem_get_description(Stem $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_stem_get_available_languages(&handle-error (NativeError)) returns Str is native('xapian-helper') { * }

        multi method new() returns Stem {
            my $ex;
            my $result = xapian_stem_new(-> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method new(Str $language) returns Stem {
            my $ex;
            my $result = xapian_stem_new2($language, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        submethod DESTROY() { xapian_stem_free(self) }

        method CALL-ME(Str $word) returns Str {
            my $ex;
            my $result = xapian_stem_call(self, $word, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_description() returns Str {
            my $ex;
            my $result = xapian_stem_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-description() returns Str {
            my $ex;
            my $result = xapian_stem_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method gist() returns Str {
            my $ex;
            my $result = xapian_stem_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_available_languages() returns Str {
            my $ex;
            my $result = xapian_stem_get_available_languages(-> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-available-languages() returns Str {
            self.get_available_languages
        }
    }

    class TermGenerator is repr('CPointer') {
        my sub xapian_term_generator_new(&handle-error (NativeError)) returns TermGenerator is native('xapian-helper') { * }
        my sub xapian_term_generator_free(TermGenerator $self) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_stemmer(TermGenerator $self, Stem $stemmer, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_stopper(TermGenerator $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_stopper2(TermGenerator $self, Stopper $stop, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_document(TermGenerator $self, Document $doc, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_get_document(TermGenerator $self, &handle-error (NativeError)) returns Document is native('xapian-helper') { * }
        my sub xapian_term_generator_set_database(TermGenerator $self, WritableDatabase $db, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_flags(TermGenerator $self, uint $toggle, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_term_generator_set_flags2(TermGenerator $self, uint $toggle, uint $mask, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_term_generator_set_stemming_strategy(TermGenerator $self, uint $strategy, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_set_max_word_length(TermGenerator $self, uint $max_word_length, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text(TermGenerator $self, Str $text, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text2(TermGenerator $self, Str $text, uint $wdf_inc, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text3(TermGenerator $self, Str $text, uint $wdf_inc, Str $prefix, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text_without_positions(TermGenerator $self, Str $text, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text_without_positions2(TermGenerator $self, Str $text, uint $wdf_inc, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_index_text_without_positions3(TermGenerator $self, Str $text, uint $wdf_inc, Str $prefix, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_increase_termpos(TermGenerator $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_increase_termpos2(TermGenerator $self, uint $delta, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_get_termpos(TermGenerator $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_term_generator_set_termpos(TermGenerator $self, uint $termpos, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_term_generator_get_description(TermGenerator $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }

        method new() returns TermGenerator {
            my $ex;
            my $result = xapian_term_generator_new(-> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        submethod DESTROY() { xapian_term_generator_free(self) }

        method set_stemmer(Stem $stemmer) {
            my $ex;
            my $result = xapian_term_generator_set_stemmer(self, $stemmer, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-stemmer(Stem $stemmer) {
            my $ex;
            my $result = xapian_term_generator_set_stemmer(self, $stemmer, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set_stopper() {
            my $ex;
            my $result = xapian_term_generator_set_stopper(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set-stopper() {
            my $ex;
            my $result = xapian_term_generator_set_stopper(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set_stopper(Stopper $stop) {
            my $ex;
            my $result = xapian_term_generator_set_stopper2(self, $stop, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set-stopper(Stopper $stop) {
            my $ex;
            my $result = xapian_term_generator_set_stopper2(self, $stop, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set_document(Document $doc) {
            my $ex;
            my $result = xapian_term_generator_set_document(self, $doc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-document(Document $doc) {
            my $ex;
            my $result = xapian_term_generator_set_document(self, $doc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_document() returns Document {
            my $ex;
            my $result = xapian_term_generator_get_document(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-document() returns Document {
            my $ex;
            my $result = xapian_term_generator_get_document(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set_database(WritableDatabase $db) {
            my $ex;
            my $result = xapian_term_generator_set_database(self, $db, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-database(WritableDatabase $db) {
            my $ex;
            my $result = xapian_term_generator_set_database(self, $db, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set_flags(Int $toggle) returns Int {
            my $ex;
            my $result = xapian_term_generator_set_flags(self, $toggle, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set-flags(Int $toggle) returns Int {
            my $ex;
            my $result = xapian_term_generator_set_flags(self, $toggle, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set_flags(Int $toggle, Int $mask) returns Int {
            my $ex;
            my $result = xapian_term_generator_set_flags2(self, $toggle, $mask, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method set-flags(Int $toggle, Int $mask) returns Int {
            my $ex;
            my $result = xapian_term_generator_set_flags2(self, $toggle, $mask, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set_stemming_strategy(Int $strategy) {
            my $ex;
            my $result = xapian_term_generator_set_stemming_strategy(self, $strategy, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-stemming-strategy(Int $strategy) {
            my $ex;
            my $result = xapian_term_generator_set_stemming_strategy(self, $strategy, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set_max_word_length(Int $max_word_length) {
            my $ex;
            my $result = xapian_term_generator_set_max_word_length(self, $max_word_length, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-max-word-length(Int $max_word_length) {
            my $ex;
            my $result = xapian_term_generator_set_max_word_length(self, $max_word_length, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index_text(Str $text) {
            my $ex;
            my $result = xapian_term_generator_index_text(self, $text, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index-text(Str $text) {
            my $ex;
            my $result = xapian_term_generator_index_text(self, $text, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index_text(Str $text, Int $wdf_inc) {
            my $ex;
            my $result = xapian_term_generator_index_text2(self, $text, $wdf_inc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index-text(Str $text, Int $wdf_inc) {
            my $ex;
            my $result = xapian_term_generator_index_text2(self, $text, $wdf_inc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index_text(Str $text, Int $wdf_inc, Str $prefix) {
            my $ex;
            my $result = xapian_term_generator_index_text3(self, $text, $wdf_inc, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index-text(Str $text, Int $wdf_inc, Str $prefix) {
            my $ex;
            my $result = xapian_term_generator_index_text3(self, $text, $wdf_inc, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index_text_without_positions(Str $text) {
            my $ex;
            my $result = xapian_term_generator_index_text_without_positions(self, $text, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index-text-without-positions(Str $text) {
            my $ex;
            my $result = xapian_term_generator_index_text_without_positions(self, $text, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index_text_without_positions(Str $text, Int $wdf_inc) {
            my $ex;
            my $result = xapian_term_generator_index_text_without_positions2(self, $text, $wdf_inc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index-text-without-positions(Str $text, Int $wdf_inc) {
            my $ex;
            my $result = xapian_term_generator_index_text_without_positions2(self, $text, $wdf_inc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index_text_without_positions(Str $text, Int $wdf_inc, Str $prefix) {
            my $ex;
            my $result = xapian_term_generator_index_text_without_positions3(self, $text, $wdf_inc, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method index-text-without-positions(Str $text, Int $wdf_inc, Str $prefix) {
            my $ex;
            my $result = xapian_term_generator_index_text_without_positions3(self, $text, $wdf_inc, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method increase_termpos() {
            my $ex;
            my $result = xapian_term_generator_increase_termpos(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method increase-termpos() {
            my $ex;
            my $result = xapian_term_generator_increase_termpos(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method increase_termpos(Int $delta) {
            my $ex;
            my $result = xapian_term_generator_increase_termpos2(self, $delta, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method increase-termpos(Int $delta) {
            my $ex;
            my $result = xapian_term_generator_increase_termpos2(self, $delta, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_termpos() returns Int {
            my $ex;
            my $result = xapian_term_generator_get_termpos(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-termpos() returns Int {
            my $ex;
            my $result = xapian_term_generator_get_termpos(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set_termpos(Int $termpos) {
            my $ex;
            my $result = xapian_term_generator_set_termpos(self, $termpos, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-termpos(Int $termpos) {
            my $ex;
            my $result = xapian_term_generator_set_termpos(self, $termpos, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_description() returns Str {
            my $ex;
            my $result = xapian_term_generator_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-description() returns Str {
            my $ex;
            my $result = xapian_term_generator_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method gist() returns Str {
            my $ex;
            my $result = xapian_term_generator_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        enum flags (:Spelling(128));
        enum stem_strategy <None Some All All-Z>;
    }

    class Database is repr('CPointer') {
        my sub xapian_database_add_database(Database $self, Database $database, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_database_new(&handle-error (NativeError)) returns Database is native('xapian-helper') { * }
        my sub xapian_database_new2(Str $path, &handle-error (NativeError)) returns Database is native('xapian-helper') { * }
        my sub xapian_database_free(Database $self) is native('xapian-helper') { * }
        my sub xapian_database_reopen(Database $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_database_close(Database $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_database_get_description(Database $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_database_postlist_begin(Database $self, Str $tname, &handle-error (NativeError)) returns PostingIterator is native('xapian-helper') { * }
        my sub xapian_database_postlist_end(Database $self, Str $_anon_1, &handle-error (NativeError)) returns PostingIterator is native('xapian-helper') { * }
        my sub xapian_database_termlist_begin(Database $self, uint $did, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_termlist_end(Database $self, uint $_anon_1, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_has_positions(Database $self, &handle-error (NativeError)) returns Bool is native('xapian-helper') { * }
        my sub xapian_database_positionlist_begin(Database $self, uint $did, Str $tname, &handle-error (NativeError)) returns PositionIterator is native('xapian-helper') { * }
        my sub xapian_database_positionlist_end(Database $self, uint $_anon_1, Str $_anon_2, &handle-error (NativeError)) returns PositionIterator is native('xapian-helper') { * }
        my sub xapian_database_allterms_begin(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_allterms_end(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_allterms_begin2(Database $self, Str $prefix, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_allterms_end2(Database $self, Str $_anon_1, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_get_doccount(Database $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_get_lastdocid(Database $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_get_avlength(Database $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_get_termfreq(Database $self, Str $tname, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_term_exists(Database $self, Str $tname, &handle-error (NativeError)) returns Bool is native('xapian-helper') { * }
        my sub xapian_database_get_collection_freq(Database $self, Str $tname, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_get_value_freq(Database $self, uint $slot, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_get_value_lower_bound(Database $self, uint $slot, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_database_get_value_upper_bound(Database $self, uint $slot, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_database_get_doclength_lower_bound(Database $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_get_doclength_upper_bound(Database $self, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_get_wdf_upper_bound(Database $self, Str $term, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_valuestream_begin(Database $self, uint $slot, &handle-error (NativeError)) returns ValueIterator is native('xapian-helper') { * }
        my sub xapian_database_valuestream_end(Database $self, uint $_anon_1, &handle-error (NativeError)) returns ValueIteratorEnd_ is native('xapian-helper') { * }
        my sub xapian_database_get_doclength(Database $self, uint $did, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_database_keep_alive(Database $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_database_get_document(Database $self, uint $did, &handle-error (NativeError)) returns Document is native('xapian-helper') { * }
        my sub xapian_database_get_spelling_suggestion(Database $self, Str $word, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_database_get_spelling_suggestion2(Database $self, Str $word, uint $max_edit_distance, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_database_spellings_begin(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_spellings_end(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_synonyms_begin(Database $self, Str $term, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_synonyms_end(Database $self, Str $_anon_1, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_synonym_keys_begin(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_synonym_keys_begin2(Database $self, Str $prefix, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_synonym_keys_end(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_synonym_keys_end2(Database $self, Str $_anon_1, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_get_metadata(Database $self, Str $key, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }
        my sub xapian_database_metadata_keys_begin(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_metadata_keys_begin2(Database $self, Str $prefix, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_metadata_keys_end(Database $self, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_metadata_keys_end2(Database $self, Str $_anon_1, &handle-error (NativeError)) returns TermIterator is native('xapian-helper') { * }
        my sub xapian_database_get_uuid(Database $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }

        method add_database(Database $database) {
            my $ex;
            my $result = xapian_database_add_database(self, $database, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add-database(Database $database) {
            my $ex;
            my $result = xapian_database_add_database(self, $database, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method new() returns Database {
            my $ex;
            my $result = xapian_database_new(-> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method new(Str $path) returns Database {
            my $ex;
            my $result = xapian_database_new2($path, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        submethod DESTROY() { xapian_database_free(self) }

        method reopen() {
            my $ex;
            my $result = xapian_database_reopen(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method close() {
            my $ex;
            my $result = xapian_database_close(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_description() returns Str {
            my $ex;
            my $result = xapian_database_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-description() returns Str {
            my $ex;
            my $result = xapian_database_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method gist() returns Str {
            my $ex;
            my $result = xapian_database_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method postlist_begin(Str $tname) returns PostingIterator {
            my $ex;
            my $result = xapian_database_postlist_begin(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method postlist-begin(Str $tname) returns PostingIterator {
            my $ex;
            my $result = xapian_database_postlist_begin(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method postlist_end(Str $_anon_1) returns PostingIterator {
            my $ex;
            my $result = xapian_database_postlist_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method postlist-end(Str $_anon_1) returns PostingIterator {
            my $ex;
            my $result = xapian_database_postlist_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist_begin(Int $did) returns TermIterator {
            my $ex;
            my $result = xapian_database_termlist_begin(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist-begin(Int $did) returns TermIterator {
            my $ex;
            my $result = xapian_database_termlist_begin(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist_end(Int $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_termlist_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method termlist-end(Int $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_termlist_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method has_positions() returns Bool {
            my $ex;
            my $result = xapian_database_has_positions(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method has-positions() returns Bool {
            my $ex;
            my $result = xapian_database_has_positions(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method positionlist_begin(Int $did, Str $tname) returns PositionIterator {
            my $ex;
            my $result = xapian_database_positionlist_begin(self, $did, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method positionlist-begin(Int $did, Str $tname) returns PositionIterator {
            my $ex;
            my $result = xapian_database_positionlist_begin(self, $did, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method positionlist_end(Int $_anon_1, Str $_anon_2) returns PositionIterator {
            my $ex;
            my $result = xapian_database_positionlist_end(self, $_anon_1, $_anon_2, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method positionlist-end(Int $_anon_1, Str $_anon_2) returns PositionIterator {
            my $ex;
            my $result = xapian_database_positionlist_end(self, $_anon_1, $_anon_2, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms_begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms-begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms_end() returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms-end() returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms_begin(Str $prefix) returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_begin2(self, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms-begin(Str $prefix) returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_begin2(self, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms_end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_end2(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method allterms-end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_allterms_end2(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_doccount() returns Int {
            my $ex;
            my $result = xapian_database_get_doccount(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-doccount() returns Int {
            my $ex;
            my $result = xapian_database_get_doccount(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_lastdocid() returns Int {
            my $ex;
            my $result = xapian_database_get_lastdocid(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-lastdocid() returns Int {
            my $ex;
            my $result = xapian_database_get_lastdocid(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_avlength() returns Int {
            my $ex;
            my $result = xapian_database_get_avlength(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-avlength() returns Int {
            my $ex;
            my $result = xapian_database_get_avlength(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_termfreq(Str $tname) returns Int {
            my $ex;
            my $result = xapian_database_get_termfreq(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-termfreq(Str $tname) returns Int {
            my $ex;
            my $result = xapian_database_get_termfreq(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method term_exists(Str $tname) returns Bool {
            my $ex;
            my $result = xapian_database_term_exists(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method term-exists(Str $tname) returns Bool {
            my $ex;
            my $result = xapian_database_term_exists(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_collection_freq(Str $tname) returns Int {
            my $ex;
            my $result = xapian_database_get_collection_freq(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-collection-freq(Str $tname) returns Int {
            my $ex;
            my $result = xapian_database_get_collection_freq(self, $tname, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_value_freq(Int $slot) returns Int {
            my $ex;
            my $result = xapian_database_get_value_freq(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-value-freq(Int $slot) returns Int {
            my $ex;
            my $result = xapian_database_get_value_freq(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_value_lower_bound(Int $slot) returns Str {
            my $ex;
            my $result = xapian_database_get_value_lower_bound(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-value-lower-bound(Int $slot) returns Str {
            my $ex;
            my $result = xapian_database_get_value_lower_bound(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_value_upper_bound(Int $slot) returns Str {
            my $ex;
            my $result = xapian_database_get_value_upper_bound(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-value-upper-bound(Int $slot) returns Str {
            my $ex;
            my $result = xapian_database_get_value_upper_bound(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_doclength_lower_bound() returns Int {
            my $ex;
            my $result = xapian_database_get_doclength_lower_bound(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-doclength-lower-bound() returns Int {
            my $ex;
            my $result = xapian_database_get_doclength_lower_bound(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_doclength_upper_bound() returns Int {
            my $ex;
            my $result = xapian_database_get_doclength_upper_bound(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-doclength-upper-bound() returns Int {
            my $ex;
            my $result = xapian_database_get_doclength_upper_bound(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_wdf_upper_bound(Str $term) returns Int {
            my $ex;
            my $result = xapian_database_get_wdf_upper_bound(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-wdf-upper-bound(Str $term) returns Int {
            my $ex;
            my $result = xapian_database_get_wdf_upper_bound(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method valuestream_begin(Int $slot) returns ValueIterator {
            my $ex;
            my $result = xapian_database_valuestream_begin(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method valuestream-begin(Int $slot) returns ValueIterator {
            my $ex;
            my $result = xapian_database_valuestream_begin(self, $slot, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method valuestream_end(Int $_anon_1) returns ValueIteratorEnd_ {
            my $ex;
            my $result = xapian_database_valuestream_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method valuestream-end(Int $_anon_1) returns ValueIteratorEnd_ {
            my $ex;
            my $result = xapian_database_valuestream_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_doclength(Int $did) returns Int {
            my $ex;
            my $result = xapian_database_get_doclength(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-doclength(Int $did) returns Int {
            my $ex;
            my $result = xapian_database_get_doclength(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method keep_alive() {
            my $ex;
            my $result = xapian_database_keep_alive(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method keep-alive() {
            my $ex;
            my $result = xapian_database_keep_alive(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_document(Int $did) returns Document {
            my $ex;
            my $result = xapian_database_get_document(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-document(Int $did) returns Document {
            my $ex;
            my $result = xapian_database_get_document(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method get_spelling_suggestion(Str $word) returns Str {
            my $ex;
            my $result = xapian_database_get_spelling_suggestion(self, $word, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method get-spelling-suggestion(Str $word) returns Str {
            my $ex;
            my $result = xapian_database_get_spelling_suggestion(self, $word, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method get_spelling_suggestion(Str $word, Int $max_edit_distance) returns Str {
            my $ex;
            my $result = xapian_database_get_spelling_suggestion2(self, $word, $max_edit_distance, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method get-spelling-suggestion(Str $word, Int $max_edit_distance) returns Str {
            my $ex;
            my $result = xapian_database_get_spelling_suggestion2(self, $word, $max_edit_distance, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method spellings_begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_spellings_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method spellings-begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_spellings_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method spellings_end() returns TermIterator {
            my $ex;
            my $result = xapian_database_spellings_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method spellings-end() returns TermIterator {
            my $ex;
            my $result = xapian_database_spellings_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method synonyms_begin(Str $term) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonyms_begin(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method synonyms-begin(Str $term) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonyms_begin(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method synonyms_end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonyms_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method synonyms-end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonyms_end(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym_keys_begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym-keys-begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym_keys_begin(Str $prefix) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_begin2(self, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym-keys-begin(Str $prefix) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_begin2(self, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym_keys_end() returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym-keys-end() returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym_keys_end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_end2(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method synonym-keys-end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_synonym_keys_end2(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_metadata(Str $key) returns Str {
            my $ex;
            my $result = xapian_database_get_metadata(self, $key, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-metadata(Str $key) returns Str {
            my $ex;
            my $result = xapian_database_get_metadata(self, $key, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata_keys_begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata-keys-begin() returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_begin(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata_keys_begin(Str $prefix) returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_begin2(self, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata-keys-begin(Str $prefix) returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_begin2(self, $prefix, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata_keys_end() returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata-keys-end() returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_end(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata_keys_end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_end2(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method metadata-keys-end(Str $_anon_1) returns TermIterator {
            my $ex;
            my $result = xapian_database_metadata_keys_end2(self, $_anon_1, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_uuid() returns Str {
            my $ex;
            my $result = xapian_database_get_uuid(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-uuid() returns Str {
            my $ex;
            my $result = xapian_database_get_uuid(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

    }

    class WritableDatabase is Database {
        my sub xapian_writable_database_free(WritableDatabase $self) is native('xapian-helper') { * }
        my sub xapian_writable_database_new(&handle-error (NativeError)) returns WritableDatabase is native('xapian-helper') { * }
        my sub xapian_writable_database_new2(Str $path, int $action, &handle-error (NativeError)) returns WritableDatabase is native('xapian-helper') { * }
        my sub xapian_writable_database_commit(WritableDatabase $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_flush(WritableDatabase $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_begin_transaction(WritableDatabase $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_begin_transaction2(WritableDatabase $self, Bool $flushed, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_commit_transaction(WritableDatabase $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_cancel_transaction(WritableDatabase $self, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_add_document(WritableDatabase $self, Document $document, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_writable_database_delete_document(WritableDatabase $self, uint $did, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_delete_document2(WritableDatabase $self, Str $unique_term, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_replace_document(WritableDatabase $self, uint $did, Document $document, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_replace_document2(WritableDatabase $self, Str $unique_term, Document $document, &handle-error (NativeError)) returns uint is native('xapian-helper') { * }
        my sub xapian_writable_database_add_spelling(WritableDatabase $self, Str $word, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_add_spelling2(WritableDatabase $self, Str $word, uint $freqinc, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_remove_spelling(WritableDatabase $self, Str $word, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_remove_spelling2(WritableDatabase $self, Str $word, uint $freqdec, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_add_synonym(WritableDatabase $self, Str $term, Str $synonym, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_remove_synonym(WritableDatabase $self, Str $term, Str $synonym, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_clear_synonyms(WritableDatabase $self, Str $term, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_set_metadata(WritableDatabase $self, Str $key, Str $value, &handle-error (NativeError)) is native('xapian-helper') { * }
        my sub xapian_writable_database_get_description(WritableDatabase $self, &handle-error (NativeError)) returns Str is native('xapian-helper') { * }

        submethod DESTROY() { xapian_writable_database_free(self) }

        multi method new() returns WritableDatabase {
            my $ex;
            my $result = xapian_writable_database_new(-> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method new(Str $path, Int $action) returns WritableDatabase {
            my $ex;
            my $result = xapian_writable_database_new2($path, $action, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method commit() {
            my $ex;
            my $result = xapian_writable_database_commit(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method flush() {
            my $ex;
            my $result = xapian_writable_database_flush(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method begin_transaction() {
            my $ex;
            my $result = xapian_writable_database_begin_transaction(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method begin-transaction() {
            my $ex;
            my $result = xapian_writable_database_begin_transaction(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method begin_transaction(Bool $flushed) {
            my $ex;
            my $result = xapian_writable_database_begin_transaction2(self, $flushed, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method begin-transaction(Bool $flushed) {
            my $ex;
            my $result = xapian_writable_database_begin_transaction2(self, $flushed, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method commit_transaction() {
            my $ex;
            my $result = xapian_writable_database_commit_transaction(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method commit-transaction() {
            my $ex;
            my $result = xapian_writable_database_commit_transaction(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method cancel_transaction() {
            my $ex;
            my $result = xapian_writable_database_cancel_transaction(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method cancel-transaction() {
            my $ex;
            my $result = xapian_writable_database_cancel_transaction(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add_document(Document $document) returns Int {
            my $ex;
            my $result = xapian_writable_database_add_document(self, $document, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add-document(Document $document) returns Int {
            my $ex;
            my $result = xapian_writable_database_add_document(self, $document, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method delete_document(Int $did) {
            my $ex;
            my $result = xapian_writable_database_delete_document(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method delete-document(Int $did) {
            my $ex;
            my $result = xapian_writable_database_delete_document(self, $did, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method delete_document(Str $unique_term) {
            my $ex;
            my $result = xapian_writable_database_delete_document2(self, $unique_term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method delete-document(Str $unique_term) {
            my $ex;
            my $result = xapian_writable_database_delete_document2(self, $unique_term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method replace_document(Int $did, Document $document) {
            my $ex;
            my $result = xapian_writable_database_replace_document(self, $did, $document, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method replace-document(Int $did, Document $document) {
            my $ex;
            my $result = xapian_writable_database_replace_document(self, $did, $document, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method replace_document(Str $unique_term, Document $document) returns Int {
            my $ex;
            my $result = xapian_writable_database_replace_document2(self, $unique_term, $document, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method replace-document(Str $unique_term, Document $document) returns Int {
            my $ex;
            my $result = xapian_writable_database_replace_document2(self, $unique_term, $document, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add_spelling(Str $word) {
            my $ex;
            my $result = xapian_writable_database_add_spelling(self, $word, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add-spelling(Str $word) {
            my $ex;
            my $result = xapian_writable_database_add_spelling(self, $word, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add_spelling(Str $word, Int $freqinc) {
            my $ex;
            my $result = xapian_writable_database_add_spelling2(self, $word, $freqinc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method add-spelling(Str $word, Int $freqinc) {
            my $ex;
            my $result = xapian_writable_database_add_spelling2(self, $word, $freqinc, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove_spelling(Str $word) {
            my $ex;
            my $result = xapian_writable_database_remove_spelling(self, $word, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove-spelling(Str $word) {
            my $ex;
            my $result = xapian_writable_database_remove_spelling(self, $word, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove_spelling(Str $word, Int $freqdec) {
            my $ex;
            my $result = xapian_writable_database_remove_spelling2(self, $word, $freqdec, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        multi method remove-spelling(Str $word, Int $freqdec) {
            my $ex;
            my $result = xapian_writable_database_remove_spelling2(self, $word, $freqdec, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add_synonym(Str $term, Str $synonym) {
            my $ex;
            my $result = xapian_writable_database_add_synonym(self, $term, $synonym, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method add-synonym(Str $term, Str $synonym) {
            my $ex;
            my $result = xapian_writable_database_add_synonym(self, $term, $synonym, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method remove_synonym(Str $term, Str $synonym) {
            my $ex;
            my $result = xapian_writable_database_remove_synonym(self, $term, $synonym, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method remove-synonym(Str $term, Str $synonym) {
            my $ex;
            my $result = xapian_writable_database_remove_synonym(self, $term, $synonym, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method clear_synonyms(Str $term) {
            my $ex;
            my $result = xapian_writable_database_clear_synonyms(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method clear-synonyms(Str $term) {
            my $ex;
            my $result = xapian_writable_database_clear_synonyms(self, $term, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set_metadata(Str $key, Str $value) {
            my $ex;
            my $result = xapian_writable_database_set_metadata(self, $key, $value, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method set-metadata(Str $key, Str $value) {
            my $ex;
            my $result = xapian_writable_database_set_metadata(self, $key, $value, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get_description() returns Str {
            my $ex;
            my $result = xapian_writable_database_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method get-description() returns Str {
            my $ex;
            my $result = xapian_writable_database_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }

        method gist() returns Str {
            my $ex;
            my $result = xapian_writable_database_get_description(self, -> NativeError $error { $ex = Error.new($error) });
            $ex.throw if $ex;
            $result
        }
    }

    class QueryParser is repr('CPointer') {
        enum feature_flag (
            :Boolean(1),
            :Phrase(2),
            :Lovehate(4),
            :Boolean-Any-Case(8),
            :Wildcard(16),
            :Pure-Not(32),
            :Partial(64),
            :Spelling-Correction(128),
            :Synonym(256),
            :Auto-Synonyms(512),
            :Auto-Multiword-Synonyms(1536),
            :Default(7),
        );

        enum stem_strategy <None Some All All-Z>;
    }

    class Weight is repr('CPointer') {
        enum stat_flags (
            :Collection-Size(1),
            :Rset-Size(2),
            :Average-Length(4),
            :Termfreq(8),
            :Reltermfreq(16),
            :Query-Length(32),
            :Wqf(64),
            :Wdf(128),
            :Doc-Length(256),
            :Doc-Length-Min(512),
            :Doc-Length-Max(1024),
            :Wdf-Max(2048),
        );
    }

    class Compactor is repr('CPointer') {
        enum compaction_level <Standard Full Fuller>;
    }

    class Enquire is repr('CPointer') {
        constant INCLUDE_QUERY_TERMS = 1;
        constant USE_EXACT_TERMFREQ  = 2;
        enum docid_order <Ascending Descending Dont-Care>;
    }

    class Query is repr('CPointer') {
        enum op <And Or And-Not Xor And-Maybe Filter Near Phrase Value-Range Scale-Weight Elite-Set Value-Ge Value-Le Synonym>;
    }
}

=begin pod

=head1 NAME

Xapian

=head1 AUTHOR

Rob Hoelz <rob AT hoelz.ro>

=head1 SYNOPSIS

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

=head1 DESCRIPTION

This module provides bindings for (L<Xapian|http://xapian.org/>)
for Perl 6 via NativeCall.

=head1 LICENSE

Perl 6 bindings for the Xapian library
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

=end pod
