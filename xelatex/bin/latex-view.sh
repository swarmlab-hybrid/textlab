#/bin/bash

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

echo $cwdir
echo $wdir

docker run -it --rm --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v $cwdir/docs:/documents silvavlis/okular /documents/main.pdf