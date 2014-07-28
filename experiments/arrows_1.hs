-- Arrows, wtf?

main = putStrLn "Hello, what is your name?"
      >> getLine
      >>= \name -> putStrLn ("Hello, " ++ name ++ "!")
