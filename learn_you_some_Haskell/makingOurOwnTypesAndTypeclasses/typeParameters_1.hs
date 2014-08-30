-- Tests Nothing

-- (In hindsight, this is a stupid test. I originally wanted to test Nothing's
-- polymorphic qualities. Then they became obvious.)

test :: Maybe Int -> String
test Nothing = "Nothing"
test _ = "Something"
