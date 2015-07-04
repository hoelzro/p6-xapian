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

#include <string>
#include <cstring>

#include <xapian.h>

extern "C" {

typedef Xapian::TermGenerator *xapian_term_generator;
typedef Xapian::Stem *xapian_stem;
typedef Xapian::Stopper *xapian_stopper;
typedef Xapian::Document *xapian_document;
typedef Xapian::WritableDatabase *xapian_writable_database;

xapian_term_generator
xapian_term_generator_new(void)
{
    return new Xapian::TermGenerator();
}

void
xapian_term_generator_free(xapian_term_generator self)
{
    delete self;
}

void
xapian_term_generator_set_stemmer(xapian_term_generator self, xapian_stem stemmer)
{
    self->set_stemmer(*stemmer);
}

void
xapian_term_generator_set_stopper(xapian_term_generator self, xapian_stopper stopper)
{
    self->set_stopper(stopper);
}

void
xapian_term_generator_set_document(xapian_term_generator self, xapian_document document)
{
    self->set_document(*document);
}

/*
const xapian_document
xapian_term_generator_get_document(xapian_term_generator self)
{
    return &(self->get_document());
}
*/

void
xapian_term_generator_set_database(xapian_term_generator self, xapian_writable_database db)
{
    self->set_database(*db);
}

/*
int
xapian_term_generator_set_flags(xapian_term_generator self, int toggle)
{
    return self->set_flags(toggle);
}

int
xapian_term_generator_set_flags2(xapian_term_generator self, int toggle, int mask)
{
    return self->set_flags(toggle, mask);
}

void
xapian_term_generator_set_stemming_strategy(xapian_term_generator self, int strategy)
{
    self->set_stemming_strategy(strategy);
}
*/

void
xapian_term_generator_set_max_word_length(xapian_term_generator self, unsigned int max_word_length)
{
    self->set_max_word_length(max_word_length);
}

void
xapian_term_generator_index_text(xapian_term_generator self, const char *text)
{
    self->index_text(std::string(text));
}

void
xapian_term_generator_index_text2(xapian_term_generator self, const char *text, unsigned wdf_inc)
{
    self->index_text(std::string(text), wdf_inc);
}

void
xapian_term_generator_index_text3(xapian_term_generator self, const char *text, unsigned wdf_inc, const char *prefix)
{
    self->index_text(std::string(text), wdf_inc, std::string(prefix));
}

void
xapian_term_generator_index_text_without_positions(xapian_term_generator self, const char *text)
{
    self->index_text_without_positions(std::string(text));
}

void
xapian_term_generator_index_text_without_positions2(xapian_term_generator self, const char *text, unsigned wdf_inc)
{
    self->index_text_without_positions(std::string(text), wdf_inc);
}

void
xapian_term_generator_index_text_without_positions3(xapian_term_generator self, const char *text, unsigned wdf_inc, const char *prefix)
{
    self->index_text_without_positions(std::string(text), wdf_inc, std::string(prefix));
}

void
xapian_term_generator_increase_termpos(xapian_term_generator self)
{
    self->increase_termpos();
}

void
xapian_term_generator_increase_termpos2(xapian_term_generator self, unsigned int delta)
{
    self->increase_termpos(delta);
}

unsigned int
xapian_term_generator_get_termpos(xapian_term_generator self)
{
    return self->get_termpos();
}

void
xapian_term_generator_set_termpos(xapian_term_generator self, unsigned int termpos)
{
    self->set_termpos(termpos);
}

const char *
xapian_term_generator_get_description(xapian_term_generator self)
{
    std::string description = self->get_description();
    return strdup(description.c_str());
}

}
