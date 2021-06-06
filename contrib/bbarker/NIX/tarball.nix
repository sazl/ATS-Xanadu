######
#
# Author: Shea Levy
# Authoremail: sheaATshealevyDOTcom
# Start time: April, 2015
#
# Author: Brandon Barker
# Authoremail: first dot last at gmail . com
# Start time: October, 2018
#
######

{ stdenv
, ats2
, boehmgc
, gmp
, autoconf
, automake
, version
} :

stdenv.mkDerivation rec {
  name =
  "ATS3-Xanadu-${version}.tgz";

  buildInputs =
  [ autoconf automake boehmgc gmp ];

  src =
  builtins.filterSource
  ( path: type:
    (toString path) != (toString ../.git) ) ../.;

  PATSHOME =
  "${ats2}/lib/ats2-postiats-${ats2.version}";

  shellHook = ''
    export XATSHOME=$PWD
    source ./share/NIX/pathenv.sh
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"${boehmgc}/lib"
  '';
}

###### end of [tarball.nix] ######
