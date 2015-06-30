use v6;
use NativeCall;

module Xapian {
    class Stem is repr('CPointer') {
        my sub xapian_stem_new returns Stem is native('xapian-helper') { * }
        my sub xapian_stem_new_language(Str $language) returns Stem is native('xapian-helper') { * }
        my sub xapian_stem_free(Stem $self) is native('xapian-helper') { * }
        my sub xapian_stem_call(Stem $self, Str $word) returns Str is native('xapian-helper') { * }
        my sub xapian_stem_description(Stem $self) returns Str is native('xapian-helper') { * }

        method new(Str $language?) {
            $language.defined
                ?? xapian_stem_new_language($language)
                !! xapian_stem_new()
        }

        submethod DESTROY {
            xapian_stem_free(self)
        }

        method CALL-ME(Str $word) returns Str {
            xapian_stem_call(self, $word)
        }

        method description returns Str {
            xapian_stem_description(self)
        }
    }
}
