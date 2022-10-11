#!/bin/sh

set -e

echo 'building ATS-Xanadu...'
cd $XATSHOME
make all
