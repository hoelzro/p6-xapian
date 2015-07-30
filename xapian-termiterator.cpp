/*
 * Generated C wrapper for Xapian::TermIterator
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
typedef Xapian::PositionIterator *xapian_position_iterator;

xapian_term_iterator
xapian_term_iterator_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::TermIterator();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_term_iterator_free(xapian_term_iterator self) throw ()
{
    delete self;
}

const char *
xapian_term_iterator_deref(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = *(*self);
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_term_iterator_succ(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = *self; (*value)++;
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

void
xapian_term_iterator_skip_to(xapian_term_iterator self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->skip_to(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

unsigned int
xapian_term_iterator_get_wdf(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_wdf();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_term_iterator_get_termfreq(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_termfreq();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_term_iterator_positionlist_count(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->positionlist_count();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

xapian_position_iterator
xapian_term_iterator_positionlist_begin(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::PositionIterator *value = new Xapian::PositionIterator();
        *value = self->positionlist_begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_position_iterator
xapian_term_iterator_positionlist_end(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::PositionIterator *value = new Xapian::PositionIterator();
        *value = self->positionlist_end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_term_iterator_get_description(xapian_term_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
