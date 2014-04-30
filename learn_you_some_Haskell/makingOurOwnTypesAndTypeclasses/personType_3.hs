data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Show, Read, Eq)

-- Testing
-- ghci> read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person
-- Person {firstName = "Michael", lastName = "Diamond", age = 43}
