#include <cstring>
#include <string>

#include <xapian.h>

extern "C" {

typedef Xapian::Document *xapian_document;
typedef Xapian::WritableDatabase *xapian_writable_database;

void
xapian_writable_database_free(xapian_writable_database self)
{
    delete self;
}

xapian_writable_database
xapian_writable_database_new(void)
{
    return new Xapian::WritableDatabase();
}

xapian_writable_database
xapian_writable_database_new2(const char * path, int action)
{
    return new Xapian::WritableDatabase(std::string(path), action);
}

void
xapian_writable_database_commit(xapian_writable_database self)
{
     self->commit();
}

void
xapian_writable_database_flush(xapian_writable_database self)
{
     self->flush();
}

void
xapian_writable_database_begin_transaction(xapian_writable_database self)
{
     self->begin_transaction();
}

void
xapian_writable_database_begin_transaction2(xapian_writable_database self, bool flushed)
{
     self->begin_transaction(flushed);
}

void
xapian_writable_database_commit_transaction(xapian_writable_database self)
{
     self->commit_transaction();
}

void
xapian_writable_database_cancel_transaction(xapian_writable_database self)
{
     self->cancel_transaction();
}

unsigned int
xapian_writable_database_add_document(xapian_writable_database self, xapian_document document)
{
    return self->add_document(*document);
}

void
xapian_writable_database_delete_document(xapian_writable_database self, unsigned int did)
{
     self->delete_document(did);
}

void
xapian_writable_database_delete_document2(xapian_writable_database self, const char * unique_term)
{
     self->delete_document(std::string(unique_term));
}

void
xapian_writable_database_replace_document(xapian_writable_database self, unsigned int did, xapian_document document)
{
     self->replace_document(did, *document);
}

unsigned int
xapian_writable_database_replace_document2(xapian_writable_database self, const char * unique_term, xapian_document document)
{
    return self->replace_document(std::string(unique_term), *document);
}

void
xapian_writable_database_add_spelling(xapian_writable_database self, const char * word)
{
     self->add_spelling(std::string(word));
}

void
xapian_writable_database_add_spelling2(xapian_writable_database self, const char * word, unsigned int freqinc)
{
     self->add_spelling(std::string(word), freqinc);
}

void
xapian_writable_database_remove_spelling(xapian_writable_database self, const char * word)
{
     self->remove_spelling(std::string(word));
}

void
xapian_writable_database_remove_spelling2(xapian_writable_database self, const char * word, unsigned int freqdec)
{
     self->remove_spelling(std::string(word), freqdec);
}

void
xapian_writable_database_add_synonym(xapian_writable_database self, const char * term, const char * synonym)
{
     self->add_synonym(std::string(term), std::string(synonym));
}

void
xapian_writable_database_remove_synonym(xapian_writable_database self, const char * term, const char * synonym)
{
     self->remove_synonym(std::string(term), std::string(synonym));
}

void
xapian_writable_database_clear_synonyms(xapian_writable_database self, const char * term)
{
     self->clear_synonyms(std::string(term));
}

void
xapian_writable_database_set_metadata(xapian_writable_database self, const char * key, const char * value)
{
     self->set_metadata(std::string(key), std::string(value));
}

const char *
xapian_writable_database_get_description(xapian_writable_database self)
{
    std::string value = self->get_description();
    return strdup(value.c_str());
}

}

