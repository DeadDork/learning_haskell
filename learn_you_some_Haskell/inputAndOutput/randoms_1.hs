import System.Random

randoms' :: (RandomGen g, Random a) => g -> [(a,g)]
randoms' gen =
    let (value, newGen) = random gen
    in (value, newGen) : randoms' newGen

-- take 4 $ randoms' (mkStdGen 11) :: [(Float, StdGen)]
