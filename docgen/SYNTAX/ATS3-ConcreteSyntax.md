The Concrete Syntax of Xanadu
=============================

### Author: Hongwei Xi (gmhwxi@gmail.com)

___________________

ATS/Xanadu refers to a programming language in the ATS family and its
implementation. It is often referred to as ATS3 for its being the 3rd
edition of ATS (while Xanadu is the name of the implementation).

ATS3 is designed to be both a source language and a target language;
it is a source for manual program construction (by programmers), and
it is also a target for automated code generation (by compilers). It
is expected that various extensions to ATS3 will be built in the
future that compile back to ATS3 itself.

The concrete syntax of ATS3 has its root in ML, and its design is
also influenced by C and Lisp. In this document, please find an
informal and partial presentation of the concrete syntax of ATS3,
which primarily relies on code examples for illustration.

Primitive Constants
-------------------

There are currently in ATS3 the following kinds of primitive
constants: ints (for intergers), bools (for booleans), chars (for
characters), floats (for floating point numbers), and strings (of
characters).  It is planned to support strings of various unicodes in
the future.

### Ints

Each integer is represented as a non-empty sequence of digits. It is
assumed by default that the base of a representation is 10 unless the
first digit is 0, which indicates that the base is 8. For using base
16, one needs to start a representation with either 0x or 0X. Note
that the hexdecimal digits of values from 10 to 15 are represented as
letters *a*, *b*, *c*, *d*, *e*, and *f*, respectively. And the
uppercase of each of these six letters can be used as well. Please
find some integer representations as follows:

- <code>01234567</code>
- <code>123456789</code>
- <code>0xdeadbeef</code>

### Bools

The two boolean values are written as *true* and *false*. In the statics,
one can write *tt* and *ff* for *true* and *false*, respectively.

### Chars

A char-value in ATS3 can essentially be written in the
same way as in C. Please find some examples of char-values
as follows:

- <code>'a'</code>
- <code>'\n'</code>
- <code>'\123'</code>

### Floats

A float-value in ATS3 can essentially be written in the same way as
in C. Please find some examples of float-values as follows:

- <code>0.01</code>
- <code>1E-2</code>
- <code>1000</code>
- <code>1.0E3</code>
- <code>3.1415926</code>
  
### Strings

A string in ATS3 can essentially be written in the same way as in C.
Please find some examples of string constants as follows:

- <code>"abcde"</code>
- <code>"\\"abcde\\""</code>
- <code>"Hello, world!\\n"</code>

Keywords
--------

ATS3 supports a rich set of programming features, making use of
quite a few keywords.

The following keywords are for forming expressions:

- <code>$addr</code>:
  for taking the address of a left-value. As an example,
  `$addr(x0)` refers to the address of some variable `x0`, which
  is often written as `&x0` in C. One can also write `&` for `$addr`.
- <code>$eval</code>:
  for evaluating expressions of specific type. For instance,
  `$eval(x0)` returns the value stored at a given address `x0`;
  `$eval(xs)` forces the evaluation of a lazy-value `xs` (representing
  some suspended computation); etc. One can also write `!` for `$eval`.
- <code>$fold</code>:
  for folding an unfolded value of some linear datatype (i.e., datavtype).
  This is a new concept in ATS3, which does not have a counterpart in commonly
  used programming languages.
- <code>$free</code>:
  for freeing an unfolded value of some linear datatype (i.e., datavtype).
  This is a new concept in ATS3, which does not have a counterpart in commonly
  used programming languages.
- <code>$lazy</code>:
  for forming a lazy-value (representing suspended computation). Note that ATS3
  is a call-by-value language that supports lazy-evaluation.
- <code>$llazy</code>:
  for forming a linear lazy-value (representing suspended computation). Linear
  lazy-evaluation is an extremely useful feature in ATS3, which seems to have not
  been supported elsewhere.
- <code>$raise</code>:
  for raising a run-time exception (which may be caught by a handler). ATS3 supports
  the use of exceptions for altering control-flow in program execution.
- <code>$tup</code>:
  for forming a boxed tuple. Note that $tup is resolved to either $tup_t or $tup_vt.
- <code>$tup_t</code>: for forming a boxed tuple containing no linear components.
- <code>$tup_vt</code>:
  for forming a boxed tuple that may contain linear components. The formed tuple is
  linear even if there are no linear components in it.
  
Some of the commonly used keywords for forming declarations are listed as follows:

- <code>fun</code>: for
  introducing a function-declaration (or fun-declaration for short).
  Some of its variants are: `fn`, `fn0`, `fn1`, and `fnx`.
- <code>val</code>
  for introduction a value-declaration (or val-declaration for short).
  Some of its variants are: `val+` and `val-`.
- <code>var</code>
  for introduction a variable-declaration (or var-declaration for short).
- <code>stacst</code>: for introducing a static constant of some (predicative) sort.
- <code>sexpdef</code>: for introducing a name for a static expression (of any sort).
- <code>typedef</code>:
  for introducing a name for a static expression of some (impredicative) sort (such as
  types, props, and views).

Identifiers
-----------

An identifer is a non-empty sequence of chars such that the first char
is a letter and the rest are either letters or digits, where a letter
is either from the English alphabet or equals `_` (underscore), `'`
(apostrophe) or `$` (dollar sign). Note that neither the char `'` nor
the char `$` can appear as the first letter of an identifier.  Please
find some examples of indentifiers as follows:

- <code>xyz</code>
- <code>xyz'</code>
- <code>x1yz</code>
- <code>xyz1</code>
- <code>\_X'Y'Z\_</code>
- <code>some_variable</code>
- <code>\_$some$variable\_</code>

There may be restrictions to be imposed on the use of the char `$` in
an identifier.

Fixity Delarations
------------------

ATS3 supports prefix, infix, and postfix operators.

### Infix-declarations

An infix operator is binary and it may be non-associative,
left-associative or right-associative. Such an operator is supposed to
be placed between its two arguments. The keywords `#infix`, `#infixl`,
and `#infixr` are for initiating infix-declarations. Also, `#infix0` is
the same as `#infix`. Please find some examples of infix-declarations as
follows:

- #infixl + -
- #infixl * /
- #infix0 < > of 40
- #infix0 = != of 30

These declarations state that `+` and `-` are left-associative infix
operators; `*` and `/` are right-associative infix operators; `<` and
`>` are non-associative operations of precedence value 40; and `=` and
`!=` are non-associative operations of precedence value 30.

### Prefix-declarations

A prefix operator is unary and it is supposed to be placed immediately
before its argument. The keyword `#prefix` is for initiating
prefix-declarations. Some examples of prefix-declarations are given as follows:

- `#prefix -` 
- `#prefix ~ of 51` 
- `#prefix @ of 71` 

Note that `~` is hereby given a precedence value of 51 and `@` a
precedence value of 71. The default precedence value for `-` is `0`.
  
### Postfix-declarations

A postfix operator is unary and it is supposed to be placed
immediately after its argument. The keyword `#postfix` is for
initiating postfix-declarations. Here is a postfix-declaration:

- `#postfix sz of 99`

For instance, one may interpret `sz` as a cast operator from 32-bit
int-values to 64-bit size-values.
  
### Nonfix-declarations

A nonfix-declaration is introduced to remove the fixity status
previously assigned to an identifier.  The keyword `#nonfix` is for
initiating nonfix-declarations. For instance, the following
declarations removes the fixity status of the identifiers following
the keyword `#nonfix`:

- `#nonfix foo`
- `#nonfix bar baz`

Static Expressions
------------------

There are many forms of static expressions in ATS3.

Dynamic Expressions
------------------

There are many forms of dynamic expressions in ATS3.  A dynamic
expression is atomic if it cannot result in parsing ambiguities when
put in any contexts.

### Let-expressions

Let-expressions are atomic.
A let-expression starts with the keyword `let` and ends with the
keyword `end` (or `endlet` if one likes); what is between these two
keywords consists of a sequence of declarations and a sequence of
dynamic expressions, which are separated by the keyword `in`. Please
find some examples of let-expressions as follows:

```
let
val x = 1
fun f(y:int): int = x + y in f(x) * f(x+1) endlet
```

```
let
val PI = 3.14
fun
area
(rad: double): double = PI * rad * rad in area(10.0)
end
```

### Try-expressions

Try-expressions are atomic.
A try-expression starts with the keyword `try` and ends with the
keyword `end` (or `endtry` if one likes); what is between these two
keywords consists of a dynamic expression and a sequence of pattern
matching clauses, which are separated by the keyword `with`. Please
find some examples of try-expressions as follows:

```
try
let
val () = loop(xs) in true
endlet
with
| ~TRUE() => true | ~FALSE() => false
endtry
```

```
try auxlst(xs); false with ~TRUE() => true end
```

### Lazy-expressions

A lazy expression starts with the keyword `$lazy` followed by an
atomic expression.

### Llazy-expressions

A llazy (that is, linearly lazy) expression starts with the keyword
`$llazy` followed by an atomic expression such that the atomic expression
represents a sequence of expressions where the last one is the suspended
computation and those before the last one are for freeing the resources contained
in the suspended computation.


Static Declarations
-------------------

### Stacst-Delarations

### Staexp-Delarations

Dynamic Declarations
--------------------

### Value-Delarations

### Variable-Delarations

### Function Delarations

In ATS3, there are (regular) functions and there are function
templates.  We often use the word `function` to refer to either a
regular function (that is not a template) or a function template.

Here is an example of a function declaration:

```
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
```

Here is an example of a function template declaration:

```
fun
<a:type>
length(xs: list(a)): int =
(
  case xs of
  | list_nil() => 0
  | list_cons(_, xs) => 1 + length(xs)
)
```

For those familiar with ATS2 (i.e., ATS/Postiats), please note that
the syntax `<a:type>` (following the keyword `fun`) corresponds to the
syntax `{a:t@ype}` in ATS2.

Implement-Delarations
---------------------

An implement-declaration implements a previously declared dynamic constant.
For instance, the following declaration introduces a name `fact` for a function
of the type `int -> int`:

```
fun fact(x: int): int
```

The name `fact` is not associated with a definition at the point where
it is declared. Instead, an implement-declaration for `fact` can be given
elsewhere as follows:

  
```
implfun
fact(x) =
if x > 0 then x * fact(x-1) else 1
```

## Documenting, Documenting, Documenting, ...

ATS3 is a feature-rich programming language, and its concrete syntax
is large and complex. I expect that the process of documenting ATS3
will be going on for quite a long time. Please contribute amply and
generously to this process.
