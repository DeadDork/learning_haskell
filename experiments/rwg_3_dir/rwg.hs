{-# LANGUAGE DeriveDataTypeable #-}

-- STDLIB
import Data.List
import System.Random

-- Hackage
import System.Console.CmdArgs

-- This makes CmdArgs handle program arguments nicely {{{
data RWGArg = RWGArg { number :: Int
                     , file :: FilePath
                     } deriving (Data,Typeable,Show)

rwgArg :: Mode (CmdArgs RWGArg)
rwgArg = cmdArgsMode $ RWGArg
    { number = 4 
        &= typ "NUMBER"
        &= help "NUMBER defaults to 4. If NUMBER < 0, NUMBER set to default."
    , file = "nouns.txt"
        &= typFile
        &= help "FILE defaults to 'nouns.txt'."
    }
        &= program "rwg"
        &= summary "Random Word Generator v0.3, (C) Nimrod Omer 2014"
-- }}}

main :: IO ()
main = do
    gen <- newStdGen
    arguments <- cmdArgsRun rwgArg
    let wordNumber = (\ n -> if n < 0 then 4 else n) $ number arguments
    wordList <- (\ f -> readFile f >>= return . lines) $ file arguments
    putStrLn $ intercalate " " (rwg gen wordNumber wordList)

rwg :: StdGen -> Int -> [a] -> [a]
rwg _ 0 _ = []
rwg gen n xs =
    let low = 0
        high = length xs - 1
        (element, newGen) = randomR (low, high) gen
    in xs !! element : rwg newGen (n - 1) xs
