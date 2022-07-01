(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)
//
(*
#staload
"./../SATS/gseq.sats"
*)
//
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
(*
//HX: For 1-gseq-operations
*)
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_nilq(xs) =
(
gseq_forall<xs><x0>(xs)
) where
{
#impltmp
forall$test<x0>(_) = false
}
//
#impltmp
<xs><x0>
gseq_consq(xs) =
bool_neg<>
( gseq_nilq<xs><x0>(xs) )
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_head_exn(xs) =
if
gseq_consq<xs><x0>(xs)
then
gseq_head_raw<xs><x0>(xs)
else $raise SubscriptExn()
#impltmp
<xs><x0>
gseq_tail_exn(xs) =
if
gseq_consq<xs><x0>(xs)
then
gseq_tail_raw<xs><x0>(xs)
else $raise SubscriptExn()
//
#impltmp
<xs><x0>
gseq_head_opt(xs) =
if
gseq_consq<xs><x0>(xs)
then
optn_vt_cons
(
gseq_head_raw<xs><x0>(xs)
) else optn_vt_nil((*void*))
#impltmp
<xs><x0>
gseq_tail_opt(xs) =
if
gseq_consq<xs><x0>(xs)
then
optn_vt_cons
(
gseq_tail_raw<xs><x0>(xs)
) else optn_vt_nil((*void*))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_last_raw(xs) =
let
var xs = xs
val x0 =
gseq_uncons_raw<xs><x0>(xs)
in
gseq_last_ini<xs><x0>(xs, x0)
end(*let*)//end(gseq_last_raw)
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_last_opt(xs) =
let
//
var xs = xs
//
val opt =
gseq_uncons_opt<xs><x0>(xs)
in
case+ opt of
| ~
optn_vt_nil() =>
optn_vt_nil()
| ~
optn_vt_cons(x0) =>
optn_vt_cons
(gseq_last_ini<xs><x0>(xs, x0))
end(*let*)//end-of(gseq_last_opt)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_last_ini
(xs, x0) = let
//
#typedef r0 = x0
//
#impltmp
foldl$fopr
<x0><r0>(r0, x0) = x0
//
in//let
gseq_foldl<xs><x0><r0>(xs, x0)
end(*let*)//(gseq_last_ini/foldl)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_uncons_raw(xs) =
(
let
  val () = xs := tl in hd
end
) where
{
val hd =
  gseq_head_raw<xs><x0>(xs)
val tl =
  gseq_tail_raw<xs><x0>(xs)
}
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_uncons_exn
  (xs) =
let
val opt =
gseq_uncons_opt<xs><x0>(xs)
in
//
case+ opt of
| optn_vt_nil() =>
  $raise SubscriptExn()
| optn_vt_cons(x0) => x0
//
end // end of [gseq_uncons_exn]
*)
//
#impltmp
<xs><x0>
gseq_uncons_exn
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then $raise SubscriptExn()
else gseq_uncons_raw<xs><x0>(xs)
)
#impltmp
<xs><x0>
gseq_uncons_opt
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
  optn_vt_nil((*void*))
else
  optn_vt_cons
  (gseq_uncons_raw<xs><x0>(xs))
// end of [if]
)
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_cmp
(xs1, xs2) =
(
gseq_z2forcmp
<xs,xs><x0,x0>(xs1, xs2)
) where
{
  #impltmp
  z2forcmp$fcmp<x0,x0> = g_cmp<x0>
} (* end of [gseq_cmp/z2forcmp] *)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_print(xs) =
let
//
val () =
gseq_print$beg<xs><x0>()
//
val () =
(
  gseq_iforeach<xs><x0>(xs)
) where
{
//
#impltmp
iforeach$work<x0>
  (i0, x0) =
(
  g_print<x0>(x0)
) where
{
  val () =
  if
  (i0 > 0)
  then gseq_print$sep<xs><x0>()
} (* where *)
//
} (* where *)
//
val () =
gseq_print$end<xs><x0>((*void*))
//
endlet (* end of [gseq_print] *)

(* ****** ****** *)
#impltmp
<xs><x0>
gseq_print$beg() = strn_print("(")
#impltmp
<xs><x0>
gseq_print$end() = strn_print(")")
#impltmp
<xs><x0>
gseq_print$sep() = strn_print(";")
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_length(xs) =
(
gseq_foldl
<xs><x0><r0>(xs, 0)
) where
{
//
#typedef r0 = nint
//
#impltmp
foldl$fopr<x0><r0>(r0, _) = succ(r0)
//
} (* gseq_length/foldl *)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_drop
  (xs, n0) =
(
gseq_idropif
< xs >< x0 >(xs)) where
{
#impltmp
idropif$test<x0>(i0, x0) = (i0 < n0)
} (* gseq_drop/idropif *)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_dropif
  (xs) =
(
gseq_idropif
< xs >< x0 >(xs)) where
{
#impltmp
idropif$test<x0>(i0, x0) = dropif$test<x0>(x0)
} (* gseq_drop/dropif *)

(* ****** ****** *)

#impltmp
<xs>
<x0><r0>
gseq_foldl
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_foreach<xs><x0>(xs)
) where
{
#impltmp
foreach$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldl$fopr<x0><r0>(r0, x0))
//
end // end of [foreach$work]
}
//
} (* end of [gseq_foldl/foreach] *)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_exists
  (xs) = let
//
  #impltmp
  forall$test<x0>(x0) =
  not(exists$test<x0>(x0))
//
in
  if
  gseq_forall
  <xs><x0>(xs) then false else true
end // end of [gseq_exists/forall]
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_forall
  (xs) =
( loop(xs) ) where
{
fun
loop(xs: xs): bool =
if
gseq_nilq
<xs><x0>(xs)
then true else
let
var xs = xs
val x0 =
gseq_uncons_raw<xs><x0>(xs)
in
if
forall$test<x0>(x0)
  then loop(xs) else false
// end of [if]
end // end of [else]
} (* end of [gseq_forall/uncons] *)
*)
//
#impltmp
<xs><x0>
gseq_forall
  (xs) =
strm_vt_forall0<x0>
(gseq_strmize<xs><x0>(xs)) where
{
  #impltmp
  forall0$test<x0> = forall$test<x0>
} (* end of [gseq_forall/strmize] *)
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_foreach(xs) =
let
val
test =
gseq_forall<xs><x0>(xs) where
{
#impltmp
forall$test<x0>(x0) =
let
val () = foreach$work<x0>(x0) in true
end
}
in
  // nothing
end // end of [gseq_foreach/forall]

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_memberq
  (xs, x0) =
(
gseq_exists<xs><x0>(xs)) where
{
//
#impltmp
exists$test<x0>(x1) = g_equal<x0>(x0, x1)
//
} (*where*)//end-of-[gseq_memberq(xs,x0)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_search
  (xs) =
(
case- opt of
| ~
optn_vt_cons(x0) => x0) where
{
val
opt = gseq_search_opt<xs><x0>(xs)
} (*where*)//end of [gseq_search]
//
#impltmp
<xs><x0>
gseq_rsearch
  (xs) =
(
case- opt of
| ~
optn_vt_cons(x0) => x0) where
{
val
opt = gseq_rsearch_opt<xs><x0>(xs)
} (*where*)//end of [gseq_rsearch]
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_search_opt
  ( xs ) =
let
//
val p0 = $addr(r0)
//
val
btf =
gseq_forall<xs><x0>(xs)
where
{
#impltmp
forall$test<x0>(x0) =
if
search$test<x0>(x0)
then
let
val () =
$UN.p2tr_set<res>
( p0
, optn_vt_cons(x0)) in false
end else (true) // end-of-if
} (*where*) // end of [ val ]
//
in
let
  val
  res =
  $UN.p2tr_get<res>(p0) in res
end
end where
{
//
#vwtpdef res = optn_vt(x0)
//
 var r0: res = optn_vt_nil((*void*))
//
} (*where*) // end of [gseq_search_opt]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_rsearch_opt
  ( xs ) =
let
//
val p0 = $addr(r0)
//
val
btf =
gseq_rforall<xs><x0>(xs)
where
{
#impltmp
rforall$test<x0>(x0) =
if
rsearch$test<x0>(x0)
then
let
val () =
$UN.p2tr_set<res>
( p0
, optn_vt_cons(x0)) in false
end else (true) // end-of-if
} (*where*) // end of [ val ]
//
in
let
  val
  res =
  $UN.p2tr_get<res>(p0) in res
end
end where
{
//
#vwtpdef res = optn_vt(x0)
//
 var r0: res = optn_vt_nil((*void*))
//
} (*where*) // end of [gseq_rsearch_opt]
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_get_at
  (xs, i0) =
(
case- opt of
| ~
optn_vt_cons(x0) => x0) where
{
val opt =
gseq_get_at_opt<xs><x0>(xs, i0)
} (*where*) // end of [gseq_get_at]

(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_fset_at
  (xs, i0, x0) =
(
case- opt of
| ~optn_vt_cons(xs) => xs
) where
{
val opt =
gseq_fset_at_opt<xs><x0>(xs, i0, x0)
} (*where*) // end of [gseq_fset_at]
*)
//
#impltmp
<xs><x0>
gseq_fset_at
  (xs, i0, x0) =
let
  val xs =
  gseq_strmize<xs><x0>(xs)
in
  gseq_unstrm_vt
  (strm_vt_fset_at<x0>(xs, i0, x0))
end (*let*) // end of [gseq_fset_at]
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_get_at_opt
  (xs, i0) =
let
//
val p0 = $addr(r0)
//
val
btf =
gseq_iforall<xs><x0>(xs)
where
{
#impltmp
iforall$test<x0>(i1, x0) =
if
(i1 < i0)
then true else
let
val () =
$UN.p2tr_set<res>
( p0
, optn_vt_cons(x0)) in false
end
} (*where*) // end of [val]
//
in
let
  val
  res =
  $UN.p2tr_get<res>(p0) in res
end
end where
{
//
#vwtpdef res = optn_vt(x0)
//
 var r0: res = optn_vt_nil((*void*))
//
} (*where*) // end of [gseq_get_at_opt]
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_listize
  (xs) =
(
gseq_map_list<xs><x0><x0>(xs)
) where
{
  #impltmp map$fopr<x0><x0>(x0) = x0
}
(* ****** ****** *)
//
(*
HX-2020-11-23:
This is not very useful!
HX-2022-06-15:
This seems to be working!
*)
//
#impltmp
<xs><x0>
gseq_strmize
  (xs) =
( auxseq(xs) ) where
{
fun
auxseq
(xs: xs): strm_vt(x0) =
  $llazy
(
if
gseq_nilq
<xs><x0>(xs)
then strmcon_vt_nil()
else let
val x0 =
gseq_head_raw<xs><x0>(xs)
val xs =
gseq_tail_raw<xs><x0>(xs)
in
strmcon_vt_cons(x0, auxseq(xs))
end // end of [else]
) (* end of [auxseq] *)
}(*where*)//end-of(gseq_strmize)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rlistize(xs) =
(
gseq_map_rlist<xs><x0><x0>(xs)
) where
{
  #impltmp map$fopr<x0><x0>(x0) = x0
}
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rstrmize(xs) =
list_vt_strmize<x0>(gseq_rlistize<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_unlist(xx) =
let
//
val xx =
list_rcopy_vt<x0>(xx)
//
in
gseq_unrlist_vt<xs><x0>(xx)
end // end of [gseq_unlist]
//
#impltmp
<xs><x0>
gseq_unrlist(xx) =
let
  val xx =
  list_copy_vt<x0>(xx)
in
gseq_unrlist_vt<xs><x0>(xx)
end // end of [gseq_unrlist]
//
#impltmp
<xs><x0>
gseq_unlist_vt(xx) =
let
//
val xx =
list_vt_reverse0<x0>(xx)
//
in
  gseq_unrlist_vt<xs><x0>(xx)
end // end of [gseq_unlist_vt]
//
#impltmp
<xs><x0>
gseq_unrlist_vt(xx) =
let
//
fun
loop
( xx
: list_vt(x0), xs: xs): xs =
(
case+ xx of
| ~
list_vt_nil() => xs
| ~
list_vt_cons(x0, xx) =>
loop
(xx, gseq_cons<xs><x0>(x0, xs))
)
in
  loop(xx, gseq_nil<xs><x0>())
endlet//end-of-[gseq_unrlist_vt]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_unstrm_vt
  (xx) =
(
  gseq_unrlist_vt<xs><x0>(xs)
) where
{
val xs = strm_vt_rlistize<x0>(xx)
}(*where*)//end-of(gseq_unstrm_vt)

(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_map_list
  (xs) = let
//
#vwtpdef
yy = list_vt(y0)
//
#typedef r0 = p2tr(yy)
//
#impltmp
foldl$fopr
<x0><r0>(p0, x0) =
let
//
val y0 =
map$fopr<x0><y0>(x0)
val r1 = 
list_vt_cons(y0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_foldl<xs><x0><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_map_list/foldl]
//
(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_map_rlist
  (xs) = let
//
#vwtpdef
r0 = list_vt(y0)
//
in
//
gseq_foldl
<xs><x0><r0>
(xs, list_vt_nil()) where
{
#impltmp
foldl$fopr
 <x0><r0>
( r0, x0 ) =
list_vt_cons(map$fopr<x0><y0>(x0), r0)
}
//
end // end-of(gseq_map_rlist/foldl)

(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_map_strm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
(
strm_vt_map0<x0><y0>(xs)
) where
{
#impltmp
map0$fopr<x0><y0> = map$fopr<x0><y0>
}
end // end-of(gseq_map_strm/strmize)

(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_mapopt_list(xs) =
strm_vt_listize
(gseq_mapopt_strm(xs))
#impltmp
<xs><x0><y0>
gseq_mapopt_rlist(xs) =
strm_vt_rlistize
(gseq_mapopt_strm(xs))
//
#impltmp
<xs><x0><y0>
gseq_mapopt_strm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
let
#impltmp
map0$fopr
<x0><y0> = map$fopr<x0><y0>
#impltmp
filter1$test<x0> = filter$test<x0>
in
  strm_vt_mapopt0<x0><y0>(xs)
end
end // end-of(impltmp)
// end-of(gseq_mapopt_strm/strmize)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_copy_list(xs) =
(
  gseq_map_list<xs><x0><x0>(xs)
) where
{
  #impltmp map$fopr<x0><x0>(x0) = x0
}
#impltmp
<xs><x0>
gseq_copy_rlist(xs) =
(
gseq_map_rlist<xs><x0><x0>(xs)
) where
{
  #impltmp map$fopr<x0><x0>(x0) = x0
}
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_filter_list
  (xs) = let
//
#vwtpdef
xx = list_vt(x0)
//
#typedef r0 = p2tr(xx)
//
#impltmp
foldl$fopr
<x0><r0>
(p0, x0) =
if
filter$test<x0>(x0)
then
let
//
val r1 = 
list_vt_cons(x0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<xx>
(p0, $UN.castlin01(r1)); (p1)
end
else p0 // end of [foldl$fopr]
//
var r0: xx
val pz =
gseq_foldl<xs><x0><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<xx>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_filter_list/foldl]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_filter_rlist
  (xs) = let
//
#vwtpdef
r0 = list_vt(x0)
//
in
//
gseq_foldl
<xs><x0><r0>
(xs, list_vt_nil()) where
{
  #impltmp
  foldl$fopr
  <x0><r0>
  (r0, x0) =
  if
  filter$test<x0>(x0)
  then list_vt_cons(x0, r0) else r0
}
//
end//end-of(gseq_filter_rlist/foldl)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_filter_strm
  (xs) =
(
strm_vt_filter0
(gseq_strmize<xs><x0>(xs))
) where
{
#impltmp
filter0$test<x0> = filter$test<x0>
}(*where*)//end of(gseq_filter_strm)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_add(xs) =
(
gseq_map_add<xs><x0>(xs)
) where
{
  #impltmp map$fopr<x0><x0>(x0) = x0
}
//
#impltmp
<xs><x0><y0>
gseq_map_add(xs) =
let
//
#impltmp
foldl$fopr
<x0><y0>
(r0, x0) =
g_add<y0>
(r0, map$fopr<x0><y0>(x0))
//
in
gseq_foldl<xs><x0><y0>(xs, g_0<y0>())
end // end of [gseq_map_add/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_mul(xs) =
(
gseq_map_mul(xs)
) where
{
  #impltmp map$fopr<x0><x0>(x0) = x0
}
//
#impltmp
<xs><x0><y0>
gseq_map_mul(xs) =
let
//
#impltmp
foldl$fopr
<x0><y0>
(r0, x0) =
g_mul<y0>
(r0, map$fopr<x0><y0>(x0))
//
in
gseq_foldl<xs><x0><y0>(xs, g_1<y0>())
end // end of [gseq_map_mul/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_max_exn
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
$raise SubscriptExn()
else
gseq_max_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs))
) (* end of [gseq_max_exn] *)
//
#impltmp
<xs><x0>
gseq_min_exn
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
$raise SubscriptExn()
else
gseq_min_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs))
) (* end of [gseq_min_exn] *)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_max_opt
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
optn_vt_nil((*void*))
else
optn_vt_cons
(
gseq_max_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs))
)
) (* end of [gseq_max_opt] *)
//
#impltmp
<xs><x0>
gseq_min_opt
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
optn_vt_nil((*void*))
else
optn_vt_cons
(
gseq_min_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs))
)
) (* end of [gseq_min_opt] *)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_max_ini
(xs, x0) = let
//
#typedef r0 = x0
//
#impltmp
foldl$fopr
<x0><r0>
(r0, x0) = g_max<x0>(r0, x0)
//
in
  gseq_foldl<xs><x0><r0>(xs, x0)
end // end of [gseq_max_ini/foldl]
//
#impltmp
<xs><x0>
gseq_min_ini
(xs, x0) = let
//
#typedef r0 = x0
//
#impltmp
foldl$fopr
<x0><r0>
(r0, x0) = g_min<x0>(r0, x0)
//
in
  gseq_foldl<xs><x0><r0>(xs, x0)
end // end of [gseq_min_ini/foldl]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_sortedq(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in
  strm_vt_sortedq<x0>(xs)
end(*let*)//end-of(gseq_sortedq)

(* ****** ****** *)

#impltmp
<xs>
<x0><r0>
gseq_foldr
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_rforeach<xs><x0>(xs)
) where
{
#impltmp
rforeach$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldr$fopr<x0><r0>(x0, r0))
//
end // end of [rforeach$work]
}
//
} (* end of [gseq_foldr/rforeach] *)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rexists
  (xs) = let
//
  #impltmp
  rforall$test<x0>(x0) =
  not(rexists$test<x0>(x0))
//
in
if
gseq_rforall
<xs><x0>(xs) then false else true
end
// end of [gseq_rexists/rforall]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_rforall(xs) =
let
val xs =
gseq_rlistize<xs><x0>(xs)
in
(
  list_vt_forall0<x0>(xs)
) where
{
#impltmp
forall0$test<x0>
(  x0  ) = rforall$test<x0>(x0)
}
end // end of
// [gseq_rforall/list_vt_forall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_rforeach(xs) =
let
val
test =
gseq_rforall<xs><x0>(xs) where
{
#impltmp
rforall$test<x0>(x0) =
let
val () =
rforeach$work<x0>(x0) in true end
}
in
  // nothing
endlet//end(gseq_rforeach/rforall)

(* ****** ****** *)
//
(*
(*
HX-2022-06-15:
Using [gseq_cons] should
be avoided as it enforces
the list-like sequentiality!
*)
#impltmp
<xs><x0>
gseq_append
(xs1, xs2) =
(
gseq_foldr
<xs><x0><r0>(xs1, xs2)
) where
{
//
#typedef r0 = xs
//
#impltmp
foldr$fopr
<x0><r0>(x0, r0) =
gseq_cons<xs><x0>(x0, r0)
}(*whr*)//end(gseq_append/foldr)
*)
//
#impltmp
<xs><x0>
gseq_append
(xs1, xs2) = 
gseq_unstrm_vt<xs><x0>
(
gseq_append_strm<xs><x0>(xs1,xs2)
)
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat(xss) =
gseq_unstrm_vt<xs><x0>
(
gseq_concat_strm<xz><xs><x0>(xss)
)
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_reverse(xs) =
gseq_rappend<xs><x0>
(xs, gseq_nil<xs><x0>())
*)
//
#impltmp
<xs><x0>
gseq_reverse(xs) =
gseq_unstrm_vt<xs><x0>
(
gseq_rstrmize<xs><x0>(xs)
)
//
(* ****** ****** *)
//
(*
(*
HX-2022-06-15:
Using [gseq_cons] should
be avoided as it enforces
the list-like sequentiality!
*)
#impltmp
<xs><x0>
gseq_rappend(xs1, xs2) =
(
gseq_foldl<xs><x0><r0>(xs1, xs2)
) where
{
//
#typedef r0 = xs
//
#impltmp
foldl$fopr
<x0><xs>(r0, x0) =
let
val r0 =
gseq_cons<xs><x0>(x0, r0) in r0
end(*let*)//end-of-(foldl$fopr)
}(*where*)//end-of-(gseq_rappend)
*)
//
#impltmp
<xs><x0>
gseq_rappend(xs1, xs2) =
gseq_unstrm_vt<xs><x0>
(
gseq_rappend_strm<xs><x0>(xs1,xs2)
)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_append_strm
  (xs1, xs2) = let
//
val
xs1 =
gseq_strmize<xs><x0>(xs1)
val
xs2 =
gseq_strmize<xs><x0>(xs2)
//
in
  strm_vt_append<x0>(xs1, xs2)
end // end-of [gseq_append_strm]
//
(* ****** ****** *)
//
#impltmp
<cz>(*tmp*)
gseq_concat_strn
  (css) = let
//
#typedef c0 = cgtz
#typedef cs = strn
//
val css =
gseq_strmize<cz><cs>(css)
//
in
strn_vt_make_strm_vt<>
(strm_vt_gconcat<cs><c0>(css))
end // end of [gseq_concat_strn]
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat_strm
  (xss) = let
//
#vwtpdef
ys = strm_vt(x0)
//
val
xss =
let
#impltmp
map$fopr<xs><ys> =
gseq_strmize<xs><x0>
in
gseq_map_strm<xz><xs>(xss)
end
//
in
  strm_vt_concat<x0>(  xss  )
end // end of [gseq_concat_strm]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rappend_strm
  (xs1, xs2) = let
//
val
xs2 =
gseq_strmize<xs><x0>(xs2)
val
xs1 =
gseq_rstrmize<xs><x0>(xs1)
//
in
  strm_vt_append<x0>(xs1, xs2)
end // end-of-[gseq_rappend_strm]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_prefixq
( xs1, xs2 ) =
(
strm_vt_prefixq(xs1, xs2)
) where
{
val xs1 =
gseq_strmize<xs><x0>(xs1)
and xs2 =
gseq_strmize<xs><x0>(xs2)
} (* end of [gseq_prefixq] *)
(*
//HX-2022-06-13:
//[xs1] is a prefix of [xs2]
*)
//
#impltmp
<xs><x0>
gseq_suffixq
( xs1, xs2 ) =
(
list_vt_suffixq0(xs1, xs2)
) where
{
val xs1 =
gseq_listize<xs><x0>( xs1 )
and xs2 =
gseq_listize<xs><x0>( xs2 )
} (* end of [gseq_suffixq] *)
(*
//HX-2022-06-13:
//[xs1] is a suffix of [xs2]
*)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_group
(  xs  ) =
(
(
strm_vt_map0<r0>(xz)
) where
{
#impltmp
map0$fopr<r0><xs> =
gseq_unlist_vt<xs><x0>
}
) where
{
//
#vwtpdef
r0 = list_vt(x0)
//
val xz =
gseq_group_list<xs><x0>(xs)
}(*where*)// end of [gseq_group]
//
#impltmp
<xs><x0>
gseq_group_list
(  xs  ) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in
(
strm_vt_group0_list<x0>(xs)
) where
{
#impltmp
group0$test<x0> = group$test<x0>
}
end(*let*)//end-of-[gseq_group_list]
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_idropif
  (xs) =
( loop(xs, 0) ) where
{
//
fun
loop
( xs: xs
, i0: nint): xs =
if
gseq_nilq<xs><x0>(xs)
then
(
  gseq_nil<xs><x0>()
)
else
let
val x0 =
gseq_head_raw<xs><x0>(xs)
in
if
idropif$test<x0>(i0, x0)
then
(
  loop(xs, succ(i0))
) where
{
val xs =
gseq_tail_raw<xs><x0>(xs)
} (* end of [then] *)
else xs // end-of-else
endlet (* end of [loop] *)
//
} (* end of [gseq_idropif] *)
//
(* ****** ****** *)

#impltmp
<xs><x0><r0>
gseq_ifoldl
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_iforeach<xs><x0>(xs)
) where
{
#impltmp
iforeach$work<x0>(i0, x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
(p0, ifoldl$fopr<x0><r0>(r0, i0, x0))
//
end // end of [iforeach$work]
}
//
} (* end of [gseq_ifoldl/iforeach] *)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_iexists
  (xs) = let
//
#impltmp
iforall$test<x0>(i0, x0) =
not(iexists$test<x0>(i0, x0))
//
in
if
gseq_iforall
<xs><x0>(xs) then false else true
end
// end of [gseq_rexists/rforall]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_iforall(xs) =
let
//
var i0: nint = 0
val p0 = $addr(i0)
//
in
//
let
#impltmp
forall$test<x0>(x0) =
(
iforall$test<x0>(i0, x0)
) where
{
val i0 =
$UN.p2tr_get<nint>(p0)
val () =
$UN.p2tr_set<nint>(p0, succ(i0))
}
in
  gseq_forall<xs><x0>(xs)
end (* end of [gseq_forall] *)
//
end // end of [gseq_iforall/forall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_iforeach(xs) =
let
val
test =
gseq_iforall<xs><x0>(xs) where
{
#impltmp
iforall$test<x0>(i0, x0) =
let
val () = iforeach$work<x0>(i0, x0) in true
end
}
in
  // nothing
end // end of [gseq_iforeach/iforall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_indexof
  (xs, x0) = let
//
var i0: sint = -1
val p0 = $addr(i0)
//
#impltmp
iforall$test<x0>
  (i1, x1) =
if
g_equal<x0>(x0, x1)
then
let
val () =
$UN.p2tr_set<sint>(p0, i1)
in
  false // HX: found
end // then
else true // else // end-of-if
//
in
let
val yn =
gseq_iforall<xs><x0>(xs) in i0
end
end // end of [gseq_indexof/iforall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_rindexof
  (xs, x0) = let
//
var i0: sint = -1
val p0 = $addr(i0)
//
#impltmp
iforeach$work<x0>
  (i1, x1) =
if
g_equal<x0>(x0, x1)
then
let
val () =
$UN.p2tr_set<sint>(p0, i1)
end // then // end of [if]
//
in
let
val () =
gseq_iforeach<xs><x0>(xs) in i0
end
end // end of [gseq_rindexof/iforeach]

(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_imap_list
  (xs) = let
//
#vwtpdef
yy = list_vt(y0)
//
#typedef r0 = p2tr(yy)
//
#impltmp
ifoldl$fopr
<x0><r0>
(p0, i0, x0) =
let
//
val y0 =
imap$fopr
<x0><y0>(i0, x0)
val r1 = 
list_vt_cons(y0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_ifoldl<xs><x0><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_imap_list/ifoldl]
//
(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_imap_rlist
  (xs) = let
//
#vwtpdef
r0 = list_vt(y0)
//
in//let
//
gseq_ifoldl
<xs><x0><r0>
(xs, list_vt_nil()) where
{
#impltmp
ifoldl$fopr
 <x0><r0>
( r0, i0, x0 ) =
list_vt_cons
( imap$fopr<x0><y0>(i0, x0), r0 )
// list_vt_cons
}
//
end//end-of(gseq_imap_rlist/ifoldl)

(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_imap_strm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
(
strm_vt_imap0<x0><y0>(xs)
) where
{
#impltmp
imap0$fopr
<x0><y0> = imap$fopr<x0><y0>
}
end//end-of(gseq_imap_strm/strmize)

(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_imapopt_strm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
(
strm_vt_imapopt0<x0><y0>(xs)
) where
{
#impltmp
imap0$fopr
<x0><y0> = imap$fopr<x0><y0>
#impltmp
ifilter1$test<x0> = ifilter$test<x0>
}
end//end-of(gseq_imap_strm/strmize)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_istrmize
  ( xs ) =
(
  strm_vt_istrmize
  ( gseq_strmize<xs><x0>(xs) )
) (* end of [gseq_istrmize] *)
//
(* ****** ****** *)
//
(*
HX:
Miscellaneous gseq-operations
*)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_mergesort
  (xs) =
(
gseq_unlist_vt<xs><x0>(xx)
) where
{
val xx =
gseq_mergesort_list<xs><x0>(xs)
} (* end of [gseq_mergesort] *)
#impltmp
<xs><x0>
gseq_mergesort_list
  (xs) =
(
  list_vt_mergesort0<x0>(xx)
) where
{
val xx = gseq_listize<xs><x0>(xs)
} (* end of [gseq_mergesort_list] *)
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_permutize
  (xs) = let
//
#vwtpdef
y0 = list_vt(x0)
//
val y0 =
gseq_listize<xs><x0>(xs)
val ys =
list_vt_permutize0<x0>(y0)
//
in//let
(
  strm_vt_map0<y0><xs>(ys)
) where
{
#impltmp
map0$fopr<y0><xs> = gseq_unlist_vt<xs><x0>
}
end // end of [gseq_permutize]

(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)
//
#impltmp
<xs
,ys><x0>
gseq_z2cmp
  (xs, ys) =
(
gseq_z2forcmp
<xs,ys><x0,x0>(xs, ys)
) where
{
#impltmp
z2forcmp$fcmp<x0,x0> = g_cmp<x0>
}(*where*)//[gseq_z2cmp/z2forcmp]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2listize
  (xs, ys) =
let
val
xys =
gseq_z2strmize
<xs,ys><x0,y0>(xs, ys)
in
strm_vt_listize<(x0,y0)>(xys)
end//let//end-of-[gseq_z2listize]
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2strmize
  (xs, ys) =
let
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
in
strm_vt_z2strmize<x0,y0>(xs, ys)
end//let//end-of-[gseq_z2strmize]
//
(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><r0>
gseq_z2foldl
(xs, ys, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_z2foreach
  <xs,ys><x0,y0>(xs, ys)
) where
{
#impltmp
z2foreach$work<x0,y0>
  (x0, y0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
( p0
, z2foldl$fopr<x0,y0><r0>(r0, x0, y0))
//
end // end of [z2foreach$work]
}
//
} (* end of [gseq_z2foldl/z2foreach] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_z2forall
  (xs, ys) =
(
strm_vt_z2forall0<x0,y0>
(
  gseq_strmize<xs><x0>(xs)
,
  gseq_strmize<ys><y0>(ys))
) where
{
#impltmp
z2forall0$test<x0,y0> = z2forall$test<x0,y0>
} (* end of [gseq_z2forall] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_z2forcmp
  (xs, ys) =
(
strm_vt_z2forcmp0<x0,y0>
(
  gseq_strmize<xs><x0>(xs)
,
  gseq_strmize<ys><y0>(ys))
) where
{
#impltmp
z2forcmp0$fcmp<x0,y0> = z2forcmp$fcmp<x0,y0>
} (* end of [gseq_z2forcmp] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_z2foreach
  (xs, ys) =
let
val
test =
gseq_z2forall<xs,ys><x0,y0>
  (xs, ys) where
{
#impltmp
z2forall$test<x0,y0>(x0, y0) =
let
val () =
z2foreach$work<x0,y0>(x0, y0) in true
end
}
in
  // nothing
end // end of [gseq_z2foreach/z2forall]

(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2map_list
  (xs, ys) = let
//
#vwtpdef
zz =
list_vt(z0)
//
#typedef
r0 = p2tr(zz)
//
#impltmp
z2foldl$fopr
<x0,y0><r0>
(p0, x0, y0) =
let
//
val z0 =
z2map$fopr
<x0,y0><z0>(x0, y0)
val r1 = 
list_vt_cons(z0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<zz>
(p0, $UN.castlin01(r1)); (p1)
end // z2foldl$fopr
//
var r0: zz
val pz =
gseq_z2foldl
<xs,ys><x0,y0><r0>(xs, ys, $addr(r0))
//
in
$UN.p2tr_set<zz>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_z2map_list/z2foldl]
//
(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2map_strm
  (xs, ys) =
(
strm_vt_concat<z0>(zss)
) where
{
//
#vwtpdef
zs = strm_vt(z0)
//
val
zss =
let
//
#impltmp
map$fopr<x0><zs>(x0) =
let
#impltmp
map$fopr<y0><z0>(y0) =
x2map$fopr<x0,y0>(x0, y0)
in
gseq_map_strm<ys><y0><z0>(ys)
end
//
in
gseq_map_strm<xs><x0><zs>(xs)
end//let
//
} (* end of [gseq_x2map_strm] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2mapopt_strm
  (xs, ys) =
(
strm_vt_concat<z0>(zss)
) where
{
//
#vwtpdef
zs = strm_vt(z0)
//
val
zss =
let
//
#impltmp
map$fopr<x0><zs>(x0) =
let
#impltmp
map$fopr
<y0><z0>(y0) =
x2map$fopr<x0,y0>(x0, y0)
#impltmp
filter$test<y0>(y0) =
x2filter$test<x0,y0>(x0, y0)
in
gseq_mapopt_strm<ys><y0><z0>(ys)
end//let
//
in
  gseq_map_strm<xs><x0><zs>( xs )
end (*let*) // end-of[map$fopr]
//
} (* end of [gseq_x2mapopt_strm] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2strmize
  (xs, ys) =
let
#impltmp
x2map$fopr<x0,y0>(x0, y0) = (x0, y0)
in
gseq_x2map_strm<xs,ys><x0,y0>(xs, ys)
end // end of [gseq_x2strmize]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2foreach_row
(xs, ys) =
(
gseq_foreach<xs><x0>(xs)
) where
{
//
#impltmp
foreach$work<x0>(x0) =
let
//
val () =
x2foreach_row$beg<>()
//
val () =
(
gseq_foreach<ys><y0>(ys)
) where
{
#impltmp
foreach$work<y0>(y0) =
x2foreach_row$work<x0,y0>(x0, y0)
}
//
val () = x2foreach_row$end<>()
//
end // end of [let]
//
} (* end of [gseq_x2foreach_row] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2foreach_col
(xs, ys) =
let
#impltmp
x2foreach_row$beg<>() =
x2foreach_col$beg<>()
#impltmp
x2foreach_row$end<>() =
x2foreach_col$end<>()
#impltmp
x2foreach_row$work<y0,x0>(y0, x0) =
x2foreach_col$work<x0,y0>(x0, y0)
in
gseq_x2foreach_row<ys,xs><y0,x0>(ys, xs)
end (* end of [gseq_x2foreach_col] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imap_strm
  (xs, ys) =
(
strm_vt_concat<z0>(zss)
) where
{
//
#vwtpdef
zs = strm_vt(z0)
//
val
zss =
let
//
#impltmp
imap$fopr<x0><zs>(i, x0) =
let
#impltmp
imap$fopr
<y0><z0>(j, y0) =
x2imap$fopr<x0,y0>(i,x0,j,y0)
in
gseq_imap_strm<ys><y0><z0>(ys)
end
//
in
gseq_imap_strm<xs><x0><zs>( xs )
end//let
//
} (* end of [gseq_x2imap_strm] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imapopt_strm
  (xs, ys) =
(
strm_vt_concat<z0>(zss)
) where
{
//
#vwtpdef
zs = strm_vt(z0)
//
val
zss =
let
//
#impltmp
imap$fopr<x0><zs>(i, x0) =
let
#impltmp
imap$fopr
<y0><z0>(j, y0) =
x2imap$fopr<x0,y0>(i, x0, j, y0)
#impltmp
ifilter$test<y0>(j, y0) =
x2ifilter$test<x0,y0>(i, x0, j, y0)
in
gseq_imapopt_strm<ys><y0><z0>(ys)
end
//
in
  gseq_imap_strm<xs><x0><zs>( xs )
end//let
//
} (* end of [gseq_x2imapopt_strm] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2iforeach_row
(xs, ys) =
(
gseq_iforeach<xs><x0>(xs)
) where
{
//
#impltmp
iforeach$work<x0>(i, x0) =
let
//
val () =
x2iforeach_row$beg<>(i)
//
val () =
(
gseq_iforeach<ys><y0>(ys)
) where
{
#impltmp
iforeach$work<y0>(j, y0) =
x2iforeach_row$work<x0,y0>(i, x0, j, y0)
}
//
val () = x2iforeach_row$end<>(i)
//
end // end of [let]
//
} (*where*) // end of [gseq_x2iforeach_row]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2iforeach_col
(xs, ys) =
let
#impltmp
x2iforeach_row$beg<>(i) =
x2iforeach_col$beg<>(i)
#impltmp
x2iforeach_row$end<>(i) =
x2iforeach_col$end<>(i)
#impltmp
x2iforeach_row$work<y0,x0>(j, y0, i, x0) =
x2iforeach_col$work<x0,y0>(i, x0, j, y0)
in
gseq_x2iforeach_row<ys,xs><y0,x0>(ys, xs)
end (* let *) // end of [gseq_x2iforeach_col]

(* ****** ****** *)
//
// HX-2022-07-01:
// higher-order gseq-functions
//
(* ****** ****** *)
// HX: gseq_foldl
(* ****** ****** *)
#impltmp
<xs><x0><r0>
gseq_foldl_fnp2
( xs, r0, f0 ) =
(
gseq_foldl
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl$fopr
<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//gseq_foldl_fnp2(xs,r0,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_foldl_cfr2
( xs, r0, f0 ) =
(
gseq_foldl
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl$fopr
<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//gseq_foldl_cfr2(xs,r0,f0)
(* ****** ****** *)
// HX: gseq_foldr
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_foldr_fnp2
( xs, r0, f0 ) =
(
gseq_foldr
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr$fopr
<x0><r0>(x0, r0) = f0(x0, r0)
}(*where*)//gseq_foldr_fnp2(xs,r0,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_foldr_cfr2
( xs, r0, f0 ) =
(
gseq_foldr
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr$fopr
<x0><r0>(x0, r0) = f0(x0, r0)
}(*where*)//gseq_foldr_cfr2(xs,r0,f0)
(* ****** ****** *)
// HX: gseq_exists
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_exists_fnp1
(    xs, f0    ) =
(
gseq_exists<xs><x0>(xs)) where
{
#impltmp exists$test<x0>(x0) = f0(x0)
} (*where*)//gseq_exists_fnp1(xs, f0)
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_exists_cfr1
(    xs, f0    ) =
(
gseq_exists<xs><x0>(xs)) where
{
#impltmp exists$test<x0>(x0) = f0(x0)
} (*where*)//gseq_exists_cfr1(xs, f0)
(* ****** ****** *)
// HX: gseq_forall
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_forall_fnp1
(    xs, f0    ) =
(
gseq_forall<xs><x0>(xs)) where
{
#impltmp forall$test<x0>(x0) = f0(x0)
} (*where*)//gseq_forall_fnp1(xs, f0)
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_forall_cfr1
(    xs, f0    ) =
(
gseq_forall<xs><x0>(xs)) where
{
#impltmp forall$test<x0>(x0) = f0(x0)
} (*where*)//gseq_forall_cfr1(xs, f0)
(* ****** ****** *)
// HX: gseq_foreach
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_foreach_fnp1
(    xs, f0    ) =
(
gseq_foreach<xs><x0>(xs)) where
{
#impltmp foreach$work<x0>(x0) = f0(x0)
} (*where*)//gseq_foreach_fnp1(xs, f0)
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_foreach_cfr1
(    xs, f0    ) =
(
gseq_foreach<xs><x0>(xs)) where
{
#impltmp foreach$work<x0>(x0) = f0(x0)
} (*where*)//gseq_foreach_cfr1(xs, f0)
(* ****** ****** *)
// HX: gseq_map_list
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_list_fnp1
(    xs, f0    ) =
(
gseq_map_list<xs><x0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//gseq_map_list_fnp1(xs,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_list_cfr1
(    xs, f0    ) =
(
gseq_map_list<xs><x0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//gseq_map_list_cfr1(xs,f0)
(* ****** ****** *)
// HX: gseq_map_strm
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_strm_fnp1
(    xs, f0    ) =
(
gseq_map_strm<xs><x0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//gseq_map_strm_fnp1(xs,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_strm_cfr1
(    xs, f0    ) =
(
gseq_map_strm<xs><x0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//gseq_map_strm_cfr1(xs,f0)
(* ****** ****** *)
// HX: gseq_ifoldl
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldl_fnp3
(  xs, r0, f0  ) =
(
gseq_ifoldl<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldl$fopr
< x0><r0 >(r0, i0, x0) = f0(r0, i0, x0)
} (*where*)//gseq_ifoldl_fnp3(xs,r0,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldl_cfr3
(  xs, r0, f0  ) =
(
gseq_ifoldl<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldl$fopr
< x0><r0 >(r0, i0, x0) = f0(r0, i0, x0)
} (*where*)//gseq_ifoldl_cfr3(xs,r0,f0)
(* ****** ****** *)
// HX: gseq_ifoldr
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldr_fnp3
(  xs, r0, f0  ) =
(
gseq_ifoldr<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldr$fopr
< x0><r0 >(i0, x0, r0) = f0(i0, x0, r0)
} (*where*)//gseq_ifoldr_fnp3(xs,r0,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldr_cfr3
(  xs, r0, f0  ) =
(
gseq_ifoldr<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldr$fopr
< x0><r0 >(i0, x0, r0) = f0(i0, x0, r0)
} (*where*)//gseq_ifoldr_cfr3(xs,r0,f0)
(* ****** ****** *)
// HX: gseq_iexists
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iexists_fnp2
(    xs, f0    ) =
(
gseq_iexists<xs><x0>(xs)) where
{
#impltmp
iexists$test<x0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_iexists_fnp2(xs, f0)
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iexists_cfr2
(    xs, f0    ) =
(
gseq_iexists<xs><x0>(xs)) where
{
#impltmp
iexists$test<x0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_iexists_cfr2(xs, f0)
(* ****** ****** *)
// HX: gseq_iforall
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforall_fnp2
(    xs, f0    ) =
(
gseq_iforall<xs><x0>(xs)) where
{
#impltmp
iforall$test<x0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_iforall_fnp2(xs, f0)
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforall_cfr2
(    xs, f0    ) =
(
gseq_iforall<xs><x0>(xs)) where
{
#impltmp
iforall$test<x0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_iforall_cfr2(xs, f0)
(* ****** ****** *)
// HX: gseq_iforeach
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforeach_fnp2
(    xs, f0    ) =
(
gseq_iforeach<xs><x0>(xs)) where
{
#impltmp
iforeach$work<x0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_iforeach_fnp2(xs, f0)
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforeach_cfr2
(    xs, f0    ) =
(
gseq_iforeach<xs><x0>(xs)) where
{
#impltmp
iforeach$work<x0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_iforeach_cfr2(xs, f0)
(* ****** ****** *)
// HX: gseq_imap_list
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_list_fnp2
(    xs, f0    ) =
(
gseq_imap_list<xs><x0>(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_imap_list_fnp2(xs,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_list_cfr2
(    xs, f0    ) =
(
gseq_imap_list<xs><x0>(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_imap_list_cfr2(xs,f0)
(* ****** ****** *)
// HX: gseq_imap_strm
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_strm_fnp2
(    xs, f0    ) =
(
gseq_imap_strm<xs><x0>(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_imap_strm_fnp2(xs,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_strm_cfr2
(    xs, f0    ) =
(
gseq_imap_strm<xs><x0>(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_imap_strm_cfr2(xs,f0)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseq000.dats] *)
