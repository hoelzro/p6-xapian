/*
 * Generated C wrapper for Xapian::Error
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

typedef Xapian::Error *xapian_error;

const char *
xapian_error_get_type(xapian_error self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_type();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_error_get_msg(xapian_error self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_msg();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_error_get_context(xapian_error self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_context();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_error_get_error_string(xapian_error self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->get_error_string();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_error_get_description(xapian_error self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
