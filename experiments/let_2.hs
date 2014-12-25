-- Explores the scope of `let` in a monad.

-- Conclusion: indeed, just as I would have thought, monads have nested scopes.
-- I could probably demonstrate this by writing it longhand.

f :: IO ()
f = do
  let x = 3
  print x
  let x = 6
  print x
  let y = 1
  let z = y
  print z
  let b = a -- not in scope
  print b
  let a = 5
  print a
