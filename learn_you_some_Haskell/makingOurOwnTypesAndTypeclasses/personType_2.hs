data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)

-- The above data form automatically creates functions for returning the value
-- constructors, e.g.
--
-- ghci> let guy = Person { firstName = "Joe", lastName = "Blow", age = 17, height = 182, phoneNumber = "(650) 577-3157", flavor = "Chocolate" }
-- ghci> firstName guy
-- "Joe"
