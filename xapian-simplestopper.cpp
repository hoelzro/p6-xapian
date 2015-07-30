/*
 * Generated C wrapper for Xapian::SimpleStopper
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

typedef Xapian::SimpleStopper *xapian_simple_stopper;

xapian_simple_stopper
xapian_simple_stopper_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::SimpleStopper();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_simple_stopper_add(xapian_simple_stopper self, const char * word, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add(std::string(word));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

bool
xapian_simple_stopper_call(xapian_simple_stopper self, const char * term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return (*self)(std::string(term));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return false;
    }

}

const char *
xapian_simple_stopper_get_description(xapian_simple_stopper self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
