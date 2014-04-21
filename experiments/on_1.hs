-- Stupid `on`
import qualified Data.Function as F
addMinus :: (Num a) => a -> a
addMinus x = F.on (+) (subtract 1) x x
