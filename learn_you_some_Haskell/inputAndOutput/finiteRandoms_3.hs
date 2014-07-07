import System.Random

finiteRandom :: (RandomGen g, Random a) => Int -> g -> ([a], g)
finiteRandom 0 gen = ([], gen)
finiteRandom n gen =
    let (x, newGen) = random gen
        (xs, finalGen) = finiteRandom (n-1) newGen
    in  (x:xs, finalGen)
