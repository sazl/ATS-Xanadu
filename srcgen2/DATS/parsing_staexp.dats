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
Start Time: June 16th, 2022
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
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#symload
lctn with token_get_lctn//lexing0
#symload
lctn with i0dnt_get_lctn//staexp0
#symload
lctn with l0abl_get_lctn//staexp0
(* ****** ****** *)
#symload
node with token_get_node//lexing0
#symload
node with i0dnt_get_node//staexp0
#symload
node with l0abl_get_node//staexp0
(* ****** ****** *)
#symload
tnode with token_get_node//lexing0
(* ****** ****** *)

#implfun
p1_t0int(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0int(tnd)
then
( buf.skip1()
; T0INTsome(tok)) else T0INTnone(tok)
//
end(*let*)//end-of-[p1_t0int(buf,err)]

(* ****** ****** *)

#implfun
p1_t0chr(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0chr(tnd)
then
( buf.skip1()
; T0CHRsome(tok)) else T0CHRnone(tok)
//
end(*let*)//end-of-[p1_t0chr(buf,err)]

(* ****** ****** *)

#implfun
p1_t0flt(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0flt(tnd)
then
( buf.skip1()
; T0FLTsome(tok)) else T0FLTnone(tok)
//
end(*let*)//end-of-[p1_t0flt(buf,err)]

(* ****** ****** *)

#implfun
p1_t0str(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0str(tnd)
then
( buf.skip1()
; T0STRsome(tok)) else T0STRnone(tok)
//
end(*let*)//end-of-[p1_t0str(buf,err)]

(* ****** ****** *)

#implfun
p1_s0eid(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
T_IDALP _ =>
(buf.skip1(); i0dnt_some(tok))
|
T_IDSYM _ =>
(buf.skip1(); i0dnt_some(tok))
|
T_IDDLR _ =>
(buf.skip1(); i0dnt_some(tok))
//
| T_AT0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
  val loc = tok.lctn((*void*))
  val tnd = T0IDENT_AT0(*void*)
  val tok = token_make_node(loc, tnd)
}
//
| T_EQ0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
  val loc = tok.lctn((*void*))
  val tnd = T0IDENT_EQ0(*void*)
  val tok = token_make_node(loc, tnd)
}
//
| T_LT0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
  val loc = tok.lctn((*void*))
  val tnd = T0IDENT_LT0(*void*)
  val tok = token_make_node(loc, tnd)
}
| T_GT0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
  val loc = tok.lctn((*void*))
  val tnd = T0IDENT_GT0(*void*)
  val tok = token_make_node(loc, tnd)
}
//
| T_LTGT() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
  val loc = tok.lctn((*void*))
  val tnd = T0IDENT_LTGT(*void*)
  val tok = token_make_node(loc, tnd)
}
//
|
T_BSLSH() => (buf.skip1(); i0dnt_some(tok))
//
|
_(* non-IDENT *) => (err := e00 + 1; i0dnt_none(tok))
//
end (*let*) // end of [p1_s0eid(buf, err)]

(* ****** ****** *)

#implfun
p1_i0dnt(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+
tok.tnode() of
//
| _
when
t0_s0eid(tnd) => p1_s0eid(buf, err)
//
| _
when
t0_d0eid(tnd) => p1_d0eid(buf, err)
//
|
_(*non-i0dnt*) => (err := e00+1; i0dnt_none(tok))
//
end (*let*) // end of [p1_i0dnt(buf,err)]

(* ****** ****** *)

#implfun
p1_l0abl(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val ( ) =
prerrln("p1_l0abl: tok = ", tok)
*)
//
in
//
case+ tnd of
|
T_INT01 _ =>
(
buf.skip1(); l0abl_make_int1(tok)
)
|
T_IDALP _ =>
(
buf.skip1(); l0abl_make_name(tok)
)
|
_(*non-INT-IDENT*) =>
(
  err := e00 + 1; l0abl_make_none(tok)
) (* end of [non-INT-IDALP] *)
//
end (*let*) // end of [p1_l0abl(buf,err)]

(* ****** ****** *)
//
(*
idsort0::
  | s0tid
//
atmsort0::
//
  | s0tid
  | qualid atmsort0
  | ( sort0seq_COMMA )
//
atmsort0seq::
  | {atmsort0}+
//
sort0seq_COMMA::
  | sort0, ... , sort0
//
*)
//
(* ****** ****** *)

local
//
#extern
fun p1_sort0_tid: p1_fun(sort0)
#extern
fun p1_sort0_atm: p1_fun(sort0)
#extern
fun p1_sort0seq_atm: p1_fun(sort0lst)
#extern
fun p1_sort0seq_CMA: p1_fun(sort0lst)
//
in//local

(* ****** ****** *)

#implfun
p1_sort0_tid
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val () =
println!
("p1_sort0_tid: e00 = ", e00)
val () =
println!
("p1_sort0_tid: tok = ", tok)
*)
//
in//let
//
case+ tnd of
//
| _
when
t0_s0tid(tnd) =>
let
  val id0 = p1_s0tid(buf, err)
in
  err := e00;
  sort0(id0.lctn(), S0Tid0(id0))
end // end of [t_s0tid]
| _
(*otherwise*) =>
let
  val () = (err := e00 + 1)
in
  sort0(tok.lctn(), S0Tnone(tok))
end (* this-is-a-case-of-error *)
//
end (*let*) // end of [p1_sort0_tid]

(* ****** ****** *)

#implfun
p1_sort0_atm
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val () =
println!
("p1_sort0_atm: e00 = ", e00)
val () =
println!
("p1_sort0_atm: tok = ", tok)
*)
//
in
//
case+ tnd of
//
| _
when t0_s0tid(tnd) =>
let
  val id0 = p1_s0tid(buf, err)
in
  err := e00
; sort0(id0.lctn(), S0Tid0(id0))
end (*let*) // end of [t_s0tid]
//
| _
when t0_t0int(tnd) =>
let
  val i00 = p1_t0int(buf, err)
in
  err := e00
; sort0(i00.lctn(), S0Tint(i00))
end (*let*) // end of [t_t0int]
|
T_LPAREN() =>
let
val () = buf.skip1()
val s0ts =
p1_sort0seq_CMA(buf, err)
val tbeg = tok
val tend = p1_RPAREN(buf, err)
val loc0 = tbeg.lctn()+tend.lctn()
in
  err := e00
; sort0
  (loc0,S0Tlist(tbeg, s0ts, tend))
end (*let*) // end of [T_LPAREN]
//
|
T_IDQUA(qid) =>
let
val () = buf.skip1()
val s0t0 =
p1_sort0_atm(buf, err)
val loc0 = tok.lctn()+s0t0.lctn()
in
  err := e00
; sort0( loc0, S0Tqid(tok, s0t0) )
end (*let*) // end of [ T_IDQUA ]
//
| _ (* error *) =>
let
  val () = (err := e00 + 1)
in
  sort0( tok.lctn(), S0Tnone(tok) )
end (*let*) // this-is-a-case-of-error
//
end (*let*) // end of [ p1_sort0_atm ]
//
(* ****** ****** *)

endloc (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_basics.dats] *)
