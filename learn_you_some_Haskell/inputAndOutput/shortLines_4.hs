-- Maximal compactness

main = do interact $ unlines . filter ((<10) . length) . lines
