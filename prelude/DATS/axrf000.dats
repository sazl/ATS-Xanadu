(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Sun 11 Aug 2024 03:44:27 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ vt:vt }
g_ptype
<a0rf(vt)>
( (*void*) ) =
(
pstrn("a0rf(");
g_ptype<vt>((*0*)); pstrn(")"))
//
#impltmp
{ vt:vt }
g_ptype
<a1rf(vt)>
( (*void*) ) =
(
pstrn("a1rf(");
g_ptype<vt>((*0*)); pstrn(")"))
//
#impltmp
{ vt:vt }
g_ptype
<a2rf(vt)>
( (*void*) ) =
(
pstrn("a2rf(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasz_length
<a0rf(x0)><x0>( A ) = 1 // singleton
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
a0rf_get =
$UN.gasz_get$raw<a0rf(x0)><x0>
#impltmp
< x0:vt >
a0rf_set =
$UN.gasz_set$raw<a0rf(x0)><x0>
//
#impltmp
< x0:vt >
a0rf_cget =
$UN.gasz_cget$raw<a0rf(x0)><x0>
#impltmp
< x0:vt >
a0rf_setf =
$UN.gasz_setf$raw<a0rf(x0)><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
$UN.gasz_lget$raw
< a0rf(x0) >< x0 > = a0rf_lget<x0>
#impltmp
< x0:vt >
$UN.gasz_lset$raw
< a0rf(x0) >< x0 > = a0rf_lset<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_axrf000.dats] *)
