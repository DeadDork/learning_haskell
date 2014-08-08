-- Exploring building a dead simple alphabet hash table parser.

-- Relies heavily on:
--  <http://stackoverflow.com/questions/12026690/haskell-parsec-key-value-pairs-key-value>
-- and
--  <http://book.realworldhaskell.org/read/using-parsec.html>

-- Conclusion: works!

import Text.ParserCombinators.Parsec

hashFile = pair `endBy` eol

pair = do
    k <- key
    v <- value
    return (k, v)

key = do
    k <- letter
    char ':'
    return k

value = do
    v <- letter
    return v

test p = lookAhead $ try p >> return ()

eol = char '\n'

parseHash :: String -> Either ParseError [(Char, Char)]
parseHash input = parse hashFile "" input
