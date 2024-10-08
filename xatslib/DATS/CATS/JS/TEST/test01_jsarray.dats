(* ****** ****** *)
(*
HX-2024-08-09:
For testing xatslib/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib/HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)
//
val A1 =
jsarray(1)
val A2 =
jsarray("1", "2")
val A3 =
jsarray("1", "2", "3")
//
val () =
prints("A1(", type(A1), ") = ", A1, "\n")
val () =
prints("A2(", type(A2), ") = ", A2, "\n")
val () =
prints("A3(", type(A3), ") = ", A3, "\n")
//
(* ****** ****** *)
//
val An =
jsarray_make_ncpy
( 10, -1(*init*) )
//
val () =
prints("An(", type(An), ") = ", An, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val iter =
jsarray_iter_make(An)
val-true =
jsarray_iter_next$work
(iter
,lam(i, x) => print1s("(i,x) = (", i, ",", x, ")\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_DATS_CATS_JS_TEST_test01_jsarray.dats] *)
