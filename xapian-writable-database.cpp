/*
 * Generated C wrapper for Xapian::WritableDatabase
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
xapian_writable_database_new(void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::WritableDatabase();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_writable_database
xapian_writable_database_new2(const char * path, int action, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::WritableDatabase(std::string(path), action);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_writable_database_commit(xapian_writable_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->commit();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_flush(xapian_writable_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->flush();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_begin_transaction(xapian_writable_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->begin_transaction();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_begin_transaction2(xapian_writable_database self, bool flushed, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->begin_transaction(flushed);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_commit_transaction(xapian_writable_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->commit_transaction();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_cancel_transaction(xapian_writable_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->cancel_transaction();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

unsigned int
xapian_writable_database_add_document(xapian_writable_database self, xapian_document document, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->add_document(*document);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

void
xapian_writable_database_delete_document(xapian_writable_database self, unsigned int did, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->delete_document(did);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_delete_document2(xapian_writable_database self, const char * unique_term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->delete_document(std::string(unique_term));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_replace_document(xapian_writable_database self, unsigned int did, xapian_document document, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->replace_document(did, *document);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

unsigned int
xapian_writable_database_replace_document2(xapian_writable_database self, const char * unique_term, xapian_document document, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return self->replace_document(std::string(unique_term), *document);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return 0;
    }

}

void
xapian_writable_database_add_spelling(xapian_writable_database self, const char * word, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_spelling(std::string(word));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_add_spelling2(xapian_writable_database self, const char * word, unsigned int freqinc, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_spelling(std::string(word), freqinc);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_remove_spelling(xapian_writable_database self, const char * word, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->remove_spelling(std::string(word));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_remove_spelling2(xapian_writable_database self, const char * word, unsigned int freqdec, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->remove_spelling(std::string(word), freqdec);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_add_synonym(xapian_writable_database self, const char * term, const char * synonym, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_synonym(std::string(term), std::string(synonym));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_remove_synonym(xapian_writable_database self, const char * term, const char * synonym, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->remove_synonym(std::string(term), std::string(synonym));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_clear_synonyms(xapian_writable_database self, const char * term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->clear_synonyms(std::string(term));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_writable_database_set_metadata(xapian_writable_database self, const char * key, const char * value, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_metadata(std::string(key), std::string(value));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

const char *
xapian_writable_database_get_description(xapian_writable_database self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
