import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Eq, Show)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)
data Either' a b = Error a | Success b deriving (Show)

lockerLookup :: Int -> LockerMap -> Either' String Code
lockerLookup lockerNumber lockerMap =
    case Map.lookup lockerNumber lockerMap of
        Nothing -> Error $ "Locker " ++ show lockerNumber ++ " is not in map"
        Just (state, code) -> if state == Taken
                                then Error $ "Locker " ++ show lockerNumber ++ " is taken"
                                else Success code

lockers :: LockerMap
lockers = Map.fromList
    [ (1, (Taken, "123"))
    , (2, (Taken, "456"))
    , (3, (Free, "789"))
    , (4, (Free, "012"))
    , (5, (Taken, "345"))
    ]
