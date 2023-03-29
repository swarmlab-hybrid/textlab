#!/bin/sh

echo "==> extra packages"

extrap=/tmp/bin/extrapackages
if [ -f $extrap ]; then
sh $extrap
fi

echo "==> exec custom"

extrashell=/tmp/bin/custom.sh
if [ -f $extrashell ]; then
sh $extrashell
fi
