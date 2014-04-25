-- Works:
-- ghci> read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)

-- doesn't work
-- ghci> read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person
--data Person = Person { firstName :: String
--                     , lastName :: String
--                     , age :: Int
--                     } deriving (Eq, Show)
