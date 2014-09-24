module NaturalArray
( Natural
, Array
, assocs
, accumArray
, elems
, index
, inRange
, Ix
, range
) where
  
import Data.Array
import Data.Natural

instance Ix Natural where
    range (a,b) = if a <= b
                  then [x | x <- [a..b]]
                  else []
    index (a,c) b = if (a <= b) && (b <= c)
                    then fromEnum (b - a)
                    else error $
                         "Index (" ++ show b ++ ") out of range " ++
                         "(" ++ show a ++ "," ++ show c ++ ")."
    inRange (a, c) b = if (a <= b) && (b <= c)
                       then True
                       else False
