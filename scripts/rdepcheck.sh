#!/bin/sh

# Requires app-portage/portage-utils, app-misc/pax-utils, sys-apps/findutils, sys-apps/coreutils

FILELIST=$(qlist -e "$@")
if [[ -z $FILELIST ]] ; then
FILELIST="$@"
fi
 
echo -e 'Check RDEPENDs of package...'
#read word

# -L, --ldcache -> Utilize ld.so.cache information (use with -r/-n)
# -n, --needed -> Print libraries the ELF is linked against (DT_NEEDED)
# -q, --quiet -> Only output 'bad' things
# -F, --format FORMAT -> Use specified format for output; see the FORMAT section for more information

scanelf -L -n -q -F '%n #F' ${FILELIST} | tr , ' ' | xargs --no-run-if-empty qfile -C | sort -u

