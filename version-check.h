#include <xapian/version.h>

#if XAPIAN_MAJOR_VERSION != 1 || XAPIAN_MINOR_VERSION != 2
#  error "Invalid Xapian version; expected 1.2.*"
#endif
