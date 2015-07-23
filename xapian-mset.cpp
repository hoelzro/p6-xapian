/*
 * Generated C wrapper for Xapian::MSet
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

typedef Xapian::MSetIterator *xapian_mset_iterator;
typedef Xapian::MSet *xapian_mset;

xapian_mset
xapian_mset_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::MSet();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_mset_free(xapian_mset self) throw ()
{
    delete self;
}

void
xapian_mset_fetch(xapian_mset self, xapian_mset_iterator begin, xapian_mset_iterator end, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->fetch(*begin, *end);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_mset_fetch2(xapian_mset self, xapian_mset_iterator item, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->fetch(*item);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_mset_fetch3(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->fetch();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

int
xapian_mset_convert_to_percent(xapian_mset self, double wt, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->convert_to_percent(wt);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

int
xapian_mset_convert_to_percent2(xapian_mset self, xapian_mset_iterator it, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->convert_to_percent(*it);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_termfreq(xapian_mset self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_termfreq(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

double
xapian_mset_get_termweight(xapian_mset self, const char * tname, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_termweight(std::string(tname));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_firstitem(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_firstitem();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_matches_lower_bound(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_matches_lower_bound();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_matches_estimated(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_matches_estimated();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_matches_upper_bound(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_matches_upper_bound();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_uncollapsed_matches_lower_bound(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_uncollapsed_matches_lower_bound();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_uncollapsed_matches_estimated(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_uncollapsed_matches_estimated();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_get_uncollapsed_matches_upper_bound(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_uncollapsed_matches_upper_bound();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

double
xapian_mset_get_max_possible(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_max_possible();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

double
xapian_mset_get_max_attained(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_max_attained();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_size(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->size();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

unsigned int
xapian_mset_max_size(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->max_size();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

bool
xapian_mset_empty(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->empty();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return false;
    }

}

void
xapian_mset_swap(xapian_mset self, xapian_mset other, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->swap(*other);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

xapian_mset_iterator
xapian_mset_begin(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSetIterator *value = new Xapian::MSetIterator();
        *value = self->begin();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset_iterator
xapian_mset_end(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSetIterator *value = new Xapian::MSetIterator();
        *value = self->end();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset_iterator
xapian_mset_back(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSetIterator *value = new Xapian::MSetIterator();
        *value = self->back();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset_iterator
xapian_mset_at_pos(xapian_mset self, unsigned int i, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSetIterator *value = new Xapian::MSetIterator();
        *value = (*self)[i];
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_mset_get_description(xapian_mset self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
