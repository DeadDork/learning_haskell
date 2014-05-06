import qualified Data.Char as Ch

main = do
    contents <- getContents
    putStr $ map Ch.toUpper contents

-- Test:
-- $ ./getContents_1 <haiku.txt 
-- I'M A LIL' TEAPOT  
-- WHAT'S WITH THAT AIRPLANE FOOD, HUH?  
-- IT'S SO SMALL, TASTELESS
