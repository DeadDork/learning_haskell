-- I'll have to take a look at the Haskell report to see how test1 desugars.
-- Conclusion: it doesn't desugar into test2.

module LetTest
  ( test1
  --, test2 ) where
  ) where

  -- Analyzes how the `let in` expression desugars.
  test1 :: Int
  test1 =
    let a = 3
        b = a + 1
        c = d + 3
        d = 2
     in a + b + c + d

  {-
  -- Analyzes how the `let in` expression chains.
  -- Fails.
  test2 =
    let a = 3 in
    let b = a + 1 in
    let c = d + 3 in -- not in scope
    let d = 2
     in a + b + c + d
  -}
