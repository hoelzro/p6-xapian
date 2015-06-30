#include <cstring>
#include <string>

#include <xapian.h>

extern "C" {

typedef Xapian::Document *xapian_document;

xapian_document
xapian_document_new(void)
{
}

void
xapian_document_free(xapian_document self)
{
}

const char *
xapian_document_get_value(int slot)
{
}

void
xapian_document_add_value(int slot, const char *value)
{
}

void
xapian_document_remove_value(int slot)
{
}

void
xapian_document_clear_values(void)
{
}

const char *
xapian_document_get_data(void)
{
}

void
xapian_document_set_data(const char *data)
{
}

// XXX optional argument?
void
xapian_document_add_posting(const char *term, unsigned int tpos, unsigned int wdfinc)
{
}

void
xapian_document_add_term(const char *term, unsigned int wdfinc)
{
}

void
xapian_document_add_boolean_term(const char *term)
{
}

void
xapian_document_remove_posting(const char *term, unsigned int tpos, unsigned int wdfdec)
{
}

void
xapian_document_remove_term(const char *term)
{
}

void
xapian_document_clear_terms(void)
{
}

unsigned int
xapian_document_termlist_count(void)
{
}


/*
termlist_begin
termlist_end
*/

unsigned int
xapian_document_values_count(void)
{
}

/*
values_begin
values_end
*/

unsigned int
xapian_document_get_docid(void)
{
}

const char *
xapian_document_get_description(void)
{
}

}
