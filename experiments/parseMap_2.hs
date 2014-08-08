-- Heavily refactors parseMaps_1.hs

-- Couldn't figure out how to parse this directly into a Map.

import Text.ParserCombinators.Parsec

hashFile = pair `endBy` (char '\n')

pair = do
    k <- letter
    char ':'
    v <- letter
    return (k, v)

parseHash :: String -> Either ParseError [(Char, Char)]
parseHash input = parse hashFile "" input
