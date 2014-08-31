-- Explores no-match case expressions.

-- Conclusion: case expressions are *very* flexible, such that non-exhaustive
-- patterns are allowed.

f :: Int -> Bool
f x = case x of
    1 -> True

-- E.G.
-- ghci> f 1
-- True
-- ghci> f 2
-- *** Exception: case_1.hs:(4,7)-(5,13): Non-exhaustive patterns in case
