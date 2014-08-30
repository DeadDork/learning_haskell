-- Just having fun with this.

import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockers :: LockerMap  
lockers = Map.fromList [ (100, (Taken,"ZD39I"))  
                       , (101, (Free,"JAH3I"))  
                       , (103, (Free,"IQSA9"))  
                       , (105, (Free,"QOTSA"))  
                       , (109, (Taken,"893JJ"))  
                       , (110, (Taken,"99292"))  
                       ]  

{- Version 1
lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lNumber lMap = case lNumber `Map.lookup` lMap of
    Nothing -> Left $ "Locker number " ++ show lNumber ++ " does not exist."
    Just (state, code) ->
        if state /= Taken
        then Right code
        else Left $ "Locker number " ++ show lNumber ++ "taken."
-}

{- Version 2
type Error = String

lockerLookup :: Int -> LockerMap -> Either Error Code
lockerLookup lNumber lMap = lLookup $ lNumber `Map.lookup` lMap

lLookup :: Maybe (LockerState, Code) -> Either Error Code
lLookup Nothing = Left $ "Locker number does not exist."
lLookup (Just (state, code)) = if state /= Taken
                               then Right code
                               else Left $ "Locker number taken"
-}

{- Version 3 -}
type Error = String

lockerLookup :: Int -> LockerMap -> Either Error Code
lockerLookup n m =
    let f Nothing = Left $ "Locker number " ++ show n ++ " does not exist."
        f (Just (s, c)) = g s c
        g Taken _ = Left $ "Locker number " ++ show n ++ " already taken."
        g Free c = Right c
    in f $ n `Map.lookup` m
