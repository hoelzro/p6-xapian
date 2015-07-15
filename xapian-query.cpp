/*
 * Generated C wrapper for Xapian::Query
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
typedef Xapian::Query *xapian_query;
typedef Xapian::PostingSource *xapian_posting_source;

xapian_query
xapian_query_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_query_free(xapian_query self) throw ()
{
    delete self;
}

xapian_query
xapian_query_new2(const char * tname_, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query(std::string(tname_));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new3(const char * tname_, unsigned int wqf_, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query(std::string(tname_), wqf_);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new4(const char * tname_, unsigned int wqf_, unsigned int pos_, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query(std::string(tname_), wqf_, pos_);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new5(unsigned int op_, xapian_query left, xapian_query right, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query((Xapian::Query::op) op_, *left, *right);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new6(unsigned int op_, const char * left, const char * right, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query((Xapian::Query::op) op_, std::string(left), std::string(right));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new7(unsigned int op_, xapian_query q, double parameter, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query((Xapian::Query::op) op_, *q, parameter);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new8(unsigned int op_, unsigned int slot, const char * begin, const char * end, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query((Xapian::Query::op) op_, slot, std::string(begin), std::string(end));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new9(unsigned int op_, unsigned int slot, const char * value, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query((Xapian::Query::op) op_, slot, std::string(value));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_query
xapian_query_new10(xapian_posting_source external_source, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Query(external_source);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

unsigned int
xapian_query_get_length(xapian_query self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_length();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

xapian_term_iterator
xapian_query_get_terms_begin(xapian_query self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->get_terms_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_query_get_terms_end(xapian_query self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->get_terms_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

bool
xapian_query_empty(xapian_query self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->empty();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return false;
    }

}

const char *
xapian_query_serialise(xapian_query self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
xapian_query_get_description(xapian_query self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_description();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

}
