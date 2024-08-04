(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-10:
These are newly designed function interfaces ATS3,
which are not supposed to be implemented in srcgen1
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
max$nil((*nil*)): (x0)
fun
<x0:t0>
min$nil((*nil*)): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
get_at$exn
(xs: xs, i0: ni): x0
fun
<xs:t0>
<x0:vt>
set_at$exn
( xs: xs
, i0: ni, x0: x0): void
fun
<xs:t0>
<x0:t0>
fset_at$exn
( xs: xs
, i0: ni, x0: x0): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt>
forall$test(ni, x0): bool
fun
<x0:vt>
rforall$test(ni, x0): bool
fun
<x0:vt>
iforall$test(ni, x0): bool
*)
fun
<x0:vt>
irforall$test(ni, x0): bool
//
(* ****** ****** *)
(*
fun
<x0:vt>
exists$test(ni, x0): bool
fun
<x0:vt>
rexists$test(ni, x0): bool
fun
<x0:vt>
iexists$test(ni, x0): bool
*)
fun
<x0:vt>
irexists$test(ni, x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
foritm$work(x0: x0): void
fun
<x0:t0>
rforitm$work(x0: x0): void
fun
<x0:t0>
iforitm$work(ni, x0): void
fun
<x0:t0>
irforitm$work(ni, x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
folditm$fopr(r0, x0): (r0)
fun
<x0:t0>
<r0:vt>
rfolditm$fopr(x0, r0): (r0)
fun
<x0:t0>
<r0:vt>
ifolditm$fopr(r0, ni, x0): (r0)
fun
<x0:t0>
<r0:vt>
irfolditm$fopr(ni, x0, r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldall$fopr(r0, x0): (bool, r0)
fun
<x0:t0>
<r0:vt>
rfoldall$fopr(x0, r0): (bool, r0)
fun
<x0:t0>
<r0:vt>
ifoldall$fopr(r0, n0, x0): (bool, r0)
fun
<x0:t0>
<r0:vt>
irfoldall$fopr(n0, x0, r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
<y0:vt>
map$fopr(itm: x0): (y0)
fun
<x0:t0>
<y0:vt>
rmap$fopr(itm: x0): (y0)
fun
<x0:t0>
<y0:vt>
imap$fopr(pos: ni, itm: x0): (y0)
*)
fun
<x0:t0>
<y0:vt>
irmap$fopr(pos: ni, itm: x0): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt>
filter$test(x0: x0): bool
*)
fun
<x0:vt>
rfilter$test(x0: x0): bool
(*
fun
<x0:vt>
ifilter$test(ni, x0): bool
*)
fun
<x0:vt>
irfilter$test(ni, x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_max(xs: xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_min(xs: xs): (x0)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_sum(xs: xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_prod(xs: xs): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq$beg((*0*)): strn
fun
<xs:vt>
<x0:vt>
gseq$end((*0*)): strn
fun
<xs:vt>
<x0:vt>
gseq$sep((*0*)): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
g_foritm(xs: xs): void
//
fun
<xs:t0>
<x0:t0>
gseq_foritm(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_rforitm(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_iforitm(xs: xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldall(xs, r0): ( r0 )
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfoldall(xs, r0): ( r0 )
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldall(xs, r0): ( r0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_map_self(xs: xs): (xs)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_filter_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_filter_self(xs: xs): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
<y0:vt>
mapstrq$fopr(itm: x0): strq_vt(y0)
*)
fun
<x0:t0>
<y0:vt>
rmapstrq$fopr(itm: x0): strq_vt(y0)
fun
<x0:t0>
<y0:vt>
imapstrq$fopr(pos: ni, itm: x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_forall(xs: nint): bool
fun<>
nint_foritm(xs: nint): bool
//
fun<>
nint_rforall(xs: nint): bool
fun<>
nint_rforitm(xs: nint): bool
//
fun<>
nint_iforall(xs: nint): bool
fun<>
nint_iforitm(xs: nint): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_strmize
(xs: nint): strm_vt(ni)
fun<>
nint_strqize
{n:i0}
(xs: nint(n)): strq_vt(ni, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<y0:vt>
nint_map_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
//
#symload
map_llist with nint_map_llist of 1000
//
fun
<y0:vt>
nint_rmap_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
//
#symload
rmap_llist with nint_rmap_llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 11:48:37 AM EDT
*)
//
fun
<y0:vt>
nint_map_lstrm(xs: nint): strm_vt(y0)
//
#symload
map_lstrm with nint_map_lstrm of 1000
//
fun
<y0:vt>
nint_map_lstrm_c1fr
( xs: nint
, fopr: (nint)-<cfr>(y0)): strm_vt(y0)
fun
<y0:vt>
nint_map_lstrm_f1np
( xs: nint
, fopr: (nint)-<fnp>(y0)): strm_vt(y0)
//
#symload
map_lstrm with nint_map_lstrm_c1fr of 1000
#symload
map_lstrm_cfr with nint_map_lstrm_c1fr of 1000
#symload
map_lstrm_fnp with nint_map_lstrm_f1np of 1000
//
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 09:20:16 PM EDT
*)
//
fun
<y0:vt>
nint_rmap_lstrm(xs: nint): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap_lstrm of 1000
//
fun
<y0:vt>
nint_rmap_lstrm_c1fr
( xs: nint
, fopr: (nint)-<cfr>(y0)): strm_vt(y0)
fun
<y0:vt>
nint_rmap_lstrm_f1np
( xs: nint
, fopr: (nint)-<fnp>(y0)): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap_lstrm_c1fr of 1000
#symload
rmap_lstrm_cfr with nint_rmap_lstrm_c1fr of 1000
#symload
rmap_lstrm_fnp with nint_rmap_lstrm_f1np of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strn_gmake( a ): strn
//
fun<>
strn_foritm(cs: strn): void
//
(* ****** ****** *)
//
fun
<a:t0>
strn_vt_gmake(obj: a): strn_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_irforall(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_irexists(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_irforitm(xs): void
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm(xs, r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfoldall(xs, r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_irmap_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_irmap_self(xs: xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_irmap_list(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_llist(xs: xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_lstrm(xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_lstrq(xs: xs): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_irmap_rlist(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_rllist(xs: xs): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
list_forall(xs: list(x0)): bool
*)
fun
<x0:t0>
list_foritm(xs: list(x0)): void
//
fun
<x0:t0>
list_rforall(xs: list(x0)): bool
fun
<x0:t0>
list_rforitm(xs: list(x0)): void
//
(*
fun
<x0:t0>
list_iforall(xs: list(x0)): bool
*)
fun
<x0:t0>
list_iforitm(xs: list(x0)): void
//
fun
<x0:t0>
list_irforall(xs: list(x0)): bool
fun
<x0:t0>
list_irforitm(xs: list(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Wed 17 Jul 2024 02:13:39 PM EDT
*)
//
(*
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_append(xs: xs, ys: ~ys): xs
*)
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_prepend(xs: xs, ys: ~ys): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_irforall_c2fr
(xs: xs, test: (ni, x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
gseq_irforall_f2np
(xs: xs, test: (ni, x0)-<fnp>bool): bool
//
#symload irforall with gseq_irforall_c2fr of 0100
#symload irforall_cfr with gseq_irforall_c2fr of 0100
#symload irforall_fnp with gseq_irforall_f2np of 0100
//
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 12:19:14 PM EDT
*)
//
fun
<xs:t0>
<x0:t0>
gseq_foritm_c1fr
(xs: xs, work: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
gseq_foritm_f1np
(xs: xs, work: (x0)-<fnp>void): void
//
#symload foritm with gseq_foritm_c1fr of 0100
#symload foritm_cfr with gseq_foritm_c1fr of 0100
#symload foritm_fnp with gseq_foritm_f1np of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_rforitm_c1fr
(xs: xs, work: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
gseq_rforitm_f1np
(xs: xs, work: (x0)-<fnp>void): void
//
#symload rforitm with gseq_rforitm_c1fr of 0100
#symload rforitm_cfr with gseq_rforitm_c1fr of 0100
#symload rforitm_fnp with gseq_rforitm_f1np of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_iforitm_c1fr
(xs: xs, work: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
gseq_iforitm_f1np
(xs: xs, work: (x0)-<fnp>void): void
//
#symload iforitm with gseq_iforitm_c1fr of 0100
#symload iforitm_cfr with gseq_iforitm_c1fr of 0100
#symload iforitm_fnp with gseq_iforitm_f1np of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_irforitm_c1fr
(xs: xs, work: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
gseq_irforitm_f1np
(xs: xs, work: (x0)-<fnp>void): void
//
#symload irforitm with gseq_irforitm_c1fr of 0100
#symload irforitm_cfr with gseq_irforitm_c1fr of 0100
#symload irforitm_fnp with gseq_irforitm_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm_c2fr
( xs: xs
, r0: r0, fopr: (r0, x0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm_f2np
( xs: xs
, r0: r0, fopr: (r0, x0)-<fnp>(r0)): (r0)
//
#symload folditm with gseq_folditm_c2fr of 0100
#symload folditm_cfr with gseq_folditm_c2fr of 0100
#symload folditm_fnp with gseq_folditm_f2np of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfolditm_c2fr
( xs: xs
, r0: r0, fopr: (x0, r0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfolditm_f2np
( xs: xs
, r0: r0, fopr: (x0, r0)-<fnp>(r0)): (r0)
//
#symload rfolditm with gseq_rfolditm_c2fr of 0100
#symload rfolditm_cfr with gseq_rfolditm_c2fr of 0100
#symload rfolditm_fnp with gseq_rfolditm_f2np of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm_c3fr
( xs: xs
, r0: r0, fopr: (r0, ni, x0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm_f3np
( xs: xs
, r0: r0, fopr: (r0, ni, x0)-<fnp>(r0)): (r0)
//
#symload ifolditm with gseq_ifolditm_c3fr of 0100
#symload ifolditm_cfr with gseq_ifolditm_c3fr of 0100
#symload ifolditm_fnp with gseq_ifolditm_f3np of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm_c3fr
( xs: xs
, r0: r0, fopr: (ni, x0, r0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm_f3np
( xs: xs
, r0: r0, fopr: (ni, x0, r0)-<fnp>(r0)): (r0)
//
#symload irfolditm with gseq_irfolditm_c3fr of 0100
#symload irfolditm_cfr with gseq_irfolditm_c3fr of 0100
#symload irfolditm_fnp with gseq_irfolditm_f3np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares_c1fr
(xs: xs, fopr: (x0)-<cfr>(y0)): (ys)
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares_f1np
(xs: xs, fopr: (x0)-<cfr>(y0)): (ys)
//
fun
<xs:t0>
<x0:t0>
gseq_map_self_c1fr
(xs: xs, fopr: (x0)-<cfr>(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_map_self_f1np
(xs: xs, fopr: (x0)-<cfr>(x0)): (xs)
//
#symload map with gseq_map_ares_c1fr of 0100
#symload map_cfr with gseq_map_ares_c1fr of 0100
#symload map_fnp with gseq_map_ares_c1fr of 0100
//
#symload map with gseq_map_self_c1fr of 0110
#symload map_cfr with gseq_map_self_c1fr of 0110
#symload map_fnp with gseq_map_self_c1fr of 0110
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 03:16:49 AM EDT
*)
//
(* ****** ****** *)
//
fun
<x0:t0>
c2hoose$forall$test(x0, x0): bool
fun
<x0:t0>
c3hoose$forall$test(x0, x0, x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
list_c2hoose_lstrm
(xs: list(x0)): strm_vt@(x0, x0)
//
#symload c2hoose_lstrm with list_c2hoose_lstrm
//
fun
<x0:t0>
list_c2hoose$forall(list(x0)): bool
fun
<x0:t0>
list_c2hoose$forall_c2fr
(xs:list(x0), test:(x0,x0)-<cfr>bool): bool
//
#symload c2hoose$forall with list_c2hoose$forall
#symload c2hoose$forall with list_c2hoose$forall_c2fr
//
(* ****** ****** *)
//
fun
<x0:t0>
list_c3hoose_lstrm
(xs: list(x0)): strm_vt@(x0, x0, x0)
//
#symload c3hoose_lstrm with list_c3hoose_lstrm
//
fun
<x0:t0>
list_c3hoose$forall(list(x0)): bool
fun
<x0:t0>
list_c3hoose$forall_c3fr
(xs:list(x0), test:(x0,x0,x0)-<cfr>bool): bool
//
#symload c3hoose$forall with list_c3hoose$forall
#symload c3hoose$forall with list_c3hoose$forall_c3fr
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 12:53:34 PM EDT
*)
//
fun
<x0:vt> // HX: vt!
fmake$fwork((*void*)): void
fun
<x0:t0>
fmake$fwork$work(x0: x0): void
//
fun
<x0:t0>
list_fmake((*void*)): list(x0)
fun
<x0:t0>
list_fmake_fwork
(fwork: (x0 -<cfr> void) -<cfr> void): list(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GSEQ_make_list
{a:t0}
(xs: list(a)): GSEQ(list(a), a)
#symload GSEQ with GSEQ_make_list of 1000
#symload GSEQ_list with GSEQ_make_list of 1000
//
fcast // fun
GSEQ_make_nint0
(xs: nint): GSEQ(nint, unit)
fcast // fun
GSEQ_make_nint1
(xs: nint): GSEQ(nint, nint)
#symload GSEQ with GSEQ_make_nint1 of 1000
#symload GSEQ_nint0 with GSEQ_make_nint0 of 1000
#symload GSEQ_nint1 with GSEQ_make_nint1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-7-31:
Wed 31 Jul 2024 07:58:53 PM EDT
*)
//
fun
<xs:t0>
g_append(y1: xs, y2: xs): (xs) // for [appends]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
z2forall$work(x0, y0): void
fun
<x0:t0>
<y0:t0>
rz2forall$work(x0, y0): void
fun
<x0:t0>
<y0:t0>
iz2forall$work(ni, x0, y0): void
fun
<x0:t0>
<y0:t0>
irz2forall$work(ni, x0, y0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
z2foritm$work(x0, y0): void
fun
<x0:t0>
<y0:t0>
rz2foritm$work(x0, y0): void
fun
<x0:t0>
<y0:t0>
iz2foritm$work(ni, x0, y0): void
fun
<x0:t0>
<y0:t0>
irz2foritm$work(ni, x0, y0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forall(xs: xs, ys: ys): bool
*)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_rz2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_irz2forall(xs: xs, ys: ys): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2foritm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_rz2foritm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2foritm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_irz2foritm(xs: xs, ys: ys): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_xunimpl.sats] *)
