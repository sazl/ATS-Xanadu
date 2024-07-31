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
Sun 21 Jul 2024 02:22:12 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_listize
 ( xs: xs ): list_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rlistize
 ( xs: xs ): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_strmize
 ( xs: xs ): strm_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rstrmize
 ( xs: xs ): strm_vt(x0)
//
fun
<xs:t0>
<x0:vt>
gasz_strqize
 ( xs: xs ): strq_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rstrqize
 ( xs: xs ): strq_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_forall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasz_rforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasz_iforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasz_irforall(xs: xs): bool
//
(*
#symload forall with gasz_forall of 0100
#symload rforall with gasz_rforall of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasz_forall_c1fr
(xs: xs, test: (!x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:vt>
gasz_forall_f1np
(xs: xs, test: (!x0)-<fnp>bool): bool
//
#symload forall with gasz_forall_c1fr of 0100
#symload forall_cfr with gasz_forall_c1fr of 0100
#symload forall_fnp with gasz_forall_f1np of 0100
//
fun
<xs:t0>
<x0:vt>
gasz_rforall_c1fr
(xs: xs, test: (!x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:vt>
gasz_rforall_f1np
(xs: xs, test: (!x0)-<fnp>bool): bool
//
#symload rforall with gasz_rforall_c1fr of 0100
#symload rforall_cfr with gasz_rforall_c1fr of 0100
#symload rforall_fnp with gasz_rforall_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 01:47:26 PM EDT
*)
//
fun
<x0:vt>
mapref$fopr0(~x0): x0
fun
<x0:vt>
mapref$fopr1(!x0): x0
fun
<x0:vt>
mapref$fopr1r
( ref: &x0 >> x0 ): void
(*
fun
<x0:vt>
mapref$fopr$clr
( ref: &x0 >> ?x0 ): void
*)
//
fun
<xs:t0>
<x0:vt>
gasz_mapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasz_mapref_c1fr
(xs: xs, fopr: (~x0)-<cfr>(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gasz001.sats] *)