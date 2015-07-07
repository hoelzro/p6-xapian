/*
 * Generate C wrapper and Perl 6 bindings for a C++ class
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

typedef Xapian::Database *xapian_database;

void
xapian_database_add_database(xapian_database self, xapian_database database) throw ()
{
     self->add_database(*database);
}

xapian_database
xapian_database_new(void) throw ()
{
    return new Xapian::Database();
}

xapian_database
xapian_database_new2(const char * path) throw ()
{
    return new Xapian::Database(std::string(path));
}

void
xapian_database_free(xapian_database self) throw ()
{
    delete self;
}

void
xapian_database_reopen(xapian_database self) throw ()
{
     self->reopen();
}

void
xapian_database_close(xapian_database self) throw ()
{
     self->close();
}

const char *
xapian_database_get_description(xapian_database self) throw ()
{
    std::string value = self->get_description();
    return strdup(value.c_str());
}

bool
xapian_database_has_positions(xapian_database self) throw ()
{
    return self->has_positions();
}

unsigned int
xapian_database_get_doccount(xapian_database self) throw ()
{
    return self->get_doccount();
}

unsigned int
xapian_database_get_lastdocid(xapian_database self) throw ()
{
    return self->get_lastdocid();
}

unsigned int
xapian_database_get_avlength(xapian_database self) throw ()
{
    return self->get_avlength();
}

unsigned int
xapian_database_get_termfreq(xapian_database self, const char * tname) throw ()
{
    return self->get_termfreq(std::string(tname));
}

bool
xapian_database_term_exists(xapian_database self, const char * tname) throw ()
{
    return self->term_exists(std::string(tname));
}

unsigned int
xapian_database_get_collection_freq(xapian_database self, const char * tname) throw ()
{
    return self->get_collection_freq(std::string(tname));
}

unsigned int
xapian_database_get_value_freq(xapian_database self, unsigned int slot) throw ()
{
    return self->get_value_freq(slot);
}

const char *
xapian_database_get_value_lower_bound(xapian_database self, unsigned int slot) throw ()
{
    std::string value = self->get_value_lower_bound(slot);
    return strdup(value.c_str());
}

const char *
xapian_database_get_value_upper_bound(xapian_database self, unsigned int slot) throw ()
{
    std::string value = self->get_value_upper_bound(slot);
    return strdup(value.c_str());
}

unsigned int
xapian_database_get_doclength_lower_bound(xapian_database self) throw ()
{
    return self->get_doclength_lower_bound();
}

unsigned int
xapian_database_get_doclength_upper_bound(xapian_database self) throw ()
{
    return self->get_doclength_upper_bound();
}

unsigned int
xapian_database_get_wdf_upper_bound(xapian_database self, const char * term) throw ()
{
    return self->get_wdf_upper_bound(std::string(term));
}

unsigned int
xapian_database_get_doclength(xapian_database self, unsigned int did) throw ()
{
    return self->get_doclength(did);
}

void
xapian_database_keep_alive(xapian_database self) throw ()
{
     self->keep_alive();
}

const char *
xapian_database_get_spelling_suggestion(xapian_database self, const char * word) throw ()
{
    std::string value = self->get_spelling_suggestion(std::string(word));
    return strdup(value.c_str());
}

const char *
xapian_database_get_spelling_suggestion2(xapian_database self, const char * word, unsigned int max_edit_distance) throw ()
{
    std::string value = self->get_spelling_suggestion(std::string(word), max_edit_distance);
    return strdup(value.c_str());
}

const char *
xapian_database_get_metadata(xapian_database self, const char * key) throw ()
{
    std::string value = self->get_metadata(std::string(key));
    return strdup(value.c_str());
}

const char *
xapian_database_get_uuid(xapian_database self) throw ()
{
    std::string value = self->get_uuid();
    return strdup(value.c_str());
}

}

