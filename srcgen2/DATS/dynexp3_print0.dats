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
Tue 14 Feb 2023 08:27:19 PM EST
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
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
(*
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
*)
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload styp with d3pat_get_styp
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
#symload styp with d3exp_get_styp
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
#symload lctn with d3gua_get_lctn
#symload lctn with d3gpt_get_lctn
#symload lctn with d3cls_get_lctn
#symload node with d3gua_get_node
#symload node with d3gpt_get_node
#symload node with d3cls_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#symload stmp with timpl_get_stmp
#symload node with timpl_get_node
(* ****** ****** *)

#implfun
d3pat_fprint
(out, d3p0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d3p0.node() of
//
|D3Pany() =>
print("D3Pany(",")")
//
|D3Pvar(d2v) =>
print("D3Pvar(",d2v,")")
//
|D3Pint(tok) =>
print("D3Pint(",tok,")")
|D3Pbtf(sym) =>
print("D3Pbtf(",sym,")")
|D3Pchr(tok) =>
print("D3Pchr(",tok,")")
|D3Pstr(tok) =>
print("D3Pstr(",tok,")")
//
|D3Pcon(d2c) =>
print("D3Pcon(",d2c,")")
//
|
D3Pbang(d3p1) =>
print("D3Pbang(",d3p1,")")
|
D3Pflat(d3p1) =>
print("D3Pflat(",d3p1,")")
|
D3Pfree(d3p1) =>
print("D3Pfree(",d3p1,")")
//
|
D3Psapp
(d3f0, s2vs) =>
print
("D3Psapp(",d3f0,";",s2vs,")")
|
D3Psapq
(d3f0, s2as) =>
print
("D3Psapq(",d3f0,";",s2as,")")
//
|
D3Ptapq
(d3p1, tjas) =>
print("D3Ptapq(",d3p1,";",tjas,")")
//
|
D3Pdap1(d3f0) =>
(
  print("D3Pdap1(", d3f0, ")"))
//
|
D3Pdapp
(d3f0, npf1, d3ps) =>
(
print("D3Pdapp(");
print(d3f0,";",npf1,";",d3ps,")") )
//
|
D3Ptup0(npf1, d3ps) =>
print("D3Ptup0(",npf1,";",d3ps,")")
|
D3Ptup1
( tknd, npf1, d3ps ) =>
( print("D3Ptup1(")
; print(tknd,";",npf1,";",d3ps,")") )
|
D3Prcd2
( tknd, npf1, ldps ) =>
( print("D3Prcd2(")
; print(tknd,";",npf1,";",ldps,")") )
//
|
D3Pannot
(d3p1, s1e2, s2e2) =>
print("D3Pannot(",d3p1,";",s1e2,";",s2e2,")")
//
|D3Pt2pck
( d3p1 , t2p2 ) =>
(print("D3Pt2pck(",d3p1,";",t2p2,")"))
//
|D3Pnone0() => print( "D3Pnone0(",")" )
|D3Pnone1(d2p1) => print("D3Pnone1(",d2p1,")")
|D3Pnone2(d3p1) => print("D3Pnone2(",d3p1,")")
//
|
D3Perrck // HX: generated by [tread23]
(lvl1(*err-level*),d3p2) => print("D3Perrck(",lvl1,";",d3p2,")")
//
end (*let*) // end of [d3pat_fprint(out, d3p0)]

(* ****** ****** *)

#implfun
d3exp_fprint
(out, d3e0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d3e0.node() of
//
(* ****** ****** *)
//
|D3Eint(tok) =>
print("D3Eint(",tok,")")
|D3Ebtf(sym) =>
print("D3Ebtf(",sym,")")
|D3Echr(tok) =>
print("D3Echr(",tok,")")
|D3Eflt(tok) =>
print("D3Eflt(",tok,")")
|D3Estr(tok) =>
print("D3Estr(",tok,")")
//
(* ****** ****** *)
//
|D3Ei00(int) =>
print("D3Ei00(",int,")")
|D3Eb00(btf) =>
print("D3Eb00(",btf,")")
|D3Ec00(chr) =>
print("D3Ec00(",chr,")")
|D3Ef00(flt) =>
print("D3Ef00(",flt,")")
|D3Es00(str) =>
print("D3Es00(",str,")")
//
(* ****** ****** *)
//
|D3Etop(sym) =>
print("D3Etop(", sym, ")")
//
(* ****** ****** *)
//
|D3Evar(d2v) =>
print("D3Evar(", d2v, ")")
//
(* ****** ****** *)
//
|D3Econ(d2c) =>
print("D3Econ(", d2c, ")")
|D3Ecst(d2c) =>
print("D3Ecst(", d2c, ")")
//
(* ****** ****** *)
//
|
D3Etimp
(d2e1, timp) =>
print("D3Etimp(",d2e1,";",timp,")")
//
(* ****** ****** *)
//
|
D3Esapp
(d3e1, s2es) =>
print("D3Esapp(",d3e1,";",s2es,")")
|
D3Esapq
(d3e1, t2ps) =>
print("D3Esapq(",d3e1,";",t2ps,")")
//
(* ****** ****** *)
//
|
D3Etapp
(d3e1, s2es) =>
print("D3Etapp(",d3e1,";",s2es,")")
|
D3Etapq
(d3e1, tjas) =>
print("D3Etapq(",d3e1,";",tjas,")")
//
(* ****** ****** *)
//
|
D3Edap0(d3f0) =>
print( "D3Edap0(", d3f0, ")" )
|
D3Edapp
(d3f0,npf1,d3es) =>
( print("D3Edapp(")
; print(d3f0,";",npf1,";",d3es,")"))
//
(* ****** ****** *)
//
|
D3Epcon
(tknd,dlab,dtup) =>
( print("D3Epcon(")
; print(tknd,";",dlab,";",dtup,")"))
|
D3Eproj
(tknd,dlab,dtup) =>
( print("D3Eproj(")
; print(tknd,";",dlab,";",dtup,")"))
//
(* ****** ****** *)
//
|
D3Elet0
(dcls, d3e1) =>
(
print("D3Elet0(",dcls,";",d3e1,")"))
//
(* ****** ****** *)
//
|D3Eift0
(d3e1,dthn,dels) =>
( print("D3Eift0(")
; print(d3e1,";",dthn,";",dels,")"))
//
|
D3Ecas0
(tknd,d3e1,d3cs) =>
( print("D3Ecas0(");
  print(tknd,";",d3e1,";",d3cs,")"))
//
(* ****** ****** *)
//
|D3Eseqn
(d3es, d3e1) =>
(
print("D3Eseqn(",d3es,";",d3e1,")"))
//
(* ****** ****** *)
//
|D3Etup0
(npf1, d3es) =>
(
print("D3Etup0(",npf1,";",d3es,")"))
|
D3Etup1
(tknd,npf1,d3es) =>
( print("D3Etup1(")
; print(tknd,";",npf1,";",d3es,")"))
|
D3Ercd2
(tknd,npf1,ldes) =>
( print("D3Ercd2(")
; print(tknd,";",npf1,";",ldes,")"))
//
(* ****** ****** *)
//
|
D3Elam0
(tknd,f3as
,sres,arrw,body) =>
(
print
("D3Elam0(",tknd,";");
print
(f3as,";",sres,";",arrw,";",body,")"))
//
|
D3Efix0
(tknd,fid0,f3as
,sres,arrw,body) =>
(
print
("D3Efix0(",tknd,";",fid0,";");
print
(f3as,";",sres,";",arrw,";",body,")"))
//
(* ****** ****** *)
//
|
D3Etry0
( tknd
, d3e1, dcls) =>
(print("D3Etry0(")
;print( tknd, ";",d3e1, ";",dcls,")"))
//
(* ****** ****** *)
//
|
D3Eaddr
(   d3e1   ) =>
print("D3Eaddr(",d3e1,")") // left-val
|
D3Eview
(   d3e1   ) =>
print("D3Eview(",d3e1,")") // left-val
|
D3Eflat
(   d3e1   ) =>
print("D3Eflat(",d3e1,")") // left-val
//
(* ****** ****** *)
//
|
D3Eeval
(   d3e1   ) =>
print("D3Eeval(",d3e1,")") // eval-fun
//
(* ****** ****** *)
//
|
D3Efold
(   d3e1   ) =>
print("D3Efold(",d3e1,")") // open-con
|
D3Efree
(   d3e1   ) =>
print("D3Efree(",d3e1,")") // free-con
//
(* ****** ****** *)
//
|
D3Edp2tr
(   d3e1   ) =>
print("D3Edp2tr(",d3e1,")") // de-p2tr
//
(* ****** ****** *)
//
|
D3Edl0az
(   d3e1   ) =>
print("D3Edl0az(",d3e1,")") // de-l0az
|
D3Edl1az
(   d3e1   ) =>
print("D3Edl1az(",d3e1,")") // de-l1az
//
(* ****** ****** *)
//
|
D3Ewhere
(d3e1, dcls) =>
(
 print("D3Ewhere(",d3e1,";",dcls,")"))
//
|
D3Eassgn
(d3el, d3er) =>
(
 print("D3Eassgn(",d3el,";",d3er,")"))
//
(* ****** ****** *)
//
|
D3Eraise
(tknd, d3e1) =>
(
 print("D3Eraise(",tknd,";",d3e1,")"))
//
(* ****** ****** *)
//
|
D3El0azy
( dsym, d3e1 ) =>
(
 print("D3El0azy(",dsym,";",d3e1,")"))
|
D3El1azy
( dsym
, d3e1 , d3es ) =>
(
  print("D3El1azy(")
; print( dsym, ";",d3e1, ";",d3es,")"))
//
(* ****** ****** *)
//
|D3Eannot
( d3e1
, s1e2 , s2e2 ) =>
(
  print("D3Eannot(")
; print( d3e1, ";",s1e2, ";",s2e2,")"))
//
(* ****** ****** *)
//
|D3El2bck
( d3e1 , lab2 ) =>
let
val
t2p1 = d3e1.styp() in
(
  print("D3El2bck(")
; print( d3e1, ";",t2p1, ";",lab2,")"))
endlet // end of [ D3El2bck(d3e1, lab2) ]
|D3Et2pck
( d3e1 , t2p2 ) =>
let
val
t2p1 = d3e1.styp() in
(
  print("D3Et2pck(")
; print( d3e1, ";",t2p1, ";",t2p2,")"))
endlet // end of [ D3Et2pck(d3e1, t2p2) ]
//
(* ****** ****** *)
//
|
D3Eextnam
( tknd, gnam) =>
(
print("D3Eextnam(",tknd,";",gnam,")") )
//
(* ****** ****** *)
//
|
D3Eexists
( s2es, d3e1) =>
(
print("D3Eexists(",s2es,";",d3e1,")") )
//
(* ****** ****** *)
//
|D3Enone0() => print( "D3Enone0(", ")" )
|D3Enone1(d2e1) => print("D3Enone1(", d2e1, ")")
|D3Enone2(d3e1) => print("D3Enone2(", d3e1, ")")
//
(* ****** ****** *)
//
|
D3Eerrck // HX: generated by [tread23]
(lvl1(*err-level*),d3e2) => print("D3Eerrck(",lvl1,";",d3e2,")")
//
end (*let*) // end of [d3exp_fprint(out, d3e0)]

(* ****** ****** *)

#implfun
f3arg_fprint
(out, farg) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
farg.node() of
|
F3ARGdapp
(npf1,d3ps) =>
print
("F3ARGdapp(",npf1,";",d3ps,")")
|
F3ARGsapp
(s2vs,s2ps) =>
print
("F3ARGsapp(",s2vs,";",s2ps,")")
|
F3ARGmets
(   s2es   ) => print("F3ARGmets(",s2es,")")
(*
|
F3ARGsapq
(   s2vs   ) => print("F3ARGsapq(",s2vs,")")
*)
//
end (*let*) // end of [f3arg_fprint(out,farg)]

(* ****** ****** *)
//
#implfun
d3gua_fprint
(out, dgua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dgua.node() of
|
D3GUAexp(d3e1) =>
print("D3GUAexp(",d3e1,")")
|
D3GUAmat(d3e1,d3p2) =>
print("D3GUAmat(",d3e1,";",d3p2,")")
//
end (*let*) // end of [d3gua_fprint(out,dgua)]
//
(* ****** ****** *)
//
#implfun
d3gpt_fprint
(out, dgpt) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dgpt.node() of
|
D3GPTpat(d3p1) =>
print("D3GPTpat(",d3p1,")")
|
D3GPTgua(d3p1,d3gs) =>
print("D3GPTgua(",d3p1,";",d3gs,")")
end (*let*) // end of [d3gpt_fprint(out,dgpt)]
//
#implfun
d3cls_fprint
(out, dcls) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcls.node() of
|
D3CLSgpt(dgpt) =>
print("D3CLSgpt(",dgpt,")")
|
D3CLScls(d3g1,d3e2) =>
print("D3CLScls(",d3g1,";",d3e2,")")
end (*let*) // end of [d3cls_fprint(out,dcls)]
//
(* ****** ****** *)

#implfun
d3ecl_fprint
(out, dcl0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl0.node() of
//
|D3Cd2ecl(d2cl) =>
print("D3Cd2ecl(",d2cl,")")
//
|
D3Cstatic(tknd,dcl1) =>
print("D3Cstatic(",tknd,";",dcl1,")")
|
D3Cextern(tknd,dcl1) =>
print("D3Cextern(",tknd,";",dcl1,")")
//
|
D3Ctmpsub(svts,dcl1) =>
print("D3Ctmpsub(",svts,";",dcl1,")")
//
|
D3Clocal0(head, body) =>
print( "D3Clocal(",head,";",body,")" )
//
|
D3Cabsopen
( tknd , simp ) =>
print("D3Cabsopen(",tknd,";",simp,")")
|
D3Cabsimpl
(tknd,simp,sdef) =>
( print("D3Cabsimpl(")
; print( tknd,";", simp,";",sdef,")"))
//
|
D3Cinclude
( knd0, tknd
, gsrc, fopt, dopt ) =>
(
print("D3Cinclude(");
print
(
knd0,";",
tknd,";",gsrc,";",fopt,";","...",")"))
//
|
D3Cstaload
( knd0, tknd
, gsrc, fopt, dopt ) =>
(
print("D3Cstaload(");
print
(knd0,";",tknd,";",gsrc,";",fopt,")"))
//
|
D3Cvaldclst
(  tknd, d3vs  ) =>
(
print("D3Cvaldclst(",tknd,";",d3vs,")"))
|
D3Cvardclst
(  tknd, d3vs  ) =>
(
print("D3Cvardclst(",tknd,";",d3vs,")"))
//
|
D3Cfundclst
(tknd
,tqas,d2cs,d3fs) =>
(
print("D3Cfundclst(");
print(tknd,";",tqas,";",d2cs,";",d3fs,")"))
//
|
D3Cimplmnt0
(tknd
,stmp
,sqas,tqas
,dqid,tias
,farg,sres,body) =>
(
print("D3Cimplmnt0(");
print(tknd,";",stmp,";");
print(sqas,";",tqas,";");
print(dqid,";",tias,";",farg,";",sres,";",body,")"))
//
|
D3Ctmplocal
(  dtmp, dcls ) =>
(
print("D3Ctmplocal(",dtmp,";",dcls,")"))
//
|
D3Cimpltmpr(dcl1,t2js) =>
(
print("D3Cimpltmpr(",dcl1,";",t2js,")"))
//
|D3Cnone0() => print( "D3Cnone0(", ")" )
|D3Cnone1(d2cl) => print( "D3Cnone1(",d2cl,")" )
|D3Cnone2(d3cl) => print( "D3Cnone2(",d3cl,")" )
//
|
D3Cerrck // HX: generated by [tread23]
(lvl1(*err-level*),d3cl) => print("D3Cerrck(",lvl1,";",d3cl,")")
//
end (*let*) // end of [d3ecl_fprint(out, dcl0)]

(* ****** ****** *)
//
#implfun
timpl_fprint
(out, timp) =
let
#implfun
g_print$out<>() = out
in//let
case+
timp.node() of
//
(*
|TIMPLone1
(  dcl1  ) =>
print("TIMPLone1(", dcl1 ,")")
*)
//
|TIMPLall1
(d2c1, dcls) =>
print("TIMPLall1(",d2c1,";",dcls,")")
//
|TIMPLallx
(d2c1, dcls) =>
print("TIMPLallx(",d2c1,";",dcls,")")
//
end (*let*) // end of [timpl_fprint(...)]
//
(* ****** ****** *)

#implfun
d3valdcl_fprint
  (out, dval) = let
//
val dpat =
d3valdcl_get_dpat(dval)
val tdxp =
d3valdcl_get_tdxp(dval)
val wsxp =
d3valdcl_get_wsxp(dval)
//
#impltmp g_print$out<>() = out
//
in//let
(
print
("D3VALDCL(",dpat,";",tdxp,";",wsxp,")"))
end(*let*)//end-of-[d3valdcl_fprint(out,dval)]

(* ****** ****** *)
//
#implfun
d3vardcl_fprint
  (out, dvar) = let
//
val dpid =
d3vardcl_get_dpid(dvar)
val vpid =
d3vardcl_get_vpid(dvar)
val sres =
d3vardcl_get_sres(dvar)
val dini =
d3vardcl_get_dini(dvar)
//
#impltmp g_print$out<>() = out
//
in//let
(
print("D3VARDCL(");
print(dpid,";",vpid,";",sres,";",dini,")"))
end(*let*)//end-of-[d3vardcl_fprint(out,dvar)]
//
(* ****** ****** *)

#implfun
d3fundcl_fprint
  (out, dfun) = let
//
val dpid =
d3fundcl_get_dpid(dfun)
val farg =
d3fundcl_get_farg(dfun)
val sres =
d3fundcl_get_sres(dfun)
val tdxp =
d3fundcl_get_tdxp(dfun)
val wsxp =
d3fundcl_get_wsxp(dfun)
//
#impltmp g_print$out<>() = out
//
in//let
(
print("D3FUNDCL(",dpid,";");
print(farg,";",sres,";",tdxp,";",wsxp,")"))
end(*let*)//end-of-[d3fundcl_fprint(out,dfun)]

(* ****** ****** *)

#implfun
d3parsed_fprint
  (out, dpar) = let
//
val
stadyn =
d3parsed_get_stadyn(dpar)
val
nerror =
d3parsed_get_nerror(dpar)
val
source =
d3parsed_get_source(dpar)
val
parsed =
d3parsed_get_parsed(dpar)
//
#impltmp g_print$out<>() = out
//
in//let
(
print
("D3PARSED(");
print
(stadyn,";",nerror,";",source,";",parsed,")"))
end (*let*) // end-of-[d3parsed_fprint(out,dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp3_print0.dats] *)
