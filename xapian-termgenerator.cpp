#include <string>
#include <cstring>

#include <xapian.h>

extern "C" {

typedef Xapian::TermGenerator *xapian_term_generator;

xapian_term_generator
xapian_term_generator_new(void)
{
}

void
xapian_term_generator_free(xapian_term_generator self)
{
}

void
xapian_term_generator_set_stemmer(xapian_term_generator self, xapian_stemmer stemmer)
{
}

void
xapian_term_generator_set_stopper(xapian_term_generator self, xapian_stopper stopper)
{
}

void
xapian_term_generator_set_document(xapian_term_generator self, xapian_document document)
{
}

xapian_document
xapian_term_generator_get_document(xapian_term_generator self)
{
}

void
xapian_term_generator_set_database(xapian_term_generator self, xapian_writable_database db)
{
}

int
xapian_term_generator_set_flags(xapian_term_generator self, int toggle)
{
}

int
xapian_term_generator_set_flags2(xapian_term_generator self, int toggle, int mask)
{
}

void
xapian_term_generator_set_stemming_strategy(xapian_term_generator self, int strategy)
{
}

void
xapian_term_generator_set_max_word_length(xapian_term_generator self, unsigned int max_word_length)
{
}

void
xapian_term_generator_index_text(xapian_term_generator self, const char *text)
{
}

void
xapian_term_generator_index_text2(xapian_term_generator self, const char *text, unsigned wdf_inc)
{
}

void
xapian_term_generator_index_text3(xapian_term_generator self, const char *text, unsigned wdf_inc, const char *prefix)
{
}

void
xapian_term_generator_index_text_without_positions(xapian_term_generator self, const char *text)
{
}

void
xapian_term_generator_index_text_without_positions2(xapian_term_generator self, const char *text, unsigned wdf_inc)
{
}

void
xapian_term_generator_index_text_without_positions3(xapian_term_generator self, const char *text, unsigned wdf_inc, const char *prefix)
{
}

void
xapian_term_generator_increase_termpos(xapian_term_generator self)
{
}

void
xapian_term_generator_increase_termpos2(xapian_term_generator self, unsigned int delta)
{
}

unsigned int
xapian_term_generator_get_termpos(xapian_term_generator self)
{
}

void
xapian_term_generator_set_termpos(xapian_term_generator self, unsigned int termpos)
{
}

const char *
xapian_term_generator_get_description(xapian_term_generator self)
{
}

}
