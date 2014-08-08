-- Explores unions of dictionaries.

-- Conclusion: the unions are left-biased, and work as expected.

import qualified Data.Map.Strict as Map

main :: IO () 
main = do listPrint [dict_1, dict_2, dict_1 `Map.union` dict_2]

listPrint :: (Show a) => [a] -> IO ()
listPrint [] = return ()
listPrint (x:xs) = do print x
                      listPrint xs

dict_1 :: Map.Map Int Int
dict_1 = Map.fromList [(x, 2 * x) | x <- [1..10]]

dict_2 :: Map.Map Int Int
dict_2 = Map.fromList [(x, 3 * x) | x <- [1..15]]
