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
Fri 11 Nov 2022 01:49:13 PM EST
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
//
#implfun
list_tread12_fnp
{  syn:tx  }
(  lst , err , fpr  ) =
(
  auxlst(lst, err)) where
{
//
fun
auxlst
( lst: list(syn)
, err: &sint >> _): list(syn) =
case+ lst of
|
list_nil() =>
list_nil()
|
list_cons(tm1, tms) =>
let
val e00 = err
val tm1 = fpr(tm1, err)
val tm2 = auxlst(tms, err)
in//let
if
(err = e00)
then lst else list_cons(tm1,tm2)
endlet // end of [auxlst(lst,err)]
//
}(*where*)//end(list_tread12_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_tread12_fnp
{  syn:tx  }
(  opt , err , fpr  ) =
(
case+ opt of
|
optn_nil() => opt
|
optn_cons(tm1) =>
let
val e00 = err
val tm1 = fpr(tm1, err)
in // let
if
(err=e00)
then opt else optn_cons(tm1)
endlet // end of [optn_cons(tm1)]
)(*case+*)//end(optn_tread12_fnp(opt,err,fpr)
//
(* ****** ****** *)

#implfun
d2parsed_tread12
  (dpar) =
let
//
var nerror: sint = 0
//
val stadyn =
d2parsed_get_stadyn(dpar)
val source =
d2parsed_get_source(dpar)
val topenv =
d2parsed_get_topenv(dpar)
val parsed =
d2parsed_get_parsed(dpar)
//
val parsed =
tread12_d2eclistopt(parsed, nerror)
//
in//let
//
if
(nerror=0)
then (dpar) else
d2parsed
(stadyn, nerror, source, topenv, parsed)
//
end (*let*) // end of [d2parsed_tread12(dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12.dats] *)
