module Main where
  import A
  import B

  main :: IO ()
  main = A.f >> B.f
