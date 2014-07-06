import System.Random (RandomGen, Random, random)

randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen =
    let (value, newGen) = random gen
    in value:randoms' newGen

-- Example:
-- ghci> take 5 $ randoms' (mkStdGen 5) :: [Int]
-- [7776561651304326943,2660592214809256573,-198934792153589140,-4772860058847753521,3891666655816497058]
