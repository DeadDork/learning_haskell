-- I stupidly forgot that map creates a new list. No wonder this fails.

main = do
    let xs = ["hi", "bye", "try", "die"]
    map putStrLn xs
