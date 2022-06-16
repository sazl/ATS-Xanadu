(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/locinfo.sats"
#staload
"./../../SATS/lexbuf0.sats"
#staload
"./../../SATS/lexing0.sats"
#staload
"./../../SATS/parsing.sats"
(* ****** ****** *)
#include
"./../../DATS/xstamp0.dats"
#include
"./../../DATS/xstamp0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/xsymbol.dats"
#include
"./../../DATS/xsymbol_print0.dats"
#include
"./../../DATS/xsymbol_mymap0.dats"
#include
"./../../DATS/xsymbol_inits0.dats"
(* ****** ****** *)
#include
"./../../DATS/xlabel0.dats"
#include
"./../../DATS/xlabel0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/locinfo.dats"
#include
"./../../DATS/locinfo_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/lexbuf0.dats"
#include
"./../../DATS/lexbuf0_cstrx1.dats"
#include
"./../../DATS/lexbuf0_cstrx2.dats"
(* ****** ****** *)
#include
"./../../DATS/lexing0.dats"
#include
"./../../DATS/lexing0_token0.dats"
#include
"./../../DATS/lexing0_print0.dats"
#include
"./../../DATS/lexing0_mymap0.dats"
#include
"./../../DATS/lexing0_utils1.dats"
#include
"./../../DATS/lexing0_utils2.dats"
(* ****** ****** *)
#include
"./../../DATS/staexp0.dats"
#include
"./../../DATS/staexp0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/parsing.dats"
#include
"./../../DATS/parsing_tokbuf.dats"
#include
"./../../DATS/parsing_basics.dats"
#include
"./../../DATS/parsing_staexp.dats"
#include
"./../../DATS/parsing_utils0.dats"
(* ****** ****** *)

val opt =
p1_fun_test<t0int>("123", p1_t0int)
val ( ) =
prerrln("p1_t0int(\"123\") = ", opt)
val opt =
p1_fun_test<t0int>("int?+", p1_t0int)
val ( ) =
prerrln("p1_t0int(\"int?+\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<t0chr>("'0'", p1_t0chr)
val ( ) =
prerrln("p1_t0chr(\"'0'\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<t0flt>("3.14", p1_t0flt)
val ( ) =
prerrln("p1_t0flt(\"3.14\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<t0str>("\"Hello!\"", p1_t0str)
val ( ) =
prerrln("p1_t0str(\"\"Hello!\"\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<l0abl>("l0abl", p1_l0abl)
val ( ) =
prerrln("p1_l0abl(\"l0abl\") = ", opt)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test09_parsing.dats] *)
