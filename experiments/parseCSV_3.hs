import Text.ParserCombinators.Parsec

parseCSV :: String -> Either ParseError [[String]]
parseCSV input = parse csvFile "(unknown)" input

csvFile = line `endBy` eol
line = cell `sepBy` (char ',')
cell = many (noneOf ",\n")
eol = char '\n'
