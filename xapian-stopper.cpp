/*
 * Generated C wrapper for Xapian::Stopper
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

class Perl6Subclass : public Xapian::Stopper {
    public:
        Perl6Subclass(bool (*override_call_me)(const char *), const char *(*override_get_description)(void))
            :override_call_me(override_call_me),
             override_get_description(override_get_description)
        {}

        virtual bool operator()(const std::string &term) const
        {
            return override_call_me(term.c_str());
        }

        // XXX we have no guarantee that the GC won't free
        //     the returned char * before we have a chance
        //     to make a copy of it...
        virtual std::string get_description() const
        {
            if(override_get_description) {
                return std::string(override_get_description());
            } else {
                return Xapian::Stopper::get_description();
            }
        }

    private:
        bool (*override_call_me)(const char *);
        const char *(*override_get_description)(void);
};

extern "C" {

typedef Xapian::Stopper *xapian_stopper;

bool
xapian_stopper_call(xapian_stopper self, const char * term, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return (*self)(std::string(term));
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return false;
    }

}

void
xapian_stopper_free(xapian_stopper self) throw ()
{
    delete self;
}

const char *
xapian_stopper_get_description(xapian_stopper self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        std::string value = self->get_description();
        return strdup(value.c_str());
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_stopper
xapian_stopper_new_subclass(bool (*override_call_me)(const char *), const char *(*override_get_description)(void), void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Perl6Subclass(override_call_me, override_get_description);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

}
