(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For functional streams
//
(* ****** ****** *)

fun
<a:t0>
stream_nil(): stream(a)
fun
<a:t0>
stream_cons
(x0: a, xs: stream(a)): stream(a)

(* ****** ****** *)

fun
<a:t0>
stream_sing(x0: a): stream(a)
fun
<a:t0>
stream_pair(x0: a, y0: a): stream(a)

(* ****** ****** *)

fun
<a:t0>
stream_length(stream(a)): nint

(* ****** ****** *)
//
fun
<a:t0>
stream_extend
(xs: stream(a), x0: a): stream(a)
fun
<a:t0>
stream_append
(xs: stream(a), ys: stream(a)): stream(a)
fun
<a:t0>
stream_concat(stream(stream(a))): stream(a)
//
(* ****** ****** *)
//
(*
stream_map: map$fopr
stream_map_vt: map$fopr
*)
//
fun
<x0:t0>
<y0:t0>
stream_map(stream(x0)): stream(y0)
fun
<x0:t0>
<y0:vt>
stream_map_vt(stream(x0)): stream_vt(y0)
//
(* ****** ****** *)
//
(*
stream_filter: filter$test
stream_filter_vt: filter$test
*)
//
fun
<x0:t0>
stream_filter(stream(x0)): stream(x0)
fun
<x0:t0>
stream_filter_vt(stream(x0)): stream_vt(x0)
//
(* ****** ****** *)
//
(*
stream_mapopt: mapopt$fopr
stream_mapopt_vt: mapopt$fopr
*)
fun
<x0:t0>
<y0:t0>
stream_mapopt(stream(x0)): stream(y0)
fun
<x0:t0>
<y0:vt>
stream_mapopt_vt(stream(x0)): stream_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
stream_sieve(stream(x0)): stream(x0)
fun
<x0:t0>
stream_sieve_vt(stream(x0)): stream_vt(x0)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for stream
//
(* ****** ****** *)
//
#symload nil with strmcon_nil
#symload cons with strmcon_cons
//
(* ****** ****** *)

#symload length with stream_length of 1000

(* ****** ****** *)

#symload extend with stream_extend of 1000
#symload append with stream_append of 1000
#symload concat with stream_concat of 1000

(* ****** ****** *)
//
#symload forall with stream_forall of 1000
#symload foreach with stream_foreach of 1000
//
(* ****** ****** *)
//
#symload filter with stream_filter of 1000
#symload filter_vt with stream_filter_vt of 1000
//
(* ****** ****** *)
//
#symload map with stream_map of 1000
#symload map_vt with stream_map_vt of 1000
#symload mapopt with stream_mapopt of 1000
#symload mapopt_vt with stream_mapopt_vt of 1000
//
(* ****** ****** *)
//
#symload sieve with stream_sieve of 1000
#symload sieve_vt with stream_sieve_vt of 1000
//
(* ****** ****** *)

(* end of [stream.sats] *)
