class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno Nothing  = False
    yesno (Just _) = True

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)
instance YesNo (Tree a) where
    yesno EmptyTree = False
    yesno _         = True

data TrafficLight = Red | Yellow | Green deriving (Show, Read, Eq, Ord)
instance YesNo TrafficLight where
    yesno Red = False
    yesno _   = True

-- Tests:
-- ghci> yesno $ length []  
-- False
-- ghci> yesno "haha" 
-- True
-- ghci> yesno "" 
-- False
-- ghci> yesno $ Just 0  
-- True
-- ghci> yesno True 
-- True
-- ghci> yesno EmptyTree 
-- False
-- ghci> yesno [] 
-- False
-- ghci> yesno [0,0,0]
-- True
-- ghci> :t yesno 
-- yesno :: YesNo a => a -> Bool
