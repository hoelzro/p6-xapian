/*
 * Generated C wrapper for Xapian::Enquire
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

typedef Xapian::MSetIterator *xapian_mset_iterator;
typedef Xapian::ExpandDecider *xapian_expand_decider;
typedef Xapian::Enquire *xapian_enquire;
typedef Xapian::TermIterator *xapian_term_iterator;
typedef Xapian::ESet *xapian_eset;
typedef Xapian::Query *xapian_query;
typedef Xapian::MatchDecider *xapian_match_decider;
typedef Xapian::KeyMaker *xapian_key_maker;
typedef Xapian::RSet *xapian_rset;
typedef Xapian::MatchSpy *xapian_match_spy;
typedef Xapian::Database *xapian_database;
typedef Xapian::MSet *xapian_mset;
typedef Xapian::Weight *xapian_weight;
typedef Xapian::ErrorHandler *xapian_error_handler;

xapian_enquire
xapian_enquire_new(xapian_database database, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Enquire(*database);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

xapian_enquire
xapian_enquire_new2(xapian_database database, xapian_error_handler errorhandler_, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        return new Xapian::Enquire(*database, errorhandler_);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }
}

void
xapian_enquire_free(xapian_enquire self) throw ()
{
    delete self;
}

void
xapian_enquire_set_query(xapian_enquire self, xapian_query query, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_query(*query);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_query2(xapian_enquire self, xapian_query query, unsigned int qlen, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_query(*query, qlen);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

xapian_query
xapian_enquire_get_query(xapian_enquire self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::Query *value = new Xapian::Query();
        *value = self->get_query();
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

void
xapian_enquire_add_matchspy(xapian_enquire self, xapian_match_spy spy, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->add_matchspy(spy);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_clear_matchspies(xapian_enquire self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->clear_matchspies();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_weighting_scheme(xapian_enquire self, xapian_weight weight_, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_weighting_scheme(*weight_);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_collapse_key(xapian_enquire self, unsigned int collapse_key, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_collapse_key(collapse_key);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_collapse_key2(xapian_enquire self, unsigned int collapse_key, unsigned int collapse_max, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_collapse_key(collapse_key, collapse_max);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_docid_order(xapian_enquire self, unsigned int order, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_docid_order((Xapian::Enquire::docid_order) order);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_cutoff(xapian_enquire self, int percent_cutoff, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_cutoff(percent_cutoff);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_cutoff2(xapian_enquire self, int percent_cutoff, double weight_cutoff, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_cutoff(percent_cutoff, weight_cutoff);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_sort_by_relevance(xapian_enquire self, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_sort_by_relevance();
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_sort_by_value(xapian_enquire self, unsigned int sort_key, bool reverse, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_sort_by_value(sort_key, reverse);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_sort_by_key(xapian_enquire self, xapian_key_maker sorter, bool reverse, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_sort_by_key(sorter, reverse);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_sort_by_value_then_relevance(xapian_enquire self, unsigned int sort_key, bool reverse, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_sort_by_value_then_relevance(sort_key, reverse);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_sort_by_key_then_relevance(xapian_enquire self, xapian_key_maker sorter, bool reverse, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_sort_by_key_then_relevance(sorter, reverse);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_sort_by_relevance_then_value(xapian_enquire self, unsigned int sort_key, bool reverse, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_sort_by_relevance_then_value(sort_key, reverse);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

void
xapian_enquire_set_sort_by_relevance_then_key(xapian_enquire self, xapian_key_maker sorter, bool reverse, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        self->set_sort_by_relevance_then_key(sorter, reverse);
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        
    }

}

xapian_mset
xapian_enquire_get_mset(xapian_enquire self, unsigned int first, unsigned int maxitems, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSet *value = new Xapian::MSet();
        *value = self->get_mset(first, maxitems);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset
xapian_enquire_get_mset2(xapian_enquire self, unsigned int first, unsigned int maxitems, unsigned int checkatleast, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSet *value = new Xapian::MSet();
        *value = self->get_mset(first, maxitems, checkatleast);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset
xapian_enquire_get_mset3(xapian_enquire self, unsigned int first, unsigned int maxitems, unsigned int checkatleast, xapian_rset omrset, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSet *value = new Xapian::MSet();
        *value = self->get_mset(first, maxitems, checkatleast, omrset);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset
xapian_enquire_get_mset4(xapian_enquire self, unsigned int first, unsigned int maxitems, unsigned int checkatleast, xapian_rset omrset, xapian_match_decider mdecider, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSet *value = new Xapian::MSet();
        *value = self->get_mset(first, maxitems, checkatleast, omrset, mdecider);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset
xapian_enquire_get_mset5(xapian_enquire self, unsigned int first, unsigned int maxitems, xapian_rset omrset, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSet *value = new Xapian::MSet();
        *value = self->get_mset(first, maxitems, omrset);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_mset
xapian_enquire_get_mset6(xapian_enquire self, unsigned int first, unsigned int maxitems, xapian_rset omrset, xapian_match_decider mdecider, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::MSet *value = new Xapian::MSet();
        *value = self->get_mset(first, maxitems, omrset, mdecider);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_eset
xapian_enquire_get_eset(xapian_enquire self, unsigned int maxitems, xapian_rset omrset, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ESet *value = new Xapian::ESet();
        *value = self->get_eset(maxitems, *omrset);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_eset
xapian_enquire_get_eset2(xapian_enquire self, unsigned int maxitems, xapian_rset omrset, int flags, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ESet *value = new Xapian::ESet();
        *value = self->get_eset(maxitems, *omrset, flags);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_eset
xapian_enquire_get_eset3(xapian_enquire self, unsigned int maxitems, xapian_rset omrset, int flags, double k, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ESet *value = new Xapian::ESet();
        *value = self->get_eset(maxitems, *omrset, flags, k);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_eset
xapian_enquire_get_eset4(xapian_enquire self, unsigned int maxitems, xapian_rset omrset, int flags, double k, xapian_expand_decider edecider, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ESet *value = new Xapian::ESet();
        *value = self->get_eset(maxitems, *omrset, flags, k, edecider);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_eset
xapian_enquire_get_eset5(xapian_enquire self, unsigned int maxitems, xapian_rset omrset, xapian_expand_decider edecider, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ESet *value = new Xapian::ESet();
        *value = self->get_eset(maxitems, *omrset, edecider);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_eset
xapian_enquire_get_eset6(xapian_enquire self, unsigned int maxitems, xapian_rset omrset, int flags, double k, xapian_expand_decider edecider, double min_wt, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::ESet *value = new Xapian::ESet();
        *value = self->get_eset(maxitems, *omrset, flags, k, edecider, min_wt);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_enquire_get_matching_terms_begin(xapian_enquire self, unsigned int did, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->get_matching_terms_begin(did);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_enquire_get_matching_terms_end(xapian_enquire self, unsigned int _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->get_matching_terms_end(_anon_1);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_enquire_get_matching_terms_begin2(xapian_enquire self, xapian_mset_iterator it, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->get_matching_terms_begin(*it);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

xapian_term_iterator
xapian_enquire_get_matching_terms_end2(xapian_enquire self, xapian_mset_iterator _anon_1, void (*handle_exception)(const Xapian::Error *)) throw ()
{
    try {
        Xapian::TermIterator *value = new Xapian::TermIterator();
        *value = self->get_matching_terms_end(*_anon_1);
        return value;
    } catch(const Xapian::Error &error) {
        handle_exception(&error);
        return NULL;
    }

}

const char *
xapian_enquire_get_description(xapian_enquire self, void (*handle_exception)(const Xapian::Error *)) throw ()
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
