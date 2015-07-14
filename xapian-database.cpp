/*
 * Generated C wrapper for Xapian::Database
 * Copyright (C) 2015 Rob Hoelz (rob AT hoelz.ro)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#include <cstring>
#include <string>

#include <xapian.h>

#include "version-check.h"

extern "C" {

typedef Xapian::Document *xapian_document;
typedef Xapian::TermIterator *xapian_term_iterator;
typedef Xapian::PostingIterator *xapian_posting_iterator;
typedef Xapian::Database *xapian_database;
typedef Xapian::PositionIterator *xapian_position_iterator;
typedef Xapian::ValueIteratorEnd_ *xapian_value_iterator_end_;
typedef Xapian::ValueIterator *xapian_value_iterator;

void
xapian_database_add_database(xapian_database self, xapian_database database, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_database(*database);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

xapian_database
xapian_database_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Database();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_database
xapian_database_new2(const char * path, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Database(std::string(path));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_database_free(xapian_database self) throw ()
{
    delete self;
}

void
xapian_database_reopen(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->reopen();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_database_close(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->close();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

const char *
xapian_database_get_description(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_description();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_posting_iterator
xapian_database_postlist_begin(xapian_database self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::PostingIterator *value = new Xapian::PostingIterator();
        *value = self->postlist_begin(std::string(tname));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_posting_iterator
xapian_database_postlist_end(xapian_database self, const char * _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::PostingIterator *value = new Xapian::PostingIterator();
        *value = self->postlist_end(std::string(_anon_1));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_termlist_begin(xapian_database self, unsigned int did, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->termlist_begin(did);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_termlist_end(xapian_database self, unsigned int _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->termlist_end(_anon_1);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

bool
xapian_database_has_positions(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->has_positions();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return false;
    }

}

xapian_position_iterator
xapian_database_positionlist_begin(xapian_database self, unsigned int did, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::PositionIterator *value = new Xapian::PositionIterator();
        *value = self->positionlist_begin(did, std::string(tname));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_position_iterator
xapian_database_positionlist_end(xapian_database self, unsigned int _anon_1, const char * _anon_2, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::PositionIterator *value = new Xapian::PositionIterator();
        *value = self->positionlist_end(_anon_1, std::string(_anon_2));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_allterms_begin(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->allterms_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_allterms_end(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->allterms_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_allterms_begin2(xapian_database self, const char * prefix, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->allterms_begin(std::string(prefix));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_allterms_end2(xapian_database self, const char * _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->allterms_end(std::string(_anon_1));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_database_get_doccount(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_doccount();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_database_get_lastdocid(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_lastdocid();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_database_get_avlength(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_avlength();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_database_get_termfreq(xapian_database self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_termfreq(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

bool
xapian_database_term_exists(xapian_database self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->term_exists(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return false;
    }

}

unsigned int
xapian_database_get_collection_freq(xapian_database self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_collection_freq(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_database_get_value_freq(xapian_database self, unsigned int slot, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_value_freq(slot);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

const char *
xapian_database_get_value_lower_bound(xapian_database self, unsigned int slot, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_value_lower_bound(slot);
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_database_get_value_upper_bound(xapian_database self, unsigned int slot, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_value_upper_bound(slot);
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_database_get_doclength_lower_bound(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_doclength_lower_bound();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_database_get_doclength_upper_bound(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_doclength_upper_bound();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_database_get_wdf_upper_bound(xapian_database self, const char * term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_wdf_upper_bound(std::string(term));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

xapian_value_iterator
xapian_database_valuestream_begin(xapian_database self, unsigned int slot, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ValueIterator *value = new Xapian::ValueIterator();
        *value = self->valuestream_begin(slot);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_value_iterator_end_
xapian_database_valuestream_end(xapian_database self, unsigned int _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ValueIteratorEnd_ *value = new Xapian::ValueIteratorEnd_();
        *value = self->valuestream_end(_anon_1);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_database_get_doclength(xapian_database self, unsigned int did, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_doclength(did);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

void
xapian_database_keep_alive(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->keep_alive();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

xapian_document
xapian_database_get_document(xapian_database self, unsigned int did, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::Document *value = new Xapian::Document();
        *value = self->get_document(did);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_database_get_spelling_suggestion(xapian_database self, const char * word, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_spelling_suggestion(std::string(word));
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_database_get_spelling_suggestion2(xapian_database self, const char * word, unsigned int max_edit_distance, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_spelling_suggestion(std::string(word), max_edit_distance);
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_spellings_begin(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->spellings_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_spellings_end(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->spellings_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_synonyms_begin(xapian_database self, const char * term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->synonyms_begin(std::string(term));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_synonyms_end(xapian_database self, const char * _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->synonyms_end(std::string(_anon_1));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_synonym_keys_begin(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->synonym_keys_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_synonym_keys_begin2(xapian_database self, const char * prefix, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->synonym_keys_begin(std::string(prefix));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_synonym_keys_end(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->synonym_keys_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_synonym_keys_end2(xapian_database self, const char * _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->synonym_keys_end(std::string(_anon_1));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_database_get_metadata(xapian_database self, const char * key, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_metadata(std::string(key));
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_metadata_keys_begin(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->metadata_keys_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_metadata_keys_begin2(xapian_database self, const char * prefix, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->metadata_keys_begin(std::string(prefix));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_metadata_keys_end(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->metadata_keys_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_database_metadata_keys_end2(xapian_database self, const char * _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->metadata_keys_end(std::string(_anon_1));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_database_get_uuid(xapian_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_uuid();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

}
