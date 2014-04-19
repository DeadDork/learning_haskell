import qualified Data.List as L
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
    let nlen = length needle
    in foldl (\ a x -> if take nlen x == needle then True else a) False $ L.tails haystack
