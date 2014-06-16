import System.Random

finiteRandoms :: (RandomGen g, Random v, Integral n) => n -> g -> ([v], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen =
    let (x, newGen) = random gen
        (xs, finalGen) = finiteRandoms (n-1) newGen
    in  (x:xs, finalGen)
