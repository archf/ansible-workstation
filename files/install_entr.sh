#!/bin/sh

if [ ! -f /usr/local/bin/entr ]; then
  cd /tmp
  curl -s -O http://entrproject.org/code/entr-3.2.tar.gz
  tar xzf entr-3.2.tar.gz -C /opt
  cd /opt/eradman-entr*
  ./configure
  make test
  sudo make install
fi
