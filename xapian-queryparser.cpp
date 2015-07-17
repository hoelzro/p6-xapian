/*
 * Generated C wrapper for Xapian::QueryParser
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
typedef Xapian::ValueRangeProcessor *xapian_value_range_processor;
typedef Xapian::Stopper *xapian_stopper;
typedef Xapian::Database *xapian_database;
typedef Xapian::Stem *xapian_stem;
typedef Xapian::QueryParser *xapian_query_parser;

xapian_query_parser
xapian_query_parser_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::QueryParser();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_query_parser_free(xapian_query_parser self) throw ()
{
    delete self;
}

void
xapian_query_parser_set_stemmer(xapian_query_parser self, xapian_stem stemmer, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_stemmer(*stemmer);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_query_parser_set_stemming_strategy(xapian_query_parser self, unsigned int strategy, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_stemming_strategy((Xapian::QueryParser::stem_strategy) strategy);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_query_parser_set_stopper(xapian_query_parser self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_stopper();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_query_parser_set_stopper2(xapian_query_parser self, xapian_stopper stop, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_stopper(stop);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_query_parser_set_default_op(xapian_query_parser self, unsigned int default_op, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_default_op((Xapian::Query::op) default_op);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

unsigned int
xapian_query_parser_get_default_op(xapian_query_parser self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_default_op();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

void
xapian_query_parser_set_database(xapian_query_parser self, xapian_database db, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_database(*db);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_query_parser_set_max_wildcard_expansion(xapian_query_parser self, unsigned int limit, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_max_wildcard_expansion(limit);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

xapian_query
xapian_query_parser_parse_query(xapian_query_parser self, const char * query_string, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::Query *value = new Xapian::Query();
        *value = self->parse_query(std::string(query_string));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_query
xapian_query_parser_parse_query2(xapian_query_parser self, const char * query_string, unsigned int flags, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::Query *value = new Xapian::Query();
        *value = self->parse_query(std::string(query_string), flags);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_query
xapian_query_parser_parse_query3(xapian_query_parser self, const char * query_string, unsigned int flags, const char * default_prefix, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::Query *value = new Xapian::Query();
        *value = self->parse_query(std::string(query_string), flags, std::string(default_prefix));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

void
xapian_query_parser_add_prefix(xapian_query_parser self, const char * field, const char * prefix, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_prefix(std::string(field), std::string(prefix));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_query_parser_add_boolean_prefix(xapian_query_parser self, const char * field, const char * prefix, bool exclusive, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_boolean_prefix(std::string(field), std::string(prefix), exclusive);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_query_parser_add_boolean_prefix2(xapian_query_parser self, const char * field, const char * prefix, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_boolean_prefix(std::string(field), std::string(prefix));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

xapian_term_iterator
xapian_query_parser_stoplist_begin(xapian_query_parser self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->stoplist_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_query_parser_stoplist_end(xapian_query_parser self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->stoplist_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_query_parser_unstem_begin(xapian_query_parser self, const char * term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->unstem_begin(std::string(term));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_query_parser_unstem_end(xapian_query_parser self, const char * _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->unstem_end(std::string(_anon_1));
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

void
xapian_query_parser_add_valuerangeprocessor(xapian_query_parser self, xapian_value_range_processor vrproc, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_valuerangeprocessor(vrproc);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

const char *
xapian_query_parser_get_corrected_query_string(xapian_query_parser self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_corrected_query_string();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_query_parser_get_description(xapian_query_parser self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
