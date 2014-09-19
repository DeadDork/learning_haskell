-- Explores variables in a where clause.

-- Conclusion: variables in the where clause are pattern matched.

f x y = g y x
    where g x y = x / y

-- ghci> f 1 2
-- 2.0
-- ghci> f 2 1
-- 0.5
