---
layout: post
title:  "Functional hardware"
date:   2016-02-28 13:37:00
categories: programming
---

Programming FPGA using Haskell
==============================

Here is very short introduction to functional programming language
[Haskel](https://www.haskell.org/) and functional reasoning. For this we
will use [CλaSH](http://www.clash-lang.org/) compiler, that is extension
of Haskell language being able to convert large set of Haskell code in
either VHLD, Verilog or SystemVerilog for now. Installation instructions
are available in [hackage
doc](http://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Tutorial.html#g:2).

If you need just quick peek in examples, there is [source
code](https://github.com/ra1u/clash-tutorial/tree/master/src) available
of all examples presented here and is compiled in VHLD, Verilog and
SystemVerilog. Code is automatically generated, but can be used as quick
check of what kind of circuit code describes and what to expect from
CλaSH compiler.

Premise is that circuits described functional way are considered simpler
to reason about, compose and reuse. We are able to describe topology
trough functional composition on abstract way without sacrificing about
reasoning, how may registries are in use and where logic gates are. This
approach allows describing similar if not same circuits as with Verilog
and VHDL using new and fresh approach allowing composing more ambitious
synchronous digital circuits.

Descriptions is mathematical in way that is trying to use tools from
mathematical theory about composition. It is common to see relations
described with mathematical laws.

Function application
====================

Before running coding we should explain how calling functions in Haskell works.
In most languages if function takes 2 arguments `x` and `y` it is called
like `f(x,y)` where equivalent for this in Haskell is `f\ x\ y` . This
come with advantage because Haskell supports partially applied functions
where only one out of two arguments is applied. Lets say that signature
of `f` is `Int -> Int -> Bool`. We can interpret this as - it takes two
integers `x` an `y` and it returns boolean. When only first argument `x`
is applied it returns function whit hremaining signature. When applying
on function `Int -> Int -> Bool` first `Int` remaining is `Int -> Bool`.
That is function that takes `Int` and it returns `Bool`.

    -- function of 2 Int, that telse if 
    -- 1st argument is greater then 2nd
    greater :: Int -> Int -> Bool 
    greater x y = x > y

    -- takes y and tels whatever it is greater than 2 
    isgt2 :: Int -> Bool 
    isgt2 y = greater 2 y


or less verbose as partially applied

    isgt2 :: Int -> Bool
    isgt2 = greater 2

One way to think about functions in Haskell is that each function takes
only one argument and it returns one value that can be function.
Signature of `greater` can be seen as
`greater :: Int -> ( Int -> Bool )`. So it takes an `Int` and it returns
function `Int -> Bool`. That is function that takes `Int` and returns
`Bool`.

In Haskell every function returns something. Pure functions, does not
execute any action, but just transform input data and return relevant
result. Pure functions, has important property that they always returns
same output for same input and so they don't have access to some
external time changing data or internal state. In Haskell there is
strong force to separate effects from pure functions.

Function composition
====================

Functional programming is about composition. Here it is example of
signatures of 2 functions.

    funcA2B :: a -> b
    funcB2C :: b -> c

`funcA2B` is function that takes type `a` and returns `b`, one example
is that it takes `Int` and returns `Bool`.`funcB2C` takes `b` and it
returns `c`. For example it takes `Bool` and returns `Bool`. Having this
we are able to create function

    funcA2C :: a -> c

by composing together `funcA2B` and `funcB2C` to get `funcA2C`.

For composing two functions we need function

    composeFunc :: (b->c) -> (a->b) -> a -> c
    composeFunc f g x = f (g x)

First we apply `x` on `g` and then we apply result on `f`.\
Moving back to `composeFunc` it takes 3 arguments. First two are
functions, `f` with signature `b->c` and `g` with signature `a->b`, 3rd
param `x` is of type `a`. Function returns type `c` and is same type
that `f` returns. Looking differently it takes two functions that is
`b->c` and `a->b` and it returns function `a -> c`.

For example

    minus1 x = x - 1
    largeNum x = x > 3

    superLargeNum = composeFunc largeNum minus1

`superLargeNum` is function composed by `largeNum` and `minus1`.Type of
each function is well defined, but we can either define it manually or
compiler can automatically deduce it.

    -- simplified types
    minus1 :: a -> a
    largeNum :: a -> Bool
    superLargeNum :: a -> Bool 

    -- actual types
    minus1 :: Num a => a -> a
    largeNum :: (Num a, Ord a) => a -> Bool
    superLargeNum :: (Num a, Ord a) => a -> Bool

We can read this, that function `superLargeNum` transforms type `a` into
`Bool`. Type `a` has to be defined for class `Num` and `Ord`. `Num` is
class that has defined function `(-)` as minus operator. (among others)
and class `Ord` has defined `(>)`.

`composeFunc` is commonly used and in Haskell it is defined as operator
`(.)`.

    (.) = composeFunc

Using this, one can alternatively define `superLargeNum` as

    superLargeNum = largeNum . minus1
    -- or 
    superLargeNum = (> 3) . (- 1) 
    -- or
    superLargeNum x = (x - 1) > 3

Operator `.` comes from function composition as defined in mathematics f
∘ g . Here we have showed implemention of `.` as in `composeFunc`, but
sometimes instead of implementation we get only laws. For function `(.)`
holds.

If `id` is identity function that returns argument

    id :: a -> a
    id x = x

then function composition laws for ∘ are

    id . f == f . id == f
    f . g . h == (f . g) . h == f . (g . h)

Instead of having function implementation available we sometimes have
available laws that function obeys. It helps reasoning about how
function behaves without knowing what it does. Laws also goes hand to
hand with implementation.

Functor
=======

Lets take for example type in CλaSH called `Signal a`. This represent
type `a` changing with clock. `Signal` is concrete example of functor
and `a` is type embedded in `Signal`.

Other than function composition of `Signal a` there is different
composition available for functor.

    funcA2B :: a -> b
    signalA :: Signal a

If we have function of type `a -> b` and `Signal a`, than functor
enables us to get `Signal b`

    fmap :: (a -> b) -> Signal a -> Signal b

Functor obeys two laws

    fmap id == id
    fmap (p . q) == (fmap p) . (fmap q)

Or equivalently when applying signal.

    fmap id signal == signal
    fmap (p . q) signal == fmap p (fmap q signal)

Knowing this we can aswer next question. Does `fmap` over `Signal` uses
any registries as for example D flip-flop?

Answer is, if that would be case, neither of laws would hold. Form first
law it would imply that on left we have signal delayed by 1 clock, and
on right non delayed signal and they are not same. Second law would
imply delay by 1 clock on left where right side made 2 delays, each by
one `fmap` calls.

To generate core we define function `topEntity`. Generic type `a` should
be concrete and in this case we will use `Signed 7` what is 7 bit signed
integer.

    topEntity :: Signal (Signed 7) -> Signal Bool
    topEntity signal = fmap superLargeNum signal 

Executing command fmap can be used as operator. That is `<$>`.
Alternatively we can implement topEntity also as

    topEntity signal = superLargeNum <$> signal
    -- or point free version
    topEntity = fmap superLargeNum
    -- or using fmap as operator
    topEntity = superLargeNum `fmap` signal

It is hard to tell witch version is most common among haskellers, but we
can be sure, that due to laws all of them behaves same.

Compiling this exact into Verilog generates code as expected.

Mealy machinery
===============

For generating output based on previous stored value we can use
[`mealy`](http://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Prelude-Mealy.html#v:mealy)
function. Lets implement integrator using mealy machine. With integrator
we have in mind function that takes `Signal a` and produces `Signal a`
and is representing sum of all previous values including current.

    integrator signal = mealy mf 0 signal
        where 
            mf state input = (nextstate,output)
                where
                    nextstate = state + input
                    output = nextstate

[`mealy`](http://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Prelude-Mealy.html#v:mealy)
is function that takes 3 arguments. First parameter is a function on how
to generate next state from state and signal value. Signature of this
function is `s -> i -> (s,o)`. In our code that is function called `mf`.
`mf` is defined in `where` block for local visibility so can not be used
out of\
`integrator` . What this `mf` function does it takes 2 arguments `state`
and `input` and it returns tuple `(nextstate,output)`. Next clock cycle
`nextstate` will be passed again in `mf` as argument `state`. 2nd
argument of integrator `0` is initial state value. Generated core will
provide reset signal that sets state to initial value.

If we now need to create FPGA core, we need to provide `topEntity`. Here
it is full source instantiated with Fixed point arithmetics. We
arbitrarily choose `SFixed 2 8`, This is 10 bit signed fixed point
number. It is representing rational numbers from -2 &lt;= x &lt; 2.

    module Integrator where
    import CLaSH.Prelude

    integrator signal = mealy mf 0 signal
        where 
            mf state input = (nextstate,output)
                where
                    nextstate = state + input
                    output = nextstate

    topEntity :: Signal (SFixed 2 8) -> Signal (SFixed 2 8)
    topEntity = integrator

`integrator` can be used in other modules, to build larger and more
ambitious circuits. For example to make integrator of integrated signal
so that output of first integrator is feed in second one.

    intInt = integrator . integrator

Vector
======

[`Vec`](https://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Sized-Vector.html)
is sized vector with compile type defined size holding elements of same
type. It is similar to tuple, except that all elements are of same type.

`Vec 5 (Signed 7)` is type that holds 5 elements of type `Signed 7` what
is 7 bit signed number. `Vec` is also an functor.

For example

    vs :: Vec 6 (Signed 9)
    vs = 1 :> 2 :> 3 :> 4 :> 5 :> 6 :> Nil

    vb :: Vec 6 Bool
    vb = fmap (> 3) vs  -- that is <False,False,False,True,True,True>

Operator `:>` is right-associativity operator that prepends vector on
right with value on left. `Nil` is empty vector and is used, because
`:>` expects vector on right side.

Size of `Vec` is defined at compile time and can be generic. Lets take
look on one of many functions from `Vec` libraray that is
[`replicate`](https://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Sized-Vector.html#v:replicate)
and has prototype

    replicate :: SNat n -> a -> Vec n a
    -- "replicate n a" returns a vector that has `n` copies of `a`.

`Vec 5 a` is not same as `Vec 6 a` and it means that `replicate` returns
different type based on argument `n`. For this to work, `n` is of type
`SNat x` and is different type for each x. Value that has type
`Signed 5` as 5 bit signed value can be -2 or 7, where value `d3` that
has type `SNat 3` represents number 3 as unique type.

Moving average
==============

Moving average is simple low pass FIR filter expressed as sum of last
`n` values. We will deliberately skip division in our example, so we
will in reality talk about moving sum.

Here is straight forward and naive option to describe moving average
using
[`mealy`](http://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Prelude-Mealy.html#v:mealy).

    movingAvarage n signal = mealy mf (replicate n 0) signal
        where
            mf state input = (nexts,output)
                where 
                    nexts = input :> init state
                    output = fold (+) nexts

First argument `n` is number of accumulated value is also size of Vec
used as internal state storage. Type of internal state is deduced as
`Vec n a` and is deduced from type of initial state value
`replicate n 0` that returns `Vec` that returns `n` copies of 0.

[`init :: Vec (n + 1) a -> Vec n a`](https://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Sized-Vector.html#v:init)
is function that takes `Vec` with size `n+1` and returns all except last
element that is `Vec` of size `n`.

`nexts` expressed as next state is vector right shifted by previous
value and perpended `:>` with current clock `input` value. Operation
works as fifo shift register.

`fold` is function best expressed with same picture as in
[`manuals`](https://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Sized-Vector.html#v:fold)

From signature we can conclude that
`fold :: (a -> a -> a) -> Vec (n + 1) a -> a` takes 2 arguments. First
is function of type `(a -> a -> a)` an second argument is of type
`Vec (n + 1) a`. Function is than applied over vector in tree like
structure, enabling minimum latency.\
![fold over vector](/data/fold.svg)

Function f from out case is function `(+)` (in haskell operator in
brakets is used as function). and has prototype `a -> a -> a` and is
applied over `state`.

There is better
===============

Lets try some optimization of moving average from previous section.
Observing totals we can conclude we don't need that many adders. Total
output is changed at each clock only by value that enters fifo from one
side and value that pops out of fifo on other. At each clock we need to
subtract value that pops out and add value that enters from total. This
comes at expanse of 2 extra sized registers (previous solution can be
reduced by 1 sized register) but requires only 2 sized adders.

    movingAvarage2 n signal = mealy mf ((replicate n 0),0) signal
        where
            mf (vec,total) input = ((nextVec,nextTot),output)
                where 
                    output = total + input - (last vec)
                    nextVec = input :> init vec
                    nextTot = output

`mf` has at this point signature `(Vec n a,a) -> a -> ((Vec n a,a),a)`.
Internal state type is tuple where first value is `vec` used as fifo and
`total accumulated in fifp.`vec`and`total`are unpacked from tuple in input argument,  so we are able to access this value, without unpacking them in body. Equivalent, but more verbose`mf\`
implemetaion is sketched as

    mf state input = ...
        where 
            vec = fst state -- first element of tuple
            total = snd state -- second element of tuple
            output = ...

Circuit composition
===================

Great power of composition comes from separating logic into reusable
parts and then composing them together in larger blocks. Function `(.)`
and `fold` are good examples we have used so far. Now lets try something
similar, by designing feedback loop.

              +---+    +---+
    input -->-| f |-->-| g |-->-+-->-- output 
              +---+    +---+    |
                |               ∨
                ∧      +---+    |
                +----<-| h |-<--+
                       +---+     

First lets figure out prototypes of each function `f`, `g` and `h`.

    f :: Signal a -> Signal b -> Signal c
    g :: Signal c -> Signal d
    h :: Signal d -> Signal b

and feedback loop can be written directly from circuit diagram as

    feedbackLoop :: (Signal a -> Signal b -> Signal c) 
                    -> (Signal c -> Signal d)
                    -> (Signal d -> Signal b)
                    -> Signal a 
                    -> Signal d
    feedbackLoop f g h input = out where
        out = g fout
        fout = f input (h out)

If user has available functions that works over primitive values like
`Signed` instead `Signal (Signed 16)` for example, he can use `fold`.
For example if

    g :: Signed 16 -> Signed 16

Then `gs` working over signal would be constructed from `g`

    gs :: Signal (Signed 16) -> Signal (Signed 16) 
    gs = fmap g
    -- or more verbose
    gs sig = fmap g sig

For function over 2 input arguments we can use library function liftA2

    liftA2 :: (a -> b -> c) -> functor a -> functor b -> functor c

Where `functor` is in our example `Signal` For example to get function
minus `(-)` to operate over `Signal` we need to apply `liftA2`.

    signalMinus :: Signal a -> Signal a -> Signal a
    signalMinus = liftA2 (-)

To construct negative feedback looking like

                       +---+
    input -->-( - )-->-| g |-->-+-->-- output 
                |      +---+    |
                ∧               ∨ 
                +--------<------+
                        

Using `feedbackLoop`,

    negativeFeedback :: Num a => 
                        (Signal a -> Signal a) -> 
                        Signal a ->
                        Signal a
    negativeFeedback g = feedbackLoop (liftA2 (-)) g id

We have replaced `h` by `id` and `f` argument is `liftA2 (-)`

There is subtle issue with this and in some cases this circuit can not
be synthesized. That is because we have feedback loop, so we have made
sure that there is delay in g function. If `g` function is for example
`id` or `fmap id` so it works like wire this circuit is not stable any
more. To overcome this, we have to introduce delay in feedback. Function
`h` from previous diagram, becomes `register 0` instead of `id`.
function

    negativeFeedback :: Num a => (Signal a -> Signal a) -> Signal a -> Signal a
    negativeFeedback g = feedbackLoop (liftA2 (-)) g (register 0)

[`register` :: a -&gt; Signal a -&gt; Signal
a](http://hackage.haskell.org/package/clash-prelude/docs/CLaSH-Signal.html#v:register)
is a function, that takes inital value, that outputs this value before
remaining of stream. `register` is available in CλaSH libraray, but can
be implemented using `mealy` as

    register initialValue signal = mealy mf initialValue 
        where 
            mf prevS input = (input,prevS)

What is even more surprising is that it can be done even vice versa.
That is `mealey` can be expressed in terms of `register`. For details
check examples on
[github](https://github.com/ra1u/clash-tutorial/tree/master/src)

Conclusion
==========

There are lot of features that were no covered. But are invaluable
during development

-   repl, (read eval print loop) that allows interactive development,
    type deduction
-   ability to simulate in repl or compile in CPU native executable
-   testebenches that generates VHDL / Verilog / Systemverilog and can
    be used directly in IDE
-   full featured library, (ram and rom access and initalisation,
    multiple clock domains, type safe delays ... )

From my and experience of many it takes lot of time and practice to
grasp new programming language, what Haskell for those not familiar with
functional programming certainly is. Reader with interest will be able
to find lot of free resources available online for all levels of
experience with open and active community.
