#!/bin/sh

set -e
set -o pipefail

scheme="$1"

echo "==> Install system packages"
#apk update 
#apk --no-cache add \
#  okular
#  make \
#  xz
#
# Install additional packages for non full scheme
if [ "$scheme" != "full" ]; then
#  tlmgr install \
#  fmtcount 
# tlmgr update --self

echo "==> extra packages"

#extrap=/extrapackages
if [ -f $extrap ]; then

echo "no"
#while read -r line; do
#extrapackages="$extrapackages $line"
#done < $extrap

#tlmgr install $extrapackages

else
        echo "No extrapackages file"
fi

#  cp /usr/local/texlive/2020/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf

#  apk add --no-cache msttcorefonts-installer 

#  update-ms-fonts 
  
#  fc-cache -f 
fi

#texhash

echo "==> Clean up"
rm -rf \
  /opt/texlive/texdir/install-tl \
  /opt/texlive/texdir/install-tl.log \
  /opt/texlive/texdir/texmf-dist/doc \
  /opt/texlive/texdir/texmf-dist/source \
  /opt/texlive/texdir/texmf-var/web2c/tlmgr.log \
  /root/.gnupg \
  /texlive.profile \
  /texlive_pgp_keys.asc \
  /tmp/install-tl \
  /tmp/install-tl-unx
