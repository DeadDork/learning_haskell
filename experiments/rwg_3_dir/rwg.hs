{-# LANGUAGE DeriveDataTypeable #-}

-- STDLIB
import Data.List
import System.Random
import qualified Data.List as L

-- Hackage
import System.Console.CmdArgs
import Data.Vector as V

-- Program arguments {{{
data RWGArg = RWGArg { number :: Int
                     , file :: FilePath
                     } deriving (Data, Typeable, Show)

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
    args' <- cmdArgsRun rwgArg
    let wordNumber = (\ n -> if n < 0 then 4 else n) $ number args'
    wordList <- (\ f -> readFile f >>= return . V.fromList . lines) $ file args'
    putStrLn $ intercalate " " (rwg gen wordNumber wordList)

rwg :: StdGen -> Int -> V.Vector String -> [String]
rwg gen n v = L.map (\ x -> v ! x) $ L.take n $ randomRs (0, V.length v - 1) gen
