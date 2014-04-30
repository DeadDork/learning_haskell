import qualified Data.Map as Map

data LockerState = Taken | Available deriving (Eq, Show)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber lockerMap =
    case Map.lookup lockerNumber lockerMap of
        Nothing -> Left $ "Locker " ++ show lockerNumber ++ " not in map"
        Just (state,code) -> if state == Taken
                                then Left $ "Locker " ++ show lockerNumber ++ " not available"
                                else Right code

lockers :: LockerMap
lockers = Map.fromList   
    [(100,(Taken,"ZD39I"))  
    ,(101,(Available,"JAH3I"))  
    ,(103,(Available,"IQSA9"))  
    ,(105,(Available,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))  
    ]
