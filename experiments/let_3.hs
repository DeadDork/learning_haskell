-- Demonstrates `let` scoping in do expressions using just the Haskell kernel.

import Control.Applicative

data MyMaybe a = MyNothing | MyJust a deriving (Show)

instance Functor MyMaybe where
  fmap _ MyNothing = MyNothing
  fmap f (MyJust x) = MyJust (f x)

instance Applicative MyMaybe where
  pure = MyJust
  MyJust f <*> MyJust a = MyJust (f a)
  _ <*> _ = MyNothing

instance Monad MyMaybe where
  return = MyJust
  MyNothing >>= _ = MyNothing
  MyJust x >>= f = f x

test :: MyMaybe Int -> MyMaybe Int
test a = a >>= (\ x -> MyJust (3 + x))
           >>= (\ x -> MyJust (2 * x))

letScope1 :: MyMaybe Int -> MyMaybe Int
letScope1 a = do
  i <- a
  let x = 7
  let y = 2
  return (i + x + y)

letScope2 :: MyMaybe Int -> MyMaybe Int
letScope2 a =
  let f i = let x = 7 in let y = 2 in return $ i + x + y
   in a >>= f
