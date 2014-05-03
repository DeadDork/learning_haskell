class Tofu t where
    tofu :: j a -> t a j

data Frank a b = Frank {frankField :: b a} deriving (Show)

instance Tofu Frank where
    tofu x = Frank x

data Barry t k p = Barry { yabba :: p, dabba :: t k }

instance Functor (Barry a b) where
    fmap f (Barry {yabba = x, dabba = y}) = Barry {yabba = f x, dabba = y}

-- Tests:
-- ghci> :t Frank {frankField = Just "HAHA"}
-- Frank {frankField = Just "HAHA"} :: Frank [Char] Maybe
-- ghci> :t Frank {frankField = "YES"}
-- Frank {frankField = "YES"} :: Frank Char []
-- ghci> tofu (Just 'a') :: Frank Char Maybe
-- Frank {frankField = Just 'a'}
-- ghci> tofu ["HELLO"] :: Frank [Char] []
-- Frank {frankField = ["HELLO"]}
-- ghci> :k Barry  
-- Barry :: (* -> *) -> * -> * -> *
