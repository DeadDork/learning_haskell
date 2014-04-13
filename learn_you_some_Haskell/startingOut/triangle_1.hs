triangle xs = [(a,b,c) | c <- xs, b <- [minimum xs..c], a <- [minimum xs..b], c^2 == a^2 + b^2]
