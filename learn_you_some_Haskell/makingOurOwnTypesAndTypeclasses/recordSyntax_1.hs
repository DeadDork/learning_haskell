-- Explores the use of record syntax in a type declaration.

-- Conclusion: huh, this works!

data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)
