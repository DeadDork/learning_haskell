-- I don't know why this won't compile
head' :: [a] -> a
head' [] = error "Must be a finite, non-empty list."
head' (x:_) = x
