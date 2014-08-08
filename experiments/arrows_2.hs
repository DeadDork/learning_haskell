-- Explores using arrows in a pure function.

-- Clearly I don't know the first thing about monads.

f :: String
f =
    let x =<< getContents
    in "String " ++ x
