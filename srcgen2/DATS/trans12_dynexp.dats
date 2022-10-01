(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 11 Sep 2022 02:56:28 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*TRANS12*) = "./trans12.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)

#implfun
trans12_d1exp
( tenv,d1e0 ) = let
//
(*
val
loc0 = d1e0.lctn()
val () =
prerrln
("trans12_d1exp: d1e0 = ", d1e0)
*)
//
in//let
//
case+
d1e0.node() of
//
|
D1Eint(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Eint(tok))
end (*let*) // end of [D1Eint(tok)]
|
D1Echr(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Echr(tok))
end (*let*) // end of [D1Echr(tok)]
|
D1Eflt(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Eflt(tok))
end (*let*) // end of [D1Eflt(tok)]
|
D1Estr(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Estr(tok))
end (*let*) // end of [D1Estr(tok)]
//
|
D1Eb0sh _ => d2exp_none1(d1e0)
|
D1Eb1sh _ => f0_b1sh(tenv, d1e0)
//
|
D1El1st _ => f0_l1st(tenv, d1e0)
|
D1El2st _ => f0_l2st(tenv, d1e0)
//
|
D1Es1eq _ => f0_s1eq(tenv, d1e0)
|
D1Es2eq _ => f0_s2eq(tenv, d1e0)
//
|D1Elet0 _ => f0_let0(tenv, d1e0)
|
D1Ewhere _ => f0_where(tenv, d1e0)
//
|D1Et1up _ => f0_t1up(tenv, d1e0)
|D1Et2up _ => f0_t2up(tenv, d1e0)
//
|D1Er1cd _ => f0_r1cd(tenv, d1e0)
|D1Er2cd _ => f0_r2cd(tenv, d1e0)
//
| _(* otherwise *) => d2exp_none1(d1e0)
//
end where
{
//
(* ****** ****** *)
//
fun
f0_b1sh
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
(
trans12_d1exp(tenv, d1e1)) where
{
  val-D1Eb1sh(d1e1) = d1e0.node()
} (*where*) // end of [f0_b1sh(tenv, d1e0)]
//
(* ****** ****** *)
//
fun
f0_l1st
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
val-
D1El1st
( d1es ) = d1e0.node()
in//let
//
if
list_singq(d1es)
then // if-then
let
val-
list_cons(d1e1, _) = d1es
in
  trans12_d1exp(tenv, d1e1)
end (*let*) // end of [then]
else // if-else
let
//
val d2es =
  trans12_d1explst(tenv, d1es)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
  d2exp(loc0, D2Etup0(npf1, d2es))
end//let
end (*let*) // end of [else]
//
end (*let*) // end of [f0_l1st(tenv, d1e0)]
//
fun
f0_l2st
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1El2st
(des1, des2) = d1e0.node()
//
val loc0 = d1e0.lctn()
val npf1 = list_length(des1)
val des1 =
  trans12_d1explst(tenv, des1)
val des2 =
  trans12_d1explst(tenv, des2)
val d2es = list_append(des1, des2)
in//let
  d2exp(loc0, D2Etup0(npf1, d2es))
end (*let*) // end of [f0_l2st(tenv, d1e0)]
//
(* ****** ****** *)
//
fun
f0_let0
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Elet0
(d1cs, d1e1) = d1e0.node()
//
val
d2cs =
trans12_d1eclist(tenv, d1cs)
//
val
d2e1 = trans12_d1exp(tenv, d1e1)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
  d2exp(loc0, D2Elet0(d2cs, d2e1))
end//let
end (*let*) // end of [f0_let0(tenv, d1e0)]
//
fun
f0_where
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Ewhere
(d1e1, d1cs) = d1e0.node()
//
val
d2cs =
trans12_d1eclist(tenv, d1cs)
//
val
d2e1 = trans12_d1exp(tenv, d1e1)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
  d2exp(loc0, D2Ewhere(d2e1, d2cs))
end//let
end (*let*) // end of [f0_where(tenv, d1e0)]
//
(* ****** ****** *)
//
fun
f0_s1eq
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Es1eq
( d1es ) = d1e0.node()
//
in
  trans12_d1expseq(tenv, loc0, d1es)
end (*let*) // end of [f0_s1eq(tenv, d1e0)]
//
fun
f0_s2eq
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Es2eq
(des1, des2) = d1e0.node()
//
val d1es = list_append(des1, des2)
//
in
  trans12_d1expseq(tenv, loc0, d1es)
end (*let*) // end of [f0_s2eq(tenv, d1e0)]
//
(* ****** ****** *)
//
fun
f0_t1up
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Et1up
(tknd, d1es) = d1e0.node()
//
val d2es =
  trans12_d1explst(tenv, d1es)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
d2exp(loc0, D2Etup1(tknd, npf1, d2es))
end//let
end (*let*) // end of [f0_t1up(tenv, d1e0)]
//
fun
f0_t2up
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Et2up
( tknd
, des1, des2) = d1e0.node()
//
val loc0 = d1e0.lctn()
val npf1 = list_length(des1)
val des1 =
  trans12_d1explst(tenv, des1)
val des2 =
  trans12_d1explst(tenv, des2)
//
val d2es = list_append(des1, des2)
//
in//let
d2exp(loc0, D2Etup1(tknd, npf1, d2es))
end (*let*) // end of [f0_t2up(tenv, d1e0)]
//
(* ****** ****** *)
//
fun
f0_r1cd
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Er1cd
(tknd, ldes) = d1e0.node()
//
val ldes =
  trans12_l1d1elst(tenv, ldes)
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
d2exp(loc0, D2Ercd2(tknd, npf1, ldes))
end//let
end (*let*) // end of [f0_r1cd(tenv, d1e0)]
//
fun
f0_r2cd
( tenv:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Er2cd
( tknd
, lds1, lds2) = d1e0.node()
//
val loc0 = d1e0.lctn()
val npf1 = list_length(lds1)
val lds1 =
  trans12_l1d1elst(tenv, lds1)
val lds2 =
  trans12_l1d1elst(tenv, lds2)
//
val ldes = list_append(lds1, lds2)
//
in//let
d2exp(loc0, D2Ercd2(tknd, npf1, ldes))
end (*let*) // end of [f0_r2cd(tenv, d1e0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans12_d1exp(tenv,d1e0)]

(* ****** ****** *)

#implfun
trans12_d1patlst
( tenv, d1ps ) =
list_trans12_fnp(tenv, d1ps, trans12_d1pat)

(* ****** ****** *)

#implfun
trans12_d1explst
( tenv, d1es ) =
list_trans12_fnp(tenv, d1es, trans12_d1exp)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_dynexp.dats] *)