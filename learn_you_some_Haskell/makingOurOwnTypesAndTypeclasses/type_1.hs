-- Explores type synonyms.

-- Conclusion: `type` creates a synonym, no more. If it actually created a new
-- type, then the example below would fail the type-check, as the two
-- variables are of different types.

type IntA = Int

-- E.G.
-- ghci> let x = 5 :: IntA
-- ghci> let y = 4 :: Int
-- ghci> x - y
-- 1
