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

typedef Xapian::Document *xapian_document;
typedef Xapian::WritableDatabase *xapian_writable_database;

void
xapian_writable_database_free(xapian_writable_database self) throw ()
{
    delete self;
}

xapian_writable_database
xapian_writable_database_new(void) throw ()
{
    return new Xapian::WritableDatabase();
}

xapian_writable_database
xapian_writable_database_new2(const char * path, int action) throw ()
{
    return new Xapian::WritableDatabase(std::string(path), action);
}

void
xapian_writable_database_commit(xapian_writable_database self) throw ()
{
    self->commit();
}

void
xapian_writable_database_flush(xapian_writable_database self) throw ()
{
    self->flush();
}

void
xapian_writable_database_begin_transaction(xapian_writable_database self) throw ()
{
    self->begin_transaction();
}

void
xapian_writable_database_begin_transaction2(xapian_writable_database self, bool flushed) throw ()
{
    self->begin_transaction(flushed);
}

void
xapian_writable_database_commit_transaction(xapian_writable_database self) throw ()
{
    self->commit_transaction();
}

void
xapian_writable_database_cancel_transaction(xapian_writable_database self) throw ()
{
    self->cancel_transaction();
}

unsigned int
xapian_writable_database_add_document(xapian_writable_database self, xapian_document document) throw ()
{
    return self->add_document(*document);
}

void
xapian_writable_database_delete_document(xapian_writable_database self, unsigned int did) throw ()
{
    self->delete_document(did);
}

void
xapian_writable_database_delete_document2(xapian_writable_database self, const char * unique_term) throw ()
{
    self->delete_document(std::string(unique_term));
}

void
xapian_writable_database_replace_document(xapian_writable_database self, unsigned int did, xapian_document document) throw ()
{
    self->replace_document(did, *document);
}

unsigned int
xapian_writable_database_replace_document2(xapian_writable_database self, const char * unique_term, xapian_document document) throw ()
{
    return self->replace_document(std::string(unique_term), *document);
}

void
xapian_writable_database_add_spelling(xapian_writable_database self, const char * word) throw ()
{
    self->add_spelling(std::string(word));
}

void
xapian_writable_database_add_spelling2(xapian_writable_database self, const char * word, unsigned int freqinc) throw ()
{
    self->add_spelling(std::string(word), freqinc);
}

void
xapian_writable_database_remove_spelling(xapian_writable_database self, const char * word) throw ()
{
    self->remove_spelling(std::string(word));
}

void
xapian_writable_database_remove_spelling2(xapian_writable_database self, const char * word, unsigned int freqdec) throw ()
{
    self->remove_spelling(std::string(word), freqdec);
}

void
xapian_writable_database_add_synonym(xapian_writable_database self, const char * term, const char * synonym) throw ()
{
    self->add_synonym(std::string(term), std::string(synonym));
}

void
xapian_writable_database_remove_synonym(xapian_writable_database self, const char * term, const char * synonym) throw ()
{
    self->remove_synonym(std::string(term), std::string(synonym));
}

void
xapian_writable_database_clear_synonyms(xapian_writable_database self, const char * term) throw ()
{
    self->clear_synonyms(std::string(term));
}

void
xapian_writable_database_set_metadata(xapian_writable_database self, const char * key, const char * value) throw ()
{
    self->set_metadata(std::string(key), std::string(value));
}

const char *
xapian_writable_database_get_description(xapian_writable_database self) throw ()
{
    std::string value = self->get_description();
    return strdup(value.c_str());
}

}
