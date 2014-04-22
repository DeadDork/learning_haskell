import qualified Data.Char as C
decode :: Int -> String -> String
decode shift msg =
    let ords = map C.ord msg
        shifted = map (subtract shift) ords
    in map C.chr shifted
