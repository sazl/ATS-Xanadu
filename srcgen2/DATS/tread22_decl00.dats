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
Sat 28 Jan 2023 04:13:53 PM EST
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
#staload "./../SATS/tread22.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
#symload lctn with d2valdcl_get_lctn
#symload lctn with d2vardcl_get_lctn
#symload lctn with d2fundcl_get_lctn
#symload lctn with d2cstdcl_get_lctn
(* ****** ****** *)
//
fun
d2ecl_errck
(lvl0: sint
,d2cl: d2ecl): d2ecl =
let
val loc0 = d2cl.lctn()
in//let
d2ecl_make_node
(loc0, D2Cerrck(lvl0, d2cl))
end (*let*) // end-of(d2ecl_errck)
//
(* ****** ****** *)
//
fun
d2ecl_local0_errck
( loc0
: loc_t
, dcs1
: d2eclist
, dcs2
: d2eclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Clocal0(dcs1,dcs2)))
end (*let*) // end of [d2ecl_local0_errck]
//
(* ****** ****** *)
//
fun
d2ecl_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cstatic(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_static_errck]
//
fun
d2ecl_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cextern(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_extern_errck]
//
(* ****** ****** *)
//
fun
d2ecl_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d2vs
: d2valdclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cvaldclst(tknd,d2vs)))
end (*let*) // end of [d2ecl_valdclst_errck]
//
(* ****** ****** *)
//
fun
d2ecl_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d2vs
: d2vardclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cvardclst(tknd,d2vs)))
end (*let*) // end of [d2ecl_vardclst_errck]
//
(* ****** ****** *)
//
fun
d2ecl_fundclst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t2qaglst
, d2fs
: d2fundclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0,D2Cfundclst(tknd,tqas,d2fs)) )
end (*let*) // end of [d2ecl_fundclst_errck]
//
(* ****** ****** *)

#implfun
tread22_d2ecl
  (d2cl, err) =
(
case+
d2cl.node() of
//
|D2Cd1ecl _ => d2cl
|D2Cerrck _ => d2cl
//
|D2Cabssort _ => d2cl
|D2Cstacst0 _ => d2cl
|D2Csortdef _ => d2cl
//
|
D2Cstatic _ => f0_static(d2cl, err)
|
D2Cextern _ => f0_extern(d2cl, err)
//
|
D2Clocal0 _ => f0_local0(d2cl, err)
//
|
D2Cvaldclst _ => f0_valdclst(d2cl, err)
|
D2Cvardclst _ => f0_vardclst(d2cl, err)
|
D2Cfundclst _ => f0_fundclst(d2cl, err)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(err := err+1; d2ecl_errck(lvl0, d2cl))
endlet // end of [  _(* otherwise *)  ]
//
) where// end of [ case+(d2cl.node()) ]
{
(* ****** ****** *)
(*
val (  ) =
prerrln("tread22_d2ecl: d2cl = ", d2cl)
*)
(* ****** ****** *)
//
fun
f0_static
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cstatic
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread22_d2ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d2ecl_static_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
fun
f0_extern
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cextern
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread22_d2ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d2ecl_extern_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_extern(dcl,err) ]
//
//
fun
f0_local0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Clocal0
(dcs1, dcs2) = dcl.node()
//
val dcs1 =
tread22_d2eclist(dcs1, err)
val dcs2 =
tread22_d2eclist(dcs2, err)
//
in
if
(e00=err)
then dcl else
d2ecl_local0_errck( loc, dcs1, dcs2 )
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_local0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Clocal0
(dcs1, dcs2) = dcl.node()
//
val dcs1 =
tread22_d2eclist(dcs1, err)
val dcs2 =
tread22_d2eclist(dcs2, err)
//
in
if
(e00=err)
then dcl else
d2ecl_local0_errck( loc, dcs1, dcs2 )
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_valdclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cvaldclst
(tknd, d2vs) = dcl.node()
//
val d2vs =
tread22_d2valdclist(d2vs, err)
//
in//let
if
(e00=err)
then (dcl) else
d2ecl_valdclst_errck(dcl.lctn(),tknd,d2vs)
end (*let*) // end of [f0_valdclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cvardclst
(tknd, d2vs) = dcl.node()
//
val d2vs =
tread22_d2vardclist(d2vs, err)
//
in//let
if
(e00=err)
then (dcl) else
d2ecl_vardclst_errck(dcl.lctn(),tknd,d2vs)
end (*let*) // end of [f0_vardclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cfundclst
(tknd
,tqas, d2fs) = dcl.node()
//
(*
val tqas =
tread22_t1qaglst(tqas, err)
*)
val d2fs =
tread22_d2fundclist(d2fs, err)
//
in//let
if
(e00=err)
then (dcl) else
d2ecl_fundclst_errck(loc, tknd, tqas, d2fs)
end (*let*) // end of [f0_fundclst(dcl,err)]
//
(* ****** ****** *)
//
} (*where*) // end of [tread22_d2ecl(d2cl,err)]

(* ****** ****** *)
//
#implfun
tread22_teqd2exp
  (tdxp, err) =
(
case+ tdxp of
|
TEQD2EXPnone() => tdxp
|
TEQD2EXPsome(teq1, d2e2) =>
let
val e00 = err
(*
val ( ) =
prerrln
("tread22_teqd2exp: d2e2 = ", d2e2)
*)
val d2e2 = tread22_d2exp(d2e2, err)
in//letp
if
(e00=err)
then tdxp else TEQD2EXPsome(teq1, d2e2)
endlet // end of [ TEQD2EXPsome( _,_ ) ]
) (*case+*)//end-(tread22_teqd2exp(tdxp,err))
//
(* ****** ****** *)
//
#implfun
tread22_d2valdcl
  (dval, err) =
let
//
val e00 = err
//
val loc = dval.lctn()
//
val
dpat = d2valdcl_get_dpat(dval)
val
tdxp = d2valdcl_get_tdxp(dval)
val
wsxp = d2valdcl_get_wsxp(dval)
//
val
dpat = tread22_d2pat(dpat,err)
val
tdxp = tread22_teqd2exp(tdxp,err)
(*
val
wsxp = tread22_wths2exp(wsxp,err)
*)
//
in//let
if
(e00=err)
then (dval)
else d2valdcl( loc, dpat, tdxp, wsxp )
endlet // end-of-[tread22_d2valdcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
tread22_d2vardcl
  (dvar, err) =
let
//
val e00 = err
//
val loc = dvar.lctn()
//
val
dpid = d2vardcl_get_dpid(dvar)
val
vpid = d2vardcl_get_vpid(dvar)
val
sres = d2vardcl_get_sres(dvar)
val
dini = d2vardcl_get_dini(dvar)
//
(*
val
sres = tread22_s2expopt(sres,err)
*)
val
dini = tread22_teqd2exp(dini,err)
//
in//let
if
(e00=err)
then (dvar)
else d2vardcl(loc,dpid,vpid,sres,dini)
endlet // end-of-[tread22_d2vardcl(out,dvar)]
//
(* ****** ****** *)
//
#implfun
tread22_d2fundcl
  (dfun, err) =
let
//
val e00 = err
//
val loc = dfun.lctn()
//
val
dpid = d2fundcl_get_dpid(dfun)
val
farg = d2fundcl_get_farg(dfun)
val
sres = d2fundcl_get_sres(dfun)
val
tdxp = d2fundcl_get_tdxp(dfun)
val
wsxp = d2fundcl_get_wsxp(dfun)
//
val
farg =
tread22_f2arglst(farg, err)
(*
val
sres = tread22_s2res(sres,err)
*)
val
tdxp = tread22_teqd2exp(tdxp,err)
(*
val
wsxp = tread22_wths2exp(wsxp,err)
*)
//
in//let
if
(e00=err)
then (dfun)
else d2fundcl(loc,dpid,farg,sres,tdxp,wsxp)
endlet // end-of-[tread22_d2fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
tread22_d2eclist
  (  dcls, err  ) =
list_tread22_fnp(dcls, err, tread22_d2ecl)
//
(* ****** ****** *)
#implfun
tread22_d2valdclist
  (  d2vs, err  ) =
list_tread22_fnp(d2vs, err, tread22_d2valdcl)
(* ****** ****** *)
#implfun
tread22_d2vardclist
  (  d2vs, err  ) =
list_tread22_fnp(d2vs, err, tread22_d2vardcl)
(* ****** ****** *)
#implfun
tread22_d2fundclist
  (  d2fs, err  ) =
list_tread22_fnp(d2fs, err, tread22_d2fundcl)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread22_decl00.dats] *)