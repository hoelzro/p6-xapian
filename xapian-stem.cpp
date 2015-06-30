#include <cstring>
#include <string>

#include <xapian.h>

extern "C" {

typedef Xapian::Stem *xapian_stem;

xapian_stem
xapian_stem_new(void)
{
    return new Xapian::Stem();
}

xapian_stem
xapian_stem_new_language(const char *language)
{
    return new Xapian::Stem(std::string(language));
}

void
xapian_stem_free(xapian_stem self)
{
    delete self;
}

const char *
xapian_stem_call(xapian_stem self, const char *word)
{
    std::string stemmed = (*self)(std::string(word));
    return strdup(stemmed.c_str());
}

const char *
xapian_stem_description(xapian_stem self)
{
    std::string description = self->get_description();
    return strdup(description.c_str());
}

}
