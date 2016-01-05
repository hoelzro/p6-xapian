use v6;

use Panda::Builder;
use LibraryMake;

class Build is Panda::Builder {
    method build($workdir) {
        make($workdir, $workdir);
    }
}
