-- Creates a 20 element set of random lower-case letters.

import System.Random  
  
main = do  
    gen <- getStdGen  
    putStrLn $ take 20 (randomRs ('a','z') gen)  
