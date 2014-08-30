-- Explores `succ` on an enumerated type.

-- Conclusion: it doesn't wrap on the max bound.

-- I wonder if there is a way to make it do that?

data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday
           deriving (Show, Enum)

-- E.G.
-- ghci> succ Friday 
-- Saturday
-- ghci> succ Saturday 
-- *** Exception: succ{Day}: tried to take `succ' of last tag in enumeration
