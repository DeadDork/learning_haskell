-- Blows up a string.

blowup :: String -> String
blowup xs = b 1 xs

b :: Int -> String -> String
b _ [] = []
b n (x:xs) = rep n x ++ b (n + 1) xs

rep :: Int -> Char -> String
rep 1 c = [c]
rep n c = c : rep (n - 1) c
