#!/bin/bash
#
#
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    #echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    #echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done

SRPATH="$( dirname "$SOURCE" )"
SFPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
if [ "$SFPATH" != "$SRPATH" ]; then
  RDIR=$SRPATH    # relativ path directory
fi

cwdir=$PWD
wdir=$SFPATH

if [ "$cwdir" != "$wdir" ]; then
        cd $wdir
fi

#echo $cwdir
#echo $wdir

cp -f  $cwdir/docs/metaptyxiako.bib  $cwdir/docs/metaptyxiako_bib.backup1
$cwdir/bin/latex-clean.sh
$cwdir/bin/debug.sh
$cwdir/bin/make-bib.sh
$cwdir/bin/debug.sh
