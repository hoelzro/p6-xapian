/*
 * Generated C wrapper for Xapian::Document
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

typedef Xapian::TermIterator *xapian_term_iterator;
typedef Xapian::Document *xapian_document;
typedef Xapian::ValueIteratorEnd_ *xapian_value_iterator_end_;
typedef Xapian::ValueIterator *xapian_value_iterator;

xapian_document
xapian_document_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Document();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_document_free(xapian_document self) throw ()
{
    delete self;
}

const char *
xapian_document_get_value(xapian_document self, unsigned int slot, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_value(slot);
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

void
xapian_document_add_value(xapian_document self, unsigned int slot, const char * value, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_value(slot, std::string(value));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_remove_value(xapian_document self, unsigned int slot, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->remove_value(slot);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_clear_values(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->clear_values();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

const char *
xapian_document_get_data(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_data();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

void
xapian_document_set_data(xapian_document self, const char * data, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_data(std::string(data));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_add_posting(xapian_document self, const char * tname, unsigned int tpos, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_posting(std::string(tname), tpos);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_add_posting2(xapian_document self, const char * tname, unsigned int tpos, unsigned int wdfinc, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_posting(std::string(tname), tpos, wdfinc);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_add_term(xapian_document self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_term(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_add_term2(xapian_document self, const char * tname, unsigned int wdfinc, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_term(std::string(tname), wdfinc);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_add_boolean_term(xapian_document self, const char * term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_boolean_term(std::string(term));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_remove_posting(xapian_document self, const char * tname, unsigned int tpos, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->remove_posting(std::string(tname), tpos);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_remove_posting2(xapian_document self, const char * tname, unsigned int tpos, unsigned int wdfdec, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->remove_posting(std::string(tname), tpos, wdfdec);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_remove_term(xapian_document self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->remove_term(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_document_clear_terms(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->clear_terms();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

unsigned int
xapian_document_termlist_count(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->termlist_count();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

xapian_term_iterator
xapian_document_termlist_begin(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->termlist_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_document_termlist_end(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->termlist_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_document_values_count(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->values_count();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

xapian_value_iterator
xapian_document_values_begin(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ValueIterator *value = new Xapian::ValueIterator();
        *value = self->values_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_value_iterator_end_
xapian_document_values_end(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ValueIteratorEnd_ *value = new Xapian::ValueIteratorEnd_();
        *value = self->values_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_document_get_docid(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_docid();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

const char *
xapian_document_serialise(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->serialise();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_document_get_description(xapian_document self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_description();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_document
xapian_document_unserialise(const char *s, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::Document *value = new Xapian::Document();
        *value = Xapian::Document::unserialise(std::string(s));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

}
