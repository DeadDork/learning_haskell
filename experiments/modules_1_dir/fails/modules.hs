module A where
  f :: IO ()
  f = print "Hello awesome place"

module B where
  f :: IO ()
  f = print "Goodbye sucky place"

module Main where
  import A
  import B

  main :: IO ()
  main = A.f >> B.f
