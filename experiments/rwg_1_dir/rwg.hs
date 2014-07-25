-- Very simple random word (noun) generator.

-- The idea is to choose however many words is reasonably necessary to generate
-- a secure password. Each word adds 11 bits of entropy, and 10 * 11 BoE is
-- plenty in this day and age. Thus, the user can select a password that's as secure or unsecure as
-- they desire by simply choosing however many words--and BoE--from the output
-- in their password..

import Data.List
import System.IO
import System.Random

main = do
    gen <- newStdGen
    contents <- readFile "nouns.txt"
    let wordList = lines contents
    putStrLn $ intercalate " " (rwg gen 10 wordList)

rwg :: StdGen -> Int -> [String] -> [String]
rwg _ 0 _ = []
rwg gen n wordList =
    let maxWord = length wordList - 1
        (element, newGen) = randomR (0, maxWord) gen
    in (wordList !! element) : rwg newGen (n-1) wordList
