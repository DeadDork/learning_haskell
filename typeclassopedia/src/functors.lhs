Functors
========

Solutions to 3.2
----------------

NB  Because many of these instances are already defined in the Prelude,
    I am purposefully hiding them.

>   import Prelude hiding (Either,Left,Right)

1.  Implement Functor instances for `Either e`

>   data Either l r = Left l | Right r
>
>   instance Functor (Either a) where
>       fmap _ (Left l) = Left l
>       fmap f (Right r) = Right $ f r

    and `((->) e)`

>   newtype Function a b = Function (a -> b)
>
>   instance Functor (Function a) where
>       fmap f (Function g) = Function $ f . g

PS  I finally understand the `((->) r)` functor.

    First, like `2 + 3` can be rewritten as `(+) 2 3`, so, too, can infix type
    constructors be rewritten in prefix form. Specifically, `(a -> b)` can be
    rewritten as `((->) a b`.
    
    Second, recall that `fmap :: (a -> b) -> f a -> f b`. As such, the type of
    `fmap` in the case of the `((->) r` functor will be
    `fmap :: (a -> b) -> ((->) r) a -> ((->) r) b`, which is equivalent to
    `fmap :: (a -> b) -> (r -> a) -> (r -> b)`. In other words, what `fmap`
    does in the `((->) r)` functor is take two functions, `(a -> b)` &
    `(r -> a)`, and combines them so that they produce a third function
    `(r -> b)`. The only way to do this is by taking a value of type `r`,
    running it through a unary function that spits out a value of type `a`,
    then running that output through a unary function that spits out a value of
    type `b`. In other words, function composition!

2.  Implement Functor instances for `((,) e)` and for `Pair`, defined as

    ```Haskell
    data Pair a = Pair a a
    ```

    Explain their similarities and differences.

    For greater clarity, I am going to rewrite `((,) e)`:

>   data Pair1 a b = Pair1 a b

    As such, the Functor instance is:

>   instance Functor (Pair1 a) where
>       fmap f (Pair1 a b) = Pair1 a (f b)

    The other instance:

>   data Pair2 a = Pair2 a a
>
>   instance Functor Pair2 where
>       fmap f (Pair2 a b) = Pair2 (f a) (f b)

    The differences are pretty obvious: `Pair1` has a type constructor that
    takes two concrete types, while `Pair2` has a type constructore that only
    takes one concrete type. As such, the former's `fmap` only applies a
    function to the second value, while the latter's applies it to both values.

    This can be made even more apparent with a third `Pair`:

>   data Pair3 a b = Pair3 a a b b b
>
>   instance Functor (Pair3 a) where
>       fmap f (Pair3 a b c d e) = Pair3 a b (f c) (f d) (f e)

3.  Implement a Functor instance for the type `ITree`, defined as

    ```Haskell
    data ITree a = Leaf (Int -> a) 
                 | Node [ITree a]
    ```

>   data ITree a = Leaf (Int -> a) | Node [ITree a]
>
>   instance Functor ITree where
>       fmap f (Leaf g) = Leaf $ f . g
>       fmap f (Node xs) = Node $ map (fmap f) xs

    This is a weird one. You can only apply the function to a leaf. As such,
    if the given ITree is a node, you have to map `fmap f` on the list of
    `ITree a` recursively until you reach a leaf to apply `f`.

4.  Give an example of a type of kind `* -> *` which cannot be made an instance
    of Functor (without using undefined).

    I found it surprisingly difficult to come up with such an example. I
    Googled this question, and found the following rife on GitHub:

>   data NotFunctor a = NotFunctor (a -> Int)

    First, `NotFunctor a` can be thought of as a function that takes any type
    and returns an `Int`.

    Second, recall that `fmap :: (a -> b) -> f a -> f b`.

    As such, there is no function that can take a `(a -> b)` and a `f a`
    and return a `f b` when `f` is `((->) a Int`, as doing so would require
    extracting `a` from `f a`, and it's impossible to do so from the type
    alone.

    To illustrate:

    ```Haskell
    instance Functor NotFunctor where
        fmap f (NotFunctor g) = ?
    ```

    The type of `g` is `g :: NotFunctor (a -> Int)`. To `fmap f` over
    `NotFunctor g`, you would need to be able to produce `NotFunctor h`, such
    that it is of type `h :: NotFunctor (b -> Int)`. To do this, you would have
    to extract `a` from `NotFunctor (a -> Int)`, and that's impossible so long
    as all you know about `g` is it's type.

5.  Is this statement true or false?

    *The composition of two Functors is also a Functor.*

    If false, give a counterexample; if true, prove it by exhibiting some
    appropriate Haskell code.

    This certain *seems* true. Just think about it: given two functors, you
    can `fmap` `fmap f` on to the composed functor, and thus the composed
    functor is itself a functor.

>   newtype Compose f g a = Compose { unCompose :: f (g a) }
>
>   instance (Functor f, Functor g) => Functor (Compose f g) where
>       fmap f = Compose . (fmap . fmap $ f) . unCompose
