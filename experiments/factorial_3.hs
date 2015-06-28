-- Tests the NaturalNumbers module

-- Works!

module Factorial (fac) where
  import NaturalNumbers

  fac :: Natural -> Natural
  fac 1 = 1
  fac n = n * fac (n - 1)
