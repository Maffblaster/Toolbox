#!/bin/sh

FILELIST=$(qlist -e "$@")
if [[ -z $FILELIST ]] ; then
FILELIST="$@"
fi
 
echo -e 'Check RDEPENDs of package...'
#read word
scanelf -L -n -q -F '%n #F' ${FILELIST} | tr , ' ' | xargs --no-run-if-empty qfile -C | sort -u

