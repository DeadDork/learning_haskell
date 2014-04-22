import qualified Data.Char as C
encode :: Int -> String -> String
encode shift msg =
    let ords = map C.ord msg
        shifted = map (+ shift) ords
    in map C.chr shifted
