data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq)

-- For example:
-- ghci> let guy1 = Person { firstName = "Joe", lastName = "Blow", age = 17 }
-- ghci> let guy2 = Person { firstName = "Joe", lastName = "Blow", age = 18 }
-- ghci> if guy1 == guy2 then "guy1 is the same as guy2!" else "guy2 is different..."
-- "guy2 is different..."
-- ghci> let guy2 = Person { firstName = "Joe", lastName = "Blow", age = 17 }
-- ghci> if guy1 == guy2 then "guy1 is the same as guy2!" else "guy2 is different..."
-- "guy1 is the same as guy2!"
