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
Start Time: June 18th, 2022
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
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
(* ****** ****** *)
#symload lctn with s0tdf_get_lctn
#symload node with s0tdf_get_node
(* ****** ****** *)
//
#symload lctn with s0arg_get_lctn
#symload node with s0arg_get_node
//
#symload lctn with s0mag_get_lctn
#symload node with s0mag_get_node
//
#symload lctn with t0arg_get_lctn
#symload node with t0arg_get_node
//
#symload lctn with t0mag_get_lctn
#symload node with t0mag_get_node
//
#symload lctn with s0qua_get_lctn
#symload node with s0qua_get_node
//
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with s0tcn_get_lctn
#symload node with s0tcn_get_node
(* ****** ****** *)
#symload lctn with d0tst_get_lctn
#symload node with d0tst_get_node
(* ****** ****** *)
#symload lctn with s0uni_get_lctn
#symload node with s0uni_get_node
(* ****** ****** *)
#symload lctn with d0tcn_get_lctn
#symload node with d0tcn_get_node
(* ****** ****** *)
#symload lctn with d0typ_get_lctn
#symload node with d0typ_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)

#define
FPEMSG_ERRVL 2

(* ****** ****** *)
#symload fpemsg with i0dnt_fpemsg
#symload fpemsg with t0int_fpemsg
#symload fpemsg with t0chr_fpemsg
#symload fpemsg with t0flt_fpemsg
#symload fpemsg with t0str_fpemsg
(* ****** ****** *)
#symload fpemsg with sort0_fpemsg
#symload fpemsg with s0exp_fpemsg
#symload fpemsg with l0s0e_fpemsg
(* ****** ****** *)
#symload fpemsg with sort0opt_fpemsg
#symload fpemsg with s0expopt_fpemsg
#symload fpemsg with sort0lst_fpemsg
#symload fpemsg with s0explst_fpemsg
#symload fpemsg with s0exp_RPAREN_fpemsg
#symload fpemsg with l0s0e_RBRACE_fpemsg
(* ****** ****** *)
#symload fpemsg with d0pat_fpemsg
#symload fpemsg with d0exp_fpemsg
#symload fpemsg with d0ecl_fpemsg
(* ****** ****** *)
#symload fpemsg with d0patopt_fpemsg
#symload fpemsg with d0expopt_fpemsg
#symload fpemsg with d0patlst_fpemsg
#symload fpemsg with d0explst_fpemsg
#symload fpemsg with d0eclist_fpemsg
(* ****** ****** *)
#extern
fun
token_BAR_fpemsg:(FILR,token)->void
#extern
fun
token_EQ0_fpemsg:(FILR,token)->void
#extern
fun
token_RPAREN_fpemsg:(FILR,token)->void
#extern
fun
token_RBRACE_fpemsg:(FILR,token)->void
#extern
fun
token_ENDWHR_fpemsg:(FILR,token)->void
(* ****** ****** *)
//
#implfun
i0dnt_fpemsg
(out, id0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ id0 of
|
I0DNTsome _ => ()
|
I0DNTnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",id0)
end (*let*)//end-of-[i0dnt_fpemsg(out,id0)]
//
(* ****** ****** *)
//
#implfun
t0int_fpemsg
(out, int) =
let
#impltmp
g_print$out<>() = out
in//let
case+ int of
|
T0INTsome _ => ()
|
T0INTnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",int)
end (*let*)//end-of-[t0int_fpemsg(out,int)]
//
#implfun
t0int_fpemsg
(out, chr) =
let
#impltmp
g_print$out<>() = out
in//let
case+ chr of
|
T0CHRsome _ => ()
|
T0CHRnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",chr)
end (*let*)//end-of-[t0chr_fpemsg(out,chr)]
//
#implfun
t0flt_fpemsg
(out, flt) =
let
#impltmp
g_print$out<>() = out
in//let
case+ flt of
|
T0FLTsome _ => ()
|
T0FLTnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",flt)
end (*let*)//end-of-[t0chr_fpemsg(out,flt)]
//
#implfun
t0str_fpemsg
(out, str) =
let
#impltmp
g_print$out<>() = out
in//let
case+ str of
|
T0STRsome _ => ()
|
T0STRnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",str)
end (*let*)//end-of-[t0chr_fpemsg(out,str)]
//
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, s0t: sort0): void =
let
#impltmp
g_print$out<>() = out
in//let
case
s0t.node() of
//
|
S0Tid0(id0) =>
i0dnt_fpemsg(out, id0)
|
S0Tint(int) =>
t0int_fpemsg(out, int)
//
|
S0Tapps(sts) =>
sort0lst_fpemsg(out, sts)
|
S0Tlpar(tkb,sts,tke) =>
sort0lst_fpemsg(out, sts)
|
S0Ttkerr _ => ( (*void*) )
|
S0Terrck _ => sort0_fpemsg(out, s0t)
end(*let*)//end-of-(auxmain(out,s0t))
//
in//local
//
#implfun
sort0_fpemsg
(out, s0t) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s0t.node() of
|
S0Terrck(lvl, st1) =>
(
auxmain( out, st1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:", s0t.lctn(), ":",s0t)
)
| _(* otherwise *) => ((*void*))
//
end(*let*)//end-of(sort0_fpemsg(out,s0t))
//
endloc(*local*)//end-of(local(sort0_fpemsg))

(* ****** ****** *)

local
//
fun
auxmain
( out: FILR
, s0e: s0exp): void =
let
#impltmp
g_print$out<>() = out
in//let
case
s0e.node() of
//
|
S0Eid0(id0) =>
i0dnt_fpemsg(out, id0)
//
|
S0Eint(int) =>
t0int_fpemsg(out, int)
|
S0Echr(chr) =>
t0chr_fpemsg(out, chr)
|
S0Eflt(flt) =>
t0flt_fpemsg(out, flt)
|
S0Estr(str) =>
t0str_fpemsg(out, str)
//
|
S0Eop1 _ => ((*void*))
|
S0Eop2 _ => ((*void*))
|
S0Eop3 _ => ((*void*))
//
|
S0Eapps(ses) =>
s0explst_fpemsg(out, ses)
|
S0Efimp(tkb,ses,tke) =>
s0explst_fpemsg(out, ses)
|
S0Elpar(tkb,ses,srp) =>
(
fpemsg(out, ses); fpemsg(out, srp)
)
|
S0Etkerr _ => ( (*void*) )
|
S0Eerrck _ => s0exp_fpemsg(out, s0e)
end(*let*)//end-of-(auxmain(out,s0e))

in//local
//
#implfun
s0exp_fpemsg
(out, s0e) =
let
#impltmp
g_print$out<>() = out
in//let
case
s0e.node() of
|
S0Eerrck(lvl, se1) =>
(
auxmain( out, se1 );
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:",s0e.lctn(),":",s0e)
)
| _(* otherwise *) => (   (*void*)   )
end(*let*)//end-of(s0exp_fpemsg(out,s0e))
//
endloc(*local*)//end-of-local(s0exp_fpemsg)

(* ****** ****** *)
//
#implfun
l0s0e_fpemsg
(out, lse) =
(
case+ lse of
|
S0LAB
(lab,teq,s0e) => s0exp_fpemsg(out,s0e)
) (*case*)//end-of(l0s0e_fpemsg(out,lse))
//
(* ****** ****** *)
//
#implfun
s0arg_fpemsg
(out, s0a) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s0a.node() of
|
S0ARGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",s0a)
|
S0ARGsome(sid1,topt) =>
(
  fpemsg(out, sid1); fpemsg(out, topt)
)
end(*let*)//end-of-[s0arg_fpemsg(out,s0a)]
//
(* ****** ****** *)
//
#implfun
t0arg_fpemsg
(out, t0a) =
let
#impltmp
g_print$out<>() = out
in//let
case+
t0a.node() of
|
T0ARGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", t0a)
|
T0ARGsome(s0t1,topt) => fpemsg(out,s0t1)
end(*let*)//end-of-[t0arg_fpemsg(out,t0a)]
//
(* ****** ****** *)
#implfun
t0mag_fpemsg
(out, tma) =
let
#impltmp
g_print$out<>() = out
in//let
case+
tma.node() of
|
T0MAGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", tma)
|
T0MAGlist
(tbeg,t0as,tend) =>
let
//
val () = t0arglst_fpemsg(out, t0as)
val () = token_RPAREN_fpemsg(out, tend)
//
end(*let*)//end-of-[T0MAGlist(_,_,_)]
end(*let*)//end-of-[t0mag_fpemsg(out,tma)]
(* ****** ****** *)
//
#implfun
s0qua_fpemsg
(out, s0q) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s0q.node() of
|
S0QUAprop(s0e) =>
s0exp_fpemsg(out, s0e)
|
S0QUAvars(sids, tres) =>
let
//
val () = i0dntlst_fpemsg(out, sids)
val () = sort0opt_fpemsg(out, tres)
//
end(*let*)//end-of-[S0QUAvars(_,_)]
end(*let*)//end-of-[s0qua_fpemsg(out,lse)]
//
(* ****** ****** *)
//
#implfun
s0tdf_fpemsg
(out, tdf) =
let
#impltmp
g_print$out<>() = out
in//let
case+
tdf.node() of
|
S0TDFsort(s0t) =>
sort0_fpemsg(out, s0t)
|
S0TDFtsub
(tbeg,s0a1,tbar,s0es,tend) =>
let
val () =
  s0arg_fpemsg(out, s0a1)
val () =
  token_BAR_fpemsg(out, tbar)
val () = s0explst_fpemsg(out, s0es)
val () = token_RBRACE_fpemsg(out, tend)
end(*let*)//end of [S0TDFtsub(out,tdf)]
end(*let*)//end-of-[s0tdf_fpemsg(out,tdf)]
//
(* ****** ****** *)
//
#implfun
sort0opt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(s0t) => sort0_fpemsg(out, s0t)
)
#implfun
s0expopt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(s0e) => s0exp_fpemsg(out, s0e)
)
//
(* ****** ****** *)
#implfun
i0dntlst_fpemsg
(out, ids) =
list_foreach<i0dnt>(ids) where
{
#impltmp
foreach$work<i0dnt>(id1) = i0dnt_fpemsg(out,id1)
}
(* ****** ****** *)
//
#implfun
sort0lst_fpemsg
(out, sts) =
list_foreach<sort0>(sts) where
{
#impltmp
foreach$work<sort0>(st1) = sort0_fpemsg(out,st1)
}
#implfun
s0explst_fpemsg
(out, ses) =
list_foreach<s0exp>(ses) where
{
#impltmp
foreach$work<s0exp>(se1) = s0exp_fpemsg(out,se1)
}
#implfun
l0s0elst_fpemsg
(out, lxs) =
list_foreach<l0s0e>(lxs) where
{
#impltmp
foreach$work<l0s0e>(lx1) = l0s0e_fpemsg(out,lx1)
}
//
(* ****** ****** *)
//
#implfun
s0maglst_fpemsg
(out, sms) =
list_foreach<s0mag>(sms) where
{
#impltmp
foreach$work<s0mag>(sma) = s0mag_fpemsg(out,sma)
}
(* ****** ****** *)
//
#implfun
t0arglst_fpemsg
(out, tas) =
list_foreach<t0arg>(tas) where
{
#impltmp
foreach$work<t0arg>(t0a) = t0arg_fpemsg(out,t0a)
}
(* ****** ****** *)
//
#implfun
t0maglst_fpemsg
(out, tms) =
list_foreach<t0mag>(tms) where
{
#impltmp
foreach$work<t0mag>(tma) = t0mag_fpemsg(out,tma)
}
(* ****** ****** *)
//
#implfun
s0qualst_fpemsg
(out, sqs) =
list_foreach<s0qua>(sqs) where
{
#impltmp
foreach$work<s0qua>(sq1) = s0qua_fpemsg(out,sq1)
}
(* ****** ****** *)
//
#implfun
s0exp_RPAREN_fpemsg
(out, srp) =
(
case+ srp of
|
s0exp_RPAREN_cons0
(      tend      ) => ()
|
s0exp_RPAREN_cons1
(tbar, s0es, tend) => s0explst_fpemsg(out,s0es)
)
//
#implfun
l0s0e_RBRACE_fpemsg
(out, lsrb) =
(
case+ lsrb of
|
l0s0e_RBRACE_cons0
(      tend      ) => ()
|
l0s0e_RBRACE_cons1
(tbar, lses, tend) => l0s0elst_fpemsg(out,lses)
)
//
(* ****** ****** *)

local
//
fun
auxmain
( out: FILR
, d0p: d0pat): void =
let
#impltmp
g_print$out<>() = out
in//let
case
d0p.node() of
//
|
D0Pid0(id0) =>
i0dnt_fpemsg(out, id0)
//
|
D0Pint(int) =>
t0int_fpemsg(out, int)
|
D0Pchr(chr) =>
t0chr_fpemsg(out, chr)
|
D0Pflt(flt) =>
t0flt_fpemsg(out, flt)
|
D0Pstr(str) =>
t0str_fpemsg(out, str)
//
|
D0Papps(ses) =>
d0patlst_fpemsg(out, ses)
//
|
D0Ptkerr _ => ( (*void*) )
|
D0Perrck _ => d0pat_fpemsg(out,d0p)
//
end(*let*)//end-of-(auxmain(out,d0p))
//
in//local
//
#implfun
d0pat_fpemsg
(out, d0p) =
let
#impltmp
g_print$out<>() = out
in//let
case+
d0p.node() of
|
D0Perrck(lvl, se1) =>
(
d0pat_fpemsg(out, se1)
; 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:", d0p.lctn(), ":", d0p)
)
//
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(d0pat_fpemsg(out,d0p))
//
endloc(*local*)//end-of-local(d0pat_fpemsg)

(* ****** ****** *)

local
//
fun
auxmain
( out: FILR
, d0e: d0exp): void =
let
#impltmp
g_print$out<>() = out
in//let
case
d0e.node() of
//
|
D0Eid0(id0) =>
i0dnt_fpemsg(out, id0)
//
|
D0Eint(int) =>
t0int_fpemsg(out, int)
|
D0Echr(chr) =>
t0chr_fpemsg(out, chr)
|
D0Eflt(flt) =>
t0flt_fpemsg(out, flt)
|
D0Estr(str) =>
t0str_fpemsg(out, str)
//
|
D0Eopid(id0) =>
i0dnt_fpemsg(out, id0)
//
|
D0Eapps(ses) =>
d0explst_fpemsg(out, ses)
//
|
D0Etkerr _ => ( (*void*) )
|
D0Eerrck _ => d0exp_fpemsg(out,d0e)
//
end(*let*)//end-of-(auxmain(out,d0e))
//
in//local
//
#implfun
d0exp_fpemsg
(out, d0e) =
let
#impltmp
g_print$out<>() = out
in//let
case+
d0e.node() of
|
D0Eerrck(lvl, se1) =>
(
d0exp_fpemsg(out, se1)
; 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:", d0e.lctn(), ":", d0e)
)
//
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(d0exp_fpemsg(out,d0e))
//
endloc(*local*)//end-of-local(d0exp_fpemsg)

(* ****** ****** *)
//
#extern
fun
s0tcn_fpemsg:(FILR,s0tcn)->void
#extern
fun
d0tst_fpemsg:(FILR,d0tst)->void
//
#extern
fun
s0tcnlst_fpemsg:(FILR,s0tcnlst)->void
#extern
fun
d0tstlst_fpemsg:(FILR,d0tstlst)->void
//
(* ****** ****** *)
//
#extern
fun
s0uni_fpemsg:(FILR,s0uni)->void
#extern
fun
d0tcn_fpemsg:(FILR,d0tcn)->void
#extern
fun
d0typ_fpemsg:(FILR,d0typ)->void
#extern
fun
s0unilst_fpemsg:(FILR,s0unilst)->void
#extern
fun
d0tcnlst_fpemsg:(FILR,d0tcnlst)->void
#extern
fun
d0typlst_fpemsg:(FILR,d0typlst)->void
#extern
fun
wd0eclseq_fpemsg:(FILR,wd0eclseq)->void
//
(* ****** ****** *)
//
local
//
fun
auxmain
( out: FILR
, dcl: d0ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
|
D0Cnonfix
(knd, ids) =>
i0dntlst_fpemsg(out, ids)
|
D0Cfixity
(knd, ids, opt) =>
i0dntlst_fpemsg(out, ids)
//
|
D0Cstatic
(knd, dc1) =>
let
val () = fpemsg(out, dc1)
endlet //end-of(D0Cstatic(_,_))
|
D0Cextern
(knd, dc1) =>
let
val () = fpemsg(out, dc1)
endlet //end-of(D0Cextern(_,_))
//
|
D0Clocal
( tkb, ds1
, tin, ds2, tke) =>
let
val () =
d0eclist_fpemsg(out, ds1)
val () =
d0eclist_fpemsg(out, ds2)
endlet // end of [D0Clocal(...)]
//
|
D0Cabssort
(knd, tid) => let
  val () = fpemsg(out, tid)
endlet // end-of(D0Cabssort(...))
//
|
D0Cstacst0
( knd, sid
, tmas, tcln, s0t1) =>
let
  val () = fpemsg(out, sid)
  val () =
  t0maglst_fpemsg(out, tmas)
  val () = fpemsg(out, s0t1)
endlet // end-of-(D0Cstacst0(...))
//
|
D0Csortdef
(knd,tid,teq1,tdf2) =>
let
val () = fpemsg(out, tid)
val () =
token_EQ0_fpemsg(out, teq1)
val () = s0tdf_fpemsg(out, tdf2)
endlet // end-of-(D0Csortdef(...))
//
|
D0Cdatasort
(knd, d0ts) => let
val () = d0tstlst_fpemsg(out, d0ts)
endlet // end-of-(D0Cdatasort(_,_))
//
|
D0Cdatatype
( knd
, d0ts, wdcs) => let
val () = d0typlst_fpemsg(out, d0ts)
val () = wd0eclseq_fpemsg(out, wdcs)
endlet // end-of-(D0Cdatatype(_,_,_))
//
|
D0Ctkerr _  => ( (*void*) )
|
D0Cerrck _  => d0ecl_fpemsg(out, dcl)
//
| _(* otherwise *) => ((*void*))
end (*let*) // end of [auxmain(out, dcl)]
//
in//local
//
#implfun
d0ecl_fpemsg
(out, dcl) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcl.node() of
|
D0Cerrck(lvl, dc1)  =>
(
auxmain( out, dc1 );
println
("PREADX0-ERROR:", dcl.lctn(), ":", dcl))
//
| _(* otherwise *) => ((*void*))
end (*let*)//end-of(d0ecl_fpemsg(out,dcl))
//
endloc(*local*)//end-of(local(d0ecl_fpemsg))
//
(* ****** ****** *)
//
#implfun
d0patopt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(d0p) => d0pat_fpemsg(out, d0p)
)
#implfun
d0expopt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(d0e) => d0exp_fpemsg(out, d0e)
)
//
(* ****** ****** *)
//
#implfun
d0patlst_fpemsg
(out, dps) =
list_foreach<d0pat>(dps) where
{
#impltmp
foreach$work<d0pat>(dp1) = d0pat_fpemsg(out,dp1)
}
//
#implfun
d0explst_fpemsg
(out, des) =
list_foreach<d0exp>(des) where
{
#impltmp
foreach$work<d0exp>(de1) = d0exp_fpemsg(out,de1)
}
//
(* ****** ****** *)
//
#implfun
d0eclist_fpemsg
(out, dcls) =
list_foreach<d0ecl>(dcls) where
{
#impltmp
foreach$work<d0ecl>(dcl1) = d0ecl_fpemsg(out,dcl1)
}
//
(* ****** ****** *)
//
#implfun
token_BAR_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tok0.node() of
|
T_BAR() => ((*void*))
|
_(*non-T_BAR*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [ t0ken_BAR_fpemsg ]
//
#implfun
token_EQ0_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tok0.node() of
|
T_EQ0() => ((*void*))
|
_(*non-T_EQ0*) =>
println
("PREADX0-ERROR:", tok0.lctn(), ":", tok0)
//
end (*let*) // end of [ t0ken_EQ0_fpemsg ]
//
#implfun
token_RPAREN_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_RPAREN() => ((*void*))
|
_(*non-T_RPAREN*) =>
println
("PREADX0-ERROR:", tok0.lctn(), ":", tok0)
end (*let*) // end of [token_RPAREN_fpemsg]
//
#implfun
token_RBRACE_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_RBRACE() => ((*void*))
|
_(*non-T_RBRACE*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
end (*let*) // end of [token_RBRACE_fpemsg]
//
#implfun
token_ENDWHR_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_ENDWHR() => ((*void*))
|
_(*non-T_ENDWHR*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
end (*let*) // end of [token_ENDWHR_fpemsg]
//
(* ****** ****** *)
//
#implfun
s0tcn_fpemsg
(out, tcn0) =
(
case+
tcn0.node() of
|
S0TCNnode(seid,tres) =>
let
val () = i0dnt_fpemsg(out, seid)
val () = sort0opt_fpemsg(out, tres)
endlet //end-of-[S0TCNnode(_,_)]
) (*case+*) // end-of-[ s0tcn_fpemsg(_,_) ]
//
(* ****** ****** *)
//
#implfun
d0tst_fpemsg
(out, d0t0) =
(
case+
d0t0.node() of
|
D0TSTnode
(stid
,teq1,tbar,tcns) =>
let
val () =
i0dnt_fpemsg(out, stid)
val () =
token_EQ0_fpemsg(out, teq1)
val () = s0tcnlst_fpemsg(out, tcns)
endlet // end of [D0TSTnode(_,_,_,_)]
) (*case+*)//end-of-[d0tst_fpemsg(out,d0t0)]
//
(* ****** ****** *)
//
#implfun
s0tcnlst_fpemsg
(out, tcns) =
list_foreach<s0tcn>(tcns) where
{
#impltmp
foreach$work<s0tcn>(tcn1) = s0tcn_fpemsg(out,tcn1)
}
//
(* ****** ****** *)
//
#implfun
d0tstlst_fpemsg
(out, d0ts) =
list_foreach<d0tst>(d0ts) where
{
#impltmp
foreach$work<d0tst>(d0t1) = d0tst_fpemsg(out,d0t1)
}
//
(* ****** ****** *)
//
#implfun
s0uni_fpemsg
(out, s0u0) =
let
#impltmp
g_print$out<>() = out
in
case+
s0u0.node() of
|
S0UNInone(tok) => ()
|
S0UNIsome
(tbeg,s0qs,tend) =>
let
val () = s0qualst_fpemsg(out,s0qs)
val () = token_RBRACE_fpemsg(out,tend)
end (*let*)//end-of-[S0UNIsome(_,_,_)]
end (*let*)//end-of-[s0uni_fpemsg(out,s0u0)]

(* ****** ****** *)
//
#implfun
d0tcn_fpemsg
(out, tcn0) =
(
case+
tcn0.node() of
|
D0TCNnode
( s0us
, deid
, s0es, sres) =>
let
val () =
i0dnt_fpemsg(out, deid)
val () =
s0unilst_fpemsg(out, s0us)
val () = s0explst_fpemsg(out, s0es)
val () = s0expopt_fpemsg(out, sres)
endlet // end of [D0TCNnode(_,_,_,_)]
) (*case+*)//end-of-[d0tcn_fpemsg(out,tcn0)]
//
(* ****** ****** *)
//
#implfun
d0typ_fpemsg
(out, d0t0) =
(
case+
d0t0.node() of
|
D0TYPnode
( deid
, tmas, tres
, teq1, tcns) =>
let
val () =
i0dnt_fpemsg(out, deid)
val () =
t0maglst_fpemsg(out, tmas)
val () =
sort0opt_fpemsg(out, tres)
val () =
token_EQ0_fpemsg(out, teq1)
val () = d0tcnlst_fpemsg(out, tcns)
endlet // end of [D0TYPnode(_,_,_,_,_)]
) (*case+*)//end-of-[d0typ_fpemsg(out,d0t0)]
//
(* ****** ****** *)
//
#implfun
s0unilst_fpemsg
(out, s0us) =
list_foreach<s0uni>(s0us) where
{
#impltmp
foreach$work<s0uni>(s0u1) = s0uni_fpemsg(out,s0u1)
}
//
(* ****** ****** *)
//
#implfun
d0tcnlst_fpemsg
(out, tcns) =
list_foreach<d0tcn>(tcns) where
{
#impltmp
foreach$work<d0tcn>(tcn1) = d0tcn_fpemsg(out,tcn1)
}
//
(* ****** ****** *)
//
#implfun
d0typlst_fpemsg
(out, d0ts) =
list_foreach<d0typ>(d0ts) where
{
#impltmp
foreach$work<d0typ>(d0t1) = d0typ_fpemsg(out,d0t1)
}
//
(* ****** ****** *)
//
#implfun
wd0eclseq_fpemsg
(out, wdcs) =
(
case+ wdcs of
|
WD0CSnone() => ((*void*))
|
WD0CSsome
(twhr, topt, d0es, tend) =>
let
//
val () =
d0eclist_fpemsg(out, d0es)
//
val () =
(
case+ topt of
|
optn_nil() => token_ENDWHR_fpemsg(out, tend)
|
optn_cons _ => token_RBRACE_fpemsg(out, tend))
//
endlet // end of [WD0CSsome(_,_,_,_)]
) (*case+*) // end-of-[wd0eclseq_fpemsg(out,wdcs)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_errmsg.dats] *)
