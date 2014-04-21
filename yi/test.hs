import qualified Data.Function as F
addMinus ::(Num a) =>a ->a
addMinus = (+) `F.on` (-)