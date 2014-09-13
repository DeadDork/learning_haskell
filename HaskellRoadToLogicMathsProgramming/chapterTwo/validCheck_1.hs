-- A tests validity.

-- Very cool!

valid :: (Bool -> Bool) -> Bool
valid bf = (bf True) && (bf False)

excludedMiddle :: Bool -> Bool
excludedMiddle p = p || (not p)
