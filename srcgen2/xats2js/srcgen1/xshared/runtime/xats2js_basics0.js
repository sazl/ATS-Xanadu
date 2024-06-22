////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// HX-2024-06-22:
// ATS3-XANADU/srcgen2/xats2js/srcgen1
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/bool000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_bool_neg
  (btf0)
{
    return (!btf0) ;
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_bool_add
  (btf1, btf2)
{
    return (btf1 || btf2);
}
//
function
XATS2JS_bool_mul
  (btf1, btf2)
{
    return (btf1 && btf2);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/char000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_eqz
  (chr0)
{
    return (0 === chr0); // eqz
}
function
XATS2JS_char_neqz
  (chr0)
{
    return (0 !== chr0); // neqz
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_cmp
  (chr1, chr2)
{
    if (chr1 < chr2)
	return (-1);
    else
	return (chr1 <= chr2 ? 0 : 1);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/gint000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_neg_sint
  (sint)
{
    return (-sint); // neg
}
//
function
XATS2JS_gint_abs_sint
  (sint)
{
    if (sint >= 0)
	return sint; // abs
    else
	return (-sint); // abs
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_succ_sint
  (sint)
{
    return (sint + 1); // +1
}
//
function
XATS2JS_gint_succ_uint
  (uint)
{
    return (uint + 1); // +1
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_pred_sint
  (sint)
{
    return (sint - 1); // -1
}
//
function
XATS2JS_gint_pred_uint
  (uint)
{
    return (uint - 1); // -1
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lnot_uint
  (uint)
{
    return (~uint); // lnot
}
//
function
XATS2JS_gint_lor2_uint
  (uix0, uiy0)
{
    return (uix0 | uiy0); // lor2
}
//
function
XATS2JS_gint_land_uint
  (uix0, uiy0)
{
    return (uix0 & uiy0); // land
}
//
function
XATS2JS_gint_lxor_uint
  (uix0, uiy0)
{
    return (uix0 ^ uiy0); // lxor
}
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// end of [ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_basics0.js]
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////