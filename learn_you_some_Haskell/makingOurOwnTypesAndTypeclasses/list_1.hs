data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

-- How about that:
-- ghci> Empty
-- Empty
-- ghci> 5 `C
-- Char  Cons
-- ghci> 5 `Cons` Empty
-- Cons 5 Empty
-- ghci> 4 `Cons` (5 `Cons` Empty)
-- Cons 4 (Cons 5 Empty)
-- ghci> 3 `Cons` (4 `Cons` (5 `Cons` Empty))
-- Cons 3 (Cons 4 (Cons 5 Empty))
