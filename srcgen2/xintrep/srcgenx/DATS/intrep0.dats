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
//
Fri Nov 24 13:31:57 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

local
//
datatype
irpat =
IRPAT of
( loctn
, s2typ, irpat_node)
datavwtp
irpat_vt =
IRPAT_vt of
( loctn
, s2typ, irpat_node)
//
#absimpl irpat_tbox = irpat
//
in (* in-of-local *)
//
#implfun
irpat_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
IRPAT(loc, t2p, nod) end
//
#implfun
irpat_get_lctn(irp) =
let
val+
IRPAT(loc,t2p,nod) = irp in loc
end
#implfun
irpat_get_node(irp) =
let
val+
IRPAT(loc,t2p,nod) = irp in nod
end
//
endloc (*local*) // end of [local(irpat)]

(* ****** ****** *)

local
//
datatype
irexp =
IREXP of
( loctn
, s2typ, irexp_node)
datavwtp
irexp_vt =
IREXP_vt of
( loctn
, s2typ, irexp_node)
//
#absimpl irexp_tbox = irexp
//
in (* in-of-local *)
//
#implfun
irexp_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
IREXP(loc, t2p, nod) end
//
#implfun
irexp_get_lctn(ire) =
let
val+
IREXP(loc,t2p,nod) = ire in loc
end
#implfun
irexp_get_node(ire) =
let
val+
IREXP(loc,t2p,nod) = ire in nod
end
//
endloc (*local*) // end of [local(irexp)]

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_intrep0.dats] *)
