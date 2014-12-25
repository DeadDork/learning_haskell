-- I was having with a length function in a different program, testing it out
-- here.

-- Conclusion: `let` is scoped. Keep in mind that `do` notation & the monadic
-- functions can be decomposed into deepening nesting of case expressions.
-- Let expressions in these expressions would be scoped, thereby making it
-- impossible to declare an exhaustive case & non-exhaustive case for a
-- recursive algorithm that's not in one statement.

data Stack a = Empty | a `Cons` (Stack a) deriving (Eq, Ord, Read, Show)

length1 :: Stack a -> Int
length1 Empty = 0
length1 (x `Cons` xs) = 1 + length1 xs

f :: Stack a -> Maybe Int
f xs = do
  -- Pattern matching, iteration 1: Fails {
  -- let length2 Empty = 0
  -- let length2 (a `Cons` as) = 1 + length2 as
  -- }
  -- Pattern matching, iteration 2: Fails {
  -- let length2 (a `Cons` as) = 1 + length2 as
  -- let length2 Empty = 0
  -- }
  -- let len = length1 xs -- works (control)
  let length2 as = case as of
                        Empty         -> 0
                        (_ `Cons` bs) -> 1 + length2 bs -- works
  let len = length2 xs
  if len == 0
     then Nothing
     else Just len

-- E.G. (Same error for both iterations):
-- *Main> :l length_1.hs
-- [1 of 1] Compiling Main             ( length_1.hs, interpreted )
-- Ok, modules loaded: Main.
-- *Main> let xs = 1 `Cons` (2 `Cons` (3 `Cons` Empty))
-- *Main> f xs
-- *** Exception: length_1.hs:13:7-44: Non-exhaustive patterns in function length2
