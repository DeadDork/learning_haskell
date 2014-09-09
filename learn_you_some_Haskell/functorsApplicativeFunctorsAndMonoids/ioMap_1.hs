-- Just playing with the Functor typeclass

{- Without the functor
main = do line <- getLine
          let line' = reverse line
          putStrLn line
          putStrLn line'-}

{- Duplicate Functor
instance Functor IO where
    fmap f action = do result <- action
                       return (f result)-}

main = do line <- fmap reverse getLine
          putStrLn line
