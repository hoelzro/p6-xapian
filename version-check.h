#include <xapian/version.h>

#if XAPIAN_MAJOR_VERSION != 1 || XAPIAN_MINOR_VERSION != 2 || XAPIAN_REVISION < 13
#  error "Invalid Xapian version; expected >= 1.2.13"
#endif
