/*
 * Generated C wrapper for Xapian::MSetIterator
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
typedef Xapian::Document *xapian_document;

xapian_mset_iterator
xapian_mset_iterator_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::MSetIterator();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_mset_iterator
xapian_mset_iterator_succ(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSetIterator *value = new Xapian::MSetIterator();
        *value = *self; value++;
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset_iterator
xapian_mset_iterator_pred(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSetIterator *value = new Xapian::MSetIterator();
        *value = *self; value--;
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_mset_iterator_deref(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return *(*self);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

xapian_document
xapian_mset_iterator_get_document(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::Document *value = new Xapian::Document();
        *value = self->get_document();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_mset_iterator_get_rank(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_rank();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

double
xapian_mset_iterator_get_weight(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_weight();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

const char *
xapian_mset_iterator_get_collapse_key(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_collapse_key();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

unsigned int
xapian_mset_iterator_get_collapse_count(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_collapse_count();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

int
xapian_mset_iterator_get_percent(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_percent();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

const char *
xapian_mset_iterator_get_description(xapian_mset_iterator self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
