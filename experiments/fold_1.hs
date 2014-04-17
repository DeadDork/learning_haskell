-- Explores if parameter order matters in partially applied functions
map' :: (a -> b) -> [a] -> [b]
map' f = foldl (\ a x -> f x : a) []
-- Because foldl eats the list from the left, (*3) on [1..4] will map as 4:3:2:1:[], i.e. [4, 3, 2, 1].
-- This is why you need to use `foldr`
