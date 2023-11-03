(* ****** ****** *)
(*
HX-2023-11-01:
A long journey of
bootstrapping ATS3/Xanadu!!!
*)
(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../SATS/locinfo.sats"
(* ****** ****** *)
#staload
"./../../SATS/trans12.sats"
#staload
"./../../SATS/tread12.sats"
(* ****** ****** *)
#staload
"./../../SATS/xglobal.sats"
(* ****** ****** *)
//
val ret =
the_fxtyenv_pvsload()
val (  ) =
prerrln("the_fxtyenv_pvsload() = ", ret)
//
val ret =
the_tr12env_pvsload()
val (  ) =
prerrln("the_tr12env_pvsload() = ", ret)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xbasics_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/xbasics.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), xbasics_sats)
//
val
xbasics_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/xbasics.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), xbasics_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
staexp0_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/staexp0.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), staexp0_sats)
//
val
staexp0_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/staexp0.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), staexp0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp0_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/dynexp0.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp0_sats)
//
val
dynexp0_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/dynexp0.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
staexp1_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/staexp1.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), staexp1_sats)
//
val
staexp1_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/staexp1.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), staexp1_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp1_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/dynexp1.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp1_sats)
//
val
dynexp1_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/dynexp1.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp1_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
staexp2_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/staexp2.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), staexp2_sats)
//
val
staexp2_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/staexp2.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), staexp2_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
statyp2_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/statyp2.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), statyp2_sats)
//
val
statyp2_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/statyp2.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), statyp2_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp2_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/dynexp2.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp2_sats)
//
val
dynexp2_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/dynexp2.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp2_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp3_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/dynexp3.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp3_sats)
//
val
dynexp3_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/dynexp3.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), dynexp3_dats)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_xatsopt_boot04.dats] *)
