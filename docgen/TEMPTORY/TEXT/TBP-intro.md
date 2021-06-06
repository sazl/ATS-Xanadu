# Template-Based Programming

The notion of *late-binding* is prevalent in programming language
design and implementation. For instance, linking the name of a
function to the actual code implementing the function can be seen as a
form of late-binding (at link-time). More conspicuously, method
dispatching in object-oriented programming (OOP) is also a well-known
form of late-binding (at run-time). As a form of late-binding at
compile-time, one can think of overloading supported by type classes
in Haskell.

Template-Based Programming (TBP) advocates the use of (function)
templates in place of functions, which can be regarded as a form of
late-binding at compile-time. Intuitively, one may think of templates
as functions containing placeholders inside their bodies that can be
replaced with code obtained *contextually* at compile-time. It is
important to emphasize that the mentioned code replacement is
inherently of a recursive nature as code obtained contextually may
itself contain templates.

Various aspects of templates have already appeared in languages such
as LISP (macros), Haskell (type classes), Scala (implicits), etc. One
may also see great similarity between resolving a template call (in
TBP) at compile-time and dispatching a method call (in OOP) at
run-time.

There are plenty of motivating examples for templates. For the moment,
let us take a look at equality types in Standard ML (SML), which can
be said to have directly motivated the addition of type classes into
Haskell.

Basically, an equality type in SML is one that supports polymorphic
equality (=), which is given the type `''a * ''a -> bool` (instead of
`'a * 'a -> bool`). In other words, a type variable `''a` can only be
instantiated with an equality type (where a special function is
designated for testing equality on elements of this type).
  
There is *no* polymorphic equality in ATS3. In order to test whether two
given lists (of the same generic type) are equal, one could try to
implement a function template of the following interface:

```ats
fun
<a:type>
list_fequal
( xs: list(a)
, ys: list(a)
, eq: (a, a) -> bool): bool
```

This is a workable solution based on the notion of higher-order
function but it suffers from the requirement that each caller of
`list_fequal` must pass to it *explicitly* a function argument (for
testing equality on elements in the two given lists).

Let us see a template-based solution to implementing equality test on
lists. In ATS3, the name `g_equal` refers to a template of the
following interface:

```ats
fun
<a:type>
g_equal(a, a): bool
```

A function `list_equal` can be defined as follows to test whether two
given lists are equal by calling `g_equal` to test equality on elements:

```ats

#extern
fun
<a:type>
list_equal
( xs: list(a)
, ys: list(a)): bool

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_equal
  (xs, ys) =
( loop(xs, ys) ) where
{
//
fun
loop
( xs: list(a)
, ys: list(a) ): bool =
(
case+ xs of
| list_nil() =>
  (
  case+ ys of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(x0, xs) =>
  (
  case+ ys of
  | list_nil() => true
  | list_cons(y0, ys) =>
    let
      val ans =
      g_equal<a>(x0, y0)
    in
      if ans then loop(xs, ys) else false
    end
  )
) (* end of [loop] *)
//
} (* end of [list_equal] *)

```

Note that `g_equal` is already given a standard implementation on
basic types like int, bool, char, string, etc. If `list_equal` is
called on two lists of the type `list(int)`, the compiler can
automatically find based on contextual information an implementation
of `g_equal<int>` needed for compiling `list_equal<int>`. Moreover,
one can direct the compiler to locate another implementation of
`g_equal<int>` if needed. It is in this sense of directing the
compiler to establish a link between a call to `g_equal<int>`
and an implementation of `g_equal<int>` that TBP can be regarded
as a form of late-binding at compile-time.

Templates in ATS3 are embeddable for they can be implemented in the
body of other templates. As an example, the previous higher-order
template `list_fequal` can be given an implementation based on
`list_equal` as follows:


```ats
impltmp
<a>(*tmp*)
list_fequal
  (xs, ys, eq) =
(
  list_equal<a>(xs, ys)
) where
{
  impltmp g_equal<a>(x, y) = eq(x, y)
}
```

where an implementation of `g_equal<a>` is given in the body of the
implementation of `list_fequal<a>`.  It will become clear soon that
the embeddability of templates is a feature that can be made of use
to greatly simplify the way in which a program is structured.

With the above simple example, I have demonstrated a bit of TBP where
templates are employed to replace higher-order functions.  While this
is a typical entry point for TBP, there are many more aspects of TBP
that are yet to be explored.
