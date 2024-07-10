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
//
(*
Author: Hongwei Xi
(*
Wed 10 Jul 2024 08:24:22 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_equal0(~a, ~a): bool
fun
<a:vt>
g_noteq0(~a, ~a): bool
//
fun
<a:vt>
g_equal1(!a, !a): bool
fun
<a:vt>
g_noteq1(!a, !a): bool
//
(* ****** ****** *)
//
fun
<a:vt>
g_eqref1(!a, !a): bool
fun
<a:vt>
g_neqrf1(!a, !a): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_torep0(x : ~a): strn
fun
<a:vt>
g_tostr0(x : ~a): strn
//
fun
<a:vt>
g_torep1(x : !a): strn
fun
<a:vt>
g_tostr1(x : !a): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_print0(x: ~a): void
fun
<a:vt>
g_print1(x: !a): void
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas000_vt.sats] *)