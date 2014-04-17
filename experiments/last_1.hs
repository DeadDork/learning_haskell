-- I thought maybe I could come up with a pattern for `last`, but no dice
last' :: [a] -> a
last' [] = error "Empty list"
last' [x] = x
last' (_:x:[]) = x -- only works for single & double tuples
--last' (xs ++ (x:[])) = x -- doesn't compile
