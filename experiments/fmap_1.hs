import qualified Data.Map as M

fmap' f = M.fromList . map (f . snd) . M.toList
