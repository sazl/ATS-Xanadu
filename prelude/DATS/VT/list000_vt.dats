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
Mon 08 Jul 2024 05:07:13 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 10:06:19 PM EDT
*)
//
#impltmp
{ x0:vt }
gseq$sep
<list_vt(x0)><x0>() = ","
#impltmp
{ x0:vt }
gseq$end
<list_vt(x0)><x0>() = ")"
#impltmp
{ x0:vt }
gseq$beg
<list_vt(x0)><x0>() = "list_vt("
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0
<list_vt(x0)>(xs) =
(
gseq_print0<list_vt(x0)><x0>(xs)
)(*let*)//end-[g_print0<list_vt>]
//
#impltmp
{ x0:vt }
g_print1
<list_vt(x0)>(xs) =
(
gseq_print1<list_vt(x0)><x0>(xs)
)(*let*)//end-[g_print1<list_vt>]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_vt_length0 =
gseq_length0<list_vt(x0)><x0>
*)
#impltmp
< x0:vt >
list_vt_length0
  (xs) =
(
  loop(xs, 0(*j0*)))
where
{
fun
loop
{i,j:i0}
(xs:
~list_vt
 (x0, i)
,j0: sint(j)): sint(i+j) =
(
case+ xs of
| ~
list_vt_nil() => j0
| ~
list_vt_cons(x1, xs) =>
(
  free(x1); loop(xs, j0+1)))
}
//
#impltmp
{ x0:vt }
gseq_length0
<list_vt(x0)><x0> = list_vt_length0<x0>
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_vt_length1 =
gseq_length1<list_vt(x0)><x0>
*)
//
#impltmp
< x0:vt >
list_vt_length1
  (xs) =
(
  loop(xs, 0(*j0*)))
where
{
fun
loop
{i,j:i0}
(xs:
!list_vt
 (x0, i)
,j0: sint(j)): sint(i+j) =
(
case+ xs of
|list_vt_nil() => j0
|list_vt_cons(x1, xs) => loop(xs, j0+1))
}
//
#impltmp
{ x0:vt }
gseq_length1
<list_vt(x0)><x0> = list_vt_length1<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
Sat 27 Jul 2024 05:56:34 PM EDT
*)
//
#impltmp
<a>(*tmp*)
list_vt_copy
  ( xs ) =
let
//
fnx
loop
{n:nat}.<n>.
( xs:
! list_vt(a,n)
, r0:
& (?list_vt(a)>>list_vt(a,n))
) : void =
(
//
case+ xs of
| // !
list_vt_nil() =>
(r0 := list_vt_nil())
| // !
list_vt_cons(x0, xs) =>
let
val x0 = g_copy<a>(x0)
val () =
(r0 := list_vt_cons(x0, _))
in//let
  loop(xs, r0.1); $fold(r0) end)
//
in//let
let
var r0:
list_vt(a) in loop(xs, r0); r0 end
end (*let*) // end of [list_vt_copy]
//
#impltmp
{ x0:vt }
gseq_copy
<list_vt(x0)><x0> = list_vt_copy<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
Sat 27 Jul 2024 05:56:34 PM EDT
*)
//
#impltmp
< a: vt >
list_vt_append00
  (xs, ys) =
let
var xs = xs
val () =
  loop(xs, ys) in (xs)
end where // end-of-[let]
{
//
fnx
loop
{m,n:nat} .<m>.
( xs:
& list_vt(a, m  )
  >>
  list_vt(a, m+n)
, ys:
~ list_vt(a, n  )) : void =
(
case+ xs of
| ~
list_vt_nil
 ((*0*)) => (xs := ys)
| @
list_vt_cons
  (_, _) =>
let
  val () = loop(xs.1, ys)
in//let
let
prval () = $fold(xs) in () end
end // end of [list_vt_cons]
) (*case*) // end of [loop(xs, ys)]
//
} (* end of [list_vt_append00(xs,ys)] *)
//
#impltmp
{ x0:vt }
gseq_append00
<list_vt(x0)>
<x0>
<list_vt(x0)> = list_vt_append00<x0>
//
(* ****** ****** *)
//
#impltmp
< a: vt >
list_vt_append10
  (xs, ys) =
(
list_vt_append00<a>(xs, ys))
where
{
  val xs = list_vt_copy<a>(xs)
} (* end of [list_vt_append10(xs,ys)] *)
//
#impltmp
{ x0:vt }
gseq_append10
<list_vt(x0)>
<x0>
<list_vt(x0)> = list_vt_append10<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_list000_vt.dats] *)
