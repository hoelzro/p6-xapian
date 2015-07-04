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

extern "C" {

typedef Xapian::Document *xapian_document;

xapian_document
xapian_document_new(void)
{
    return new Xapian::Document();
}

void
xapian_document_free(xapian_document self)
{
    delete self;
}

const char *
xapian_document_get_value(xapian_document self, int slot)
{
    std::string value = self->get_value(slot);
    return strdup(value.c_str());
}

void
xapian_document_add_value(xapian_document self, int slot, const char *value)
{
    self->add_value(slot, std::string(value));
}

void
xapian_document_remove_value(xapian_document self, int slot)
{
    self->remove_value(slot);
}

void
xapian_document_clear_values(xapian_document self)
{
    self->clear_values();
}

const char *
xapian_document_get_data(xapian_document self)
{
    std::string data = self->get_data();
    return strdup(data.c_str());
}

void
xapian_document_set_data(xapian_document self, const char *data)
{
    self->set_data(std::string(data));
}

void
xapian_document_add_posting(xapian_document self, const char *term, unsigned int tpos)
{
    self->add_posting(std::string(term), tpos);
}

void
xapian_document_add_posting2(xapian_document self, const char *term, unsigned int tpos, unsigned int wdfinc)
{
    self->add_posting(std::string(term), tpos, wdfinc);
}

void
xapian_document_add_term(xapian_document self, const char *term)
{
    self->add_term(std::string(term));
}

void
xapian_document_add_term2(xapian_document self, const char *term, unsigned int wdfinc)
{
    self->add_term(std::string(term), wdfinc);
}

void
xapian_document_add_boolean_term(xapian_document self, const char *term)
{
    self->add_boolean_term(std::string(term));
}

void
xapian_document_remove_posting(xapian_document self, const char *term, unsigned int tpos)
{
    self->remove_posting(std::string(term), tpos);
}

void
xapian_document_remove_posting2(xapian_document self, const char *term, unsigned int tpos, unsigned int wdfdec)
{
    self->remove_posting(std::string(term), tpos, wdfdec);
}

void
xapian_document_remove_term(xapian_document self, const char *term)
{
    self->remove_term(std::string(term));
}

void
xapian_document_clear_terms(xapian_document self)
{
    self->clear_values();
}

unsigned int
xapian_document_termlist_count(xapian_document self)
{
    return self->termlist_count();
}


/*
termlist_begin
termlist_end
*/

unsigned int
xapian_document_values_count(xapian_document self)
{
    return self->values_count();
}

/*
values_begin
values_end
*/

unsigned int
xapian_document_get_docid(xapian_document self)
{
    return self->get_docid();
}

const char *
xapian_document_get_description(xapian_document self)
{
    std::string description = self->get_description();
    return strdup(description.c_str());
}

}
