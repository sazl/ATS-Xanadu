(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For generic basics
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun
<a:vtype>
g_self(x: a): a

(* ****** ****** *)

fun
<a:vtype>
g_free(x: a): void
fun
<a:vtype>
g_copy(x: !(a)): (a)

(* ****** ****** *)

fun
<a:vtype>
g_equal(!a, !a): void
fun
<a:vtype>
g_nequal(!a, !a): void

(* ****** ****** *)

fun
<a:t0><b:vt>
map$fopr(x: a): b
fun
<a:vt><b:vt>
map0$fopr(x: a): b
fun
<a:vt><b:vt>
map1$fopr(x: !a): b

(* ****** ****** *)

fun
<a:t0>
forall$test(x: a): bool
fun
<a:t0>
forall0$test(x: a): bool
fun
<a:t0>
forall1$test(x: !a): bool

(* ****** ****** *)

fun
<a:t0>
foreach$work(x: a): void
fun
<a:t0>
foreach0$work(x: a): void
fun
<a:t0>
foreach1$work(x: !a): void

(* ****** ****** *)

(* end of [gbas.sats] *)
