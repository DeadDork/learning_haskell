import System.Random

rwg :: StdGen -> Int -> [String] -> [String]
rwg _ 0 _ = []   
rwg gen n wordList =
    let maxWord = length wordList - 1 
        (element, newGen) = randomR (0, maxWord) gen
    in (wordList !! element) : rwg newGen (n-1) wordList
