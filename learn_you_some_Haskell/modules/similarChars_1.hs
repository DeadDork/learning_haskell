-- Given two lists, returns a set intersection of their respective sets
import qualified Data.Set as Set
setIntersection :: (Ord a) => [a] -> [a] -> Set.Set a
setIntersection list1 list2 =
    let set1 = Set.fromList list1
        set2 = Set.fromList list2
    in Set.intersection set1 set2
