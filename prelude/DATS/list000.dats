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
Mon 08 Jul 2024 11:37:45 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< (*0*) >
list_nil_
((*void*)) = list_nil()
#impltmp
< x0:t0 >
list_cons_
( x1, xs ) = list_cons(x1, xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0:t0}
list_strqize
  (xs) =
(
  auxmain(xs)) where
{
fun auxmain(xs) = $llazy
(
case+ xs of
|
list_nil() =>
strqcon_vt_nil()
|
list_cons(x1, xs) =>
strqcon_vt_cons(x1, auxmain(xs))
)
}(*where*)//end-of-[list_strqize(xs)]
//
#impltmp
{x0:t0}
gseq_strqize
<list(x0)><x0> = list_strqize<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
//
(*
#impltmp
< x0:t0 >
list_length
  (xs) =
(
  gseq_length<list(x0)><x0>(xs))
*)
//
#impltmp
< x0:t0 >
list_length
  (xs) =
(
  loop(xs, 0(*j0*))) where
{
fun
loop{i,j:i0}
(xs:
 list(x0), j0: sint(j)): sint(i+j) =
(
case+ xs of
|list_nil() => j0
|list_cons(x1, xs) => loop(xs, j0+1)
)
}
//
#impltmp
{ x0:t0 }
gseq_length<list(x0)><x0> = list_length
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_list000.dats] *)
