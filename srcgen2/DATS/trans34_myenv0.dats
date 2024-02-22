(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Wed Dec 27 11:34:52 EST 2023
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload styp with d4typ_get_styp
(* ****** ****** *)
#symload lctn with d4pat_get_lctn
#symload node with d4pat_get_node
#symload styp with d4pat_get_styp
(* ****** ****** *)
#symload lctn with f4arg_get_lctn
#symload node with f4arg_get_node
(* ****** ****** *)

local
//
(* ****** ****** *)
//
datavwtp
linstk =
//
|
linstk_nil of ()
//
|
linstk_lam0 of ( linstk )
|
linstk_let0 of ( linstk )
//
|
linstk_ift0 of ( linstk )
|
linstk_cas0 of ( linstk )
//
|linstk_dvar of
(d2var(*lin*), d4typ, linstk)
|linstk_denv of
(d2var(*lin*), d4typ, linstk)
//
|linstk_dget of
(d2var(*lin*), d4typ, linstk)
|linstk_dset of
(d2var(*lin*), d4typ, linstk)
//
|linstk_dvtp of
(d2var(*lin*), d4typ, linstk)
//
(*
|linstk_dlft of
(d2var(*lin*), d4lft, linstk)
*)
//
#absimpl linstk_vtbx = linstk
//
(* ****** ****** *)
//
datavwtp
tr34env =
TR34ENV of
(
d2varlst, linstk(*void*))
//
(* ****** ****** *)
#absimpl tr34env_vtbx = tr34env
(* ****** ****** *)
(* ****** ****** *)
in//local
(* ****** ****** *)
(* ****** ****** *)
//
fun
linstk_free_nil
(stk0: ~linstk): void =
(
case-
stk0 of ~linstk_nil() => ())
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_pshlam0
  (  stk0  ) =
(
  stk0 := linstk_lam0(stk0))
//(*end of [linstk_pshlam0(stk0)]*)
//
#implfun
linstk_pshlet0
  (  stk0  ) =
(
  stk0 := linstk_let0(stk0))
//(*end of [linstk_pshlet0(stk0)]*)
//
(* ****** ****** *)
//
#implfun
linstk_pshift0
  (  stk0  ) =
(
  stk0 := linstk_ift0(stk0))
//(*end of [linstk_pshift0(stk0)]*)
//
#implfun
linstk_pshcas0
  (  stk0  ) =
(
  stk0 := linstk_cas0(stk0))
//(*end of [linstk_pshcas0(stk0)]*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_lamvars
  (  stk0  ) =
(
loop(stk0, list_nil())
) where
{
fun
loop
( stk0:
! linstk
, res1: d2varlst): d2varlst =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
*)
|
linstk_lam0
 (  stk1  ) => res1
(*
|
linstk_let0
 (  stk1  ) => res1
|
linstk_ift0
 (  stk1  ) => res1
|
linstk_cas0
 (  stk1  ) => res1
*)
//
|
linstk_dvar
(d2v0, dtp0, stk1) =>
loop(stk1, list_cons(d2v0, res1))
//
|
linstk_denv
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|
linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|
linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|
linstk_dvtp
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|
linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
//
)
}(*where*)//end-of-[linstk_lamvars(...)]
//
(* ****** ****** *)
//
#implfun
linstk_letvars
  (  stk0  ) =
(
loop(stk0, list_nil())
) where
{
fun
loop
( stk0:
! linstk
, res1: d2varlst): d2varlst =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
*)
//
(*
|
linstk_lam0
 (  stk1  ) => res1
*)
|
linstk_let0
 (  stk1  ) => res1
//
(*
|
linstk_ift0
 (  stk1  ) => res1
|
linstk_cas0
 (  stk1  ) => res1
*)
|
linstk_dvar
(d2v0, dtp0, stk1) =>
loop(stk1, list_cons(d2v0, res1))
//
|linstk_denv
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
)
}(*where*)//end-of-[linstk_letvars(...)]
//
(* ****** ****** *)
//
#implfun
linstk_casvars
  (  stk0  ) =
(
loop(stk0, list_nil())
) where
{
fun
loop
( stk0:
! linstk
, res1: d2varlst): d2varlst =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
*)
//
(*
|
linstk_lam0
 (  stk1  ) => res1
|
linstk_let0
 (  stk1  ) => res1
*)
|
linstk_cas0
 (  stk1  ) => res1
(*
|
linstk_ift0
 (  stk1  ) => res1
*)
//
|
linstk_dvar
(d2v0, dtp0, stk1) =>
loop(stk1, list_cons(d2v0, res1))
//
|linstk_denv
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
)
}(*where*)//end-of-[linstk_casvars(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_lamenvs
  (  stk0  ) =
(
loop(stk0, list_nil())
) where
{
fun
loop
( stk0:
! linstk
, res1: d2varlst): d2varlst =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
*)
|
linstk_lam0
 (  stk1  ) => res1
(*
|
linstk_let0
 (  stk1  ) => res1
*)
//
|
linstk_denv
(d2v0, dtp0, stk1) =>
loop(stk1, list_cons(d2v0, res1))
//
|
linstk_dvar
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|
linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|
linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|
linstk_dvtp
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|
linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
//
)
}(*where*)//end-of-[linstk_lamenvs(...)]
//
(* ****** ****** *)
//
#implfun
linstk_letenvs
  (  stk0  ) =
(
loop(stk0, list_nil())
) where
{
fun
loop
( stk0:
! linstk
, res1: d2varlst): d2varlst =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
*)
//
(*
|
linstk_lam0
 (  stk1  ) => res1
*)
|
linstk_let0
 (  stk1  ) => res1
//
|
linstk_denv
(d2v0, dtp0, stk1) =>
loop(stk1, list_cons(d2v0, res1))
//
|linstk_dvar
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
)
}(*where*)//end-of-[linstk_letenvs(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_poptop0
  (stk0) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
| !
linstk_nil() => kxs // err = 0
//
| ~
linstk_dvar
(k1, x1, kxs) => loop(kxs, err)
//
| ~
linstk_dget
(k1, x1, kxs) => loop(kxs, err)
| ~
linstk_dset
(k1, x1, kxs) => loop(kxs, err)
//
| ~
linstk_dvtp
(k1, x1, kxs) => loop(kxs, err)
//
| !
linstk_denv _ => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
| !
linstk_cas0 _ => (err := 1; kxs)
//
) (*case+*)//end-of-[loop(kxs, err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*)//end-[linstk_poptop0(stk0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_poplam0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_lam0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_dvar
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_denv
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
| !
linstk_cas0 _ => (err := 1; kxs)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_poplam0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_poplet0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_let0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_dvar
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_denv
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
| !
linstk_cas0 _ => (err := 1; kxs)
//
(* ****** ****** *)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_poplet0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_popift0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_ift0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_denv
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_dvar _ => (err := 1; kxs)
//
| !
linstk_cas0 _ => (err := 1; kxs)
//
(* ****** ****** *)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_popift0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_popcas0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_cas0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_denv
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_dvar _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
//
(* ****** ****** *)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_popcas0(stk)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_getlam0
  (  stk0  ) = let
//
#vwtpdef
res_vt =
list_vt@(d2var, d4typ)
//
fnx
loop
( kxs
: linstk
, res: res_vt
, err: &sint >> _
) : @(linstk, res_vt) =
(
case+ kxs of
//
| ~
linstk_nil
 ((*00*)) => (kxs, res)
| ~
linstk_lam0
(   kxs   ) => (kxs, res)
//
| ~
linstk_dvar
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| ~
linstk_dget
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
| !
linstk_dset
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| ~
linstk_denv
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
(*
val () =
prerrln
("\
linstk_getlam0:\
loop:linstk_denv: d2v = ", d2v)
val () =
prerrln
("\
linstk_getlam0:\
loop:linstk_denv: dtp = ", dtp)
*)
}
//
| ~
linstk_dvtp
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
(*
val () =
prerrln
("\
linstk_getlam0:\
loop:linstk_dvtp: d2v = ", d2v)
val () =
prerrln
("\
linstk_getlam0:\
loop:linstk_dvtp: dtp = ", dtp)
*)
}
//
)(*case+*)//end-of-[loop( ... )]
//
in//let
//
let
val
(stk1, dvts) =
loop(stk0, res, err) where
{
var err = 0
val res = list_vt_nil(*void*)}
in//let
stk0 := stk1; d2vdtplst_d2vtize(dvts)
end//let
end (*let*) // end of [linstk_getlam0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_getift0
  (  stk0  ) = let
//
#vwtpdef
res_vt =
list_vt@(d2var, d4typ)
//
fnx
loop
( kxs
: linstk
, res: res_vt
, err: &sint >> _
) : @(linstk, res_vt) =
(
case+ kxs of
//
| ~
linstk_nil
 ((*00*)) => (kxs, res)
| ~
linstk_ift0
(   kxs   ) => (kxs, res)
//
| ~
linstk_dget
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
| !
linstk_dset
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| ~
linstk_dvar
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
(*
val () =
prerrln
("\
linstk_getift0:\
loop:linstk_dvar: d2v = ", d2v)
val () =
prerrln
("\
linstk_getift0:\
loop:linstk_dvar: dtp = ", dtp)
*)
}
| ~
linstk_denv
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
(*
val () =
prerrln
("\
linstk_getift0:\
loop:linstk_denv: d2v = ", d2v)
val () =
prerrln
("\
linstk_getift0:\
loop:linstk_denv: dtp = ", dtp)
*)
}
//
| ~
linstk_dvtp
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
(*
val () =
prerrln
("\
linstk_getift0:\
loop:linstk_dvtp: d2v = ", d2v)
val () =
prerrln
("\
linstk_getift0:\
loop:linstk_dvtp: dtp = ", dtp)
*)
}
//
)(*case+*)//end-of-[loop( ... )]
//
in//let
//
let
val
(stk1, dvts) =
loop(stk0, res, err) where
{
var err = 0
val res = list_vt_nil(*void*)}
in//let
stk0 := stk1; d2vdtplst_d2vtize(dvts)
end//let
end (*let*) // end of [linstk_getift0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_getcas0
  (  stk0  ) = let
//
#vwtpdef
res_vt =
list_vt@(d2var, d4typ)
//
fnx
loop
( kxs
: linstk
, res: res_vt
, err: &sint >> _
) : @(linstk, res_vt) =
(
case+ kxs of
//
| ~
linstk_nil
 ((*00*)) => (kxs, res)
| ~
linstk_cas0
(   kxs   ) => (kxs, res)
//
| ~
linstk_dvar
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| ~
linstk_dget
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
| !
linstk_dset
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| ~
linstk_denv
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
(*
val () =
prerrln
("\
linstk_getcas0:\
loop:linstk_denv: d2v = ", d2v)
val () =
prerrln
("\
linstk_getcas0:\
loop:linstk_denv: dtp = ", dtp)
*)
}
//
| ~
linstk_dvtp
(d2v,dtp,kxs) =>
loop(kxs, res, err) where
{
(*
val () =
prerrln
("\
linstk_getcas0:\
loop:linstk_dvtp: d2v = ", d2v)
val () =
prerrln
("\
linstk_getcas0:\
loop:linstk_dvtp: dtp = ", dtp)
*)
}
//
)(*case+*)//end-of-[loop( ... )]
//
in//let
//
let
val
(stk1, dvts) =
loop(stk0, res, err) where
{
var err = 0
val res = list_vt_nil(*void*)}
in//let
stk0 := stk1; d2vdtplst_d2vtize(dvts)
end//let
end (*let*) // end of [linstk_getcas0(stk)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_d2vins_dvar
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dvar
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dvar: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dvar: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dvar(...)]
//
(* ****** ****** *)
//
#implfun
linstk_d2vins_dget
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dget
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dget: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dget: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dget(...)]
//
#implfun
linstk_d2vins_dset
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dset
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dset: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dset: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dset(...)]
//
(* ****** ****** *)
//
#implfun
linstk_d2vins_dvtp
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dvtp
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dvtp: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dvtp: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dvtp(...)]
//
(* ****** ****** *)
//
(*
#implfun
linstk_d2vins_dlft
(stk0, d2v1, lft1) =
(
stk0 :=
linstk_dlft
(d2v1, lft1, stk0)) where
{
//
(*
val () =
prerrln
("linstk_d2vins_dlft: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dlft: lft1 = ", lft1)
*)
//
}(*where*)//end-of-[linstk_d2vins_dlft(...)]
*)
//
(* ****** ****** *)
//
#implfun
linstk_search_dvar
  (stk0, d2v0) =
let
val opt0 = loop(stk0)
//
in//let
//
case+ opt0 of
| ~
optn_vt_nil() =>
optn_vt_nil()
| ~
optn_vt_cons(dtp0) =>
optn_vt_cons(dtp0.styp())
//
end where
{
fnx
loop
( stk0:
! linstk ): d4typopt_vt =
(
case+ stk0 of
//
|linstk_nil _ => optn_vt_nil()
|linstk_lam0 _ => optn_vt_nil()
//
|linstk_let0(stk1) => loop(stk1)
//
|linstk_ift0(stk1) => loop(stk1)
|linstk_cas0(stk1) => loop(stk1)
//
|
linstk_dvar
(d2v1, dtp1, stk1) =>
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1)
//
|
linstk_denv
(d2v1, dtp1, stk1) =>
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1)
//
|
linstk_dget
(d2v1, dtp1, stk1) =>
(
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1))
|
linstk_dset
(d2v1, dtp1, stk1) =>
(
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1))
//
|
linstk_dvtp
(d2v1, dtp1, stk1) =>
(
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1))
//
)
}(*where*)//end-of-[linstk_search_dvar(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_make_nil
  ((*nil*)) =
(
  TR34ENV
  (d2vs, linstk_nil)) where
{
  val d2vs = list_nil((*void*))
} (*where*)//end of [tr34env_make_nil(...)]
//
(* ****** ****** *)
//
#implfun
tr34env_free_top
  (  env0  ) =
(
case+ env0 of
| ~
TR34ENV
(d2vs, map2) => d2vs where
{
//
var
linstk = map2//local lin-proofs
//
val nerr = linstk_poptop0(linstk)
//
val (  ) = linstk_free_nil(linstk) }
//
)(*case+*)//end-of-(tr34env_free_top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_pshlam0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_pshlam0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshlam0(env0))
//
#implfun
tr34env_poplam0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
let
val nerr =
linstk_poplam0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_poplam0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshlet0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_pshlet0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshlet0(env0))
//
#implfun
tr34env_poplet0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
let
val nerr =
linstk_poplet0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshift0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_pshift0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshift0(env0))
//
#implfun
tr34env_popift0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
let
val nerr =
linstk_popift0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_popift0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshcas0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_pshcas0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshcas0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_popcas0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
let
val nerr =
linstk_popcas0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_popcas0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_getlam0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getlam0(linstk)}
//
end(*let*)//end-of-(tr34env_getlam0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_getlet0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getlet0(linstk)}
//
end(*let*)//end-of-(tr34env_getlet0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_getift0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getift0(linstk)}
//
end(*let*)//end-of-(tr34env_getift0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_getcas0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getcas0(linstk)}
//
end(*let*)//end-of-(tr34env_getcas0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_d2vins_dvar
  (env0,d2v1,stp1) = let
//
val
dtp1 = D4TYPstp(stp1)
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_d2vins_dvar
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dvar(...))
//
(* ****** ****** *)
//
#implfun
tr34env_d2vins_dget
  (env0,d2v1,dtp1) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_d2vins_dget
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dget(...))
//
#implfun
tr34env_d2vins_dset
  (env0,d2v1,dtp1) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_d2vins_dset
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dset(...))
//
(* ****** ****** *)
//
#implfun
tr34env_d2vins_dvtp
  (env0,d2v1,stp1) = let
//
val
dtp1 = D4TYPstp(stp1)
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_d2vins_dvtp
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dvtp(...))
//
(* ****** ****** *)
//
(*
#implfun
tr34env_d2vins_dlft
  (env0,d2v1,lft1) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_d2vins_dlft
  (linstk, d2v1, lft1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dlft(...))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_search_dvar
  (env0, d2v1) =
let
val+
@TR34ENV
(d2vlst, !linstk) = env0
in//let
(
  $fold(env0); opt1 ) where
{
  val
  opt1 = linstk_search_dvar(linstk, d2v1)
}
end(*let*)//end-of-(tr34env_search_dvar(...))
//
(* ****** ****** *)
(* ****** ****** *)

endloc (*local*) // end of [ local(tr34env...) ]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_evstyp_cst
  (env0, s2c0) =
let
val
opt0 = optn_vt_nil((*void*)) in opt0 end//HX:FIXME!
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_insert_dpat
  (env0, dpat) =
(
case+
dpat.node() of
//
|D4Pvar _ =>
(
  f0_var(env0, dpat) )
//
|D4Pany _ => ( (*void*) )
//
|D4Pint _ => ( (*void*) )
|D4Pbtf _ => ( (*void*) )
|D4Pchr _ => ( (*void*) )
|D4Pstr _ => ( (*void*) )
//
|
D4Pannot _ => f0_annot(env0, dpat)
//
| _(* otherwise *) => (  (*void*)  )
//
) where
{
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr34env
, dpat: d4pat): void =
let
//
val-
D4Pvar(d2v1) = dpat.node()
//
in//let
let
val t2p0 = dpat.styp()
val t2p0 = s2typ_unargx(t2p0)
in//let
tr34env_d2vins_dvar(env0,d2v1,t2p0)
end//let
end(*let*)//end-of-[f0_var(env0,dpat)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr34env
, dpat: d4pat): void =
let
//
val-
D4Pannot
( d4p1
, s1e2, s2e2) = dpat.node()
//
in//let
(
  tr34env_insert_dpat(env0, d4p1) )
end(*let*)//end-of-[f0_annot(env0,dpat)]
//
(* ****** ****** *)
//
val () =
prerrln("tr34env_insert_dpat: dpat = ", dpat)
//
(* ****** ****** *)
//
}(*where*)//end-of-[tr34env_insert_dpat(env0,dpat)]
//
(* ****** ****** *)
//
#implfun
tr34env_insert_farg
  (env0, farg) =
(
case+
farg.node() of
|F4ARGdapp
(npf1, d4ps) =>
tr34env_insert_dpatlst(env0, d4ps)
//
|F4ARGsapp _ => () |F4ARGmets _ => ()
) where
{
//
val () =
prerrln("tr34env_insert_farg: farg = ", farg)
//
}(*where*)//end-of-[tr34env_insert_farg(env0,farg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_insert_dpatlst
  (env0, d4ps) =
(
case+ d4ps of
| list_nil() => ((*void*))
| list_cons(d4p0, d4ps) =>
(
tr34env_insert_dpat(env0, d4p0);
tr34env_insert_dpatlst(env0, d4ps)))//end-(implfun)
//
#implfun
tr34env_insert_farglst
  (env0, f4as) =
(
case+ f4as of
| list_nil() => ((*void*))
| list_cons(f4a0, f4as) =>
(
tr34env_insert_farg(env0, f4a0);
tr34env_insert_farglst(env0, f4as)))//end-(implfun)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_myenv0.dats] *)
