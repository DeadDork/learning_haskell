{-# LANGUAGE DeriveDataTypeable #-}

-- Comments
-- There's a bug. When I decrypt, I get:
--
--      "caesarCypher_1: Prelude.chr: bad argument: (-3)
--
-- I suspect that it's doing something funny at EOF.
-- Otherwise this works fine.

-- StdLib
import Data.Char
import Data.Maybe

-- Hackage
import System.Console.CmdArgs

data CryptMode = Encrypt | Decrypt deriving (Eq, Data, Typeable, Show)

data CypherArgs = CypherArgs { cryptMode :: CryptMode
                             , offset :: Int
                             , input :: Maybe FilePath
                             } deriving (Data, Typeable, Show)

main :: IO ()
main = do
    argv <- cmdArgsRun argMode
    let c = cryptMode argv 
    let o = offset argv
    s <- let i = input argv
         in if isNothing i
            then getContents
            else readFile $ fromJust i
    putStrLn $ crypt c o s

argMode :: Mode (CmdArgs CypherArgs)
argMode = cmdArgsMode $ CypherArgs 
    { cryptMode = Encrypt
        &= typ "CRYPTMODE"
        &= help "Set the mode to either Encrypt or Decrypt (defaults to Encrypt)."
    , offset = 13
        &= typ "INTEGER"
        &= help "Set the offset for the Caesar cypher (defaults to 13)."
    , input = Nothing
        &= typ "INPUT"
        &= help "Set input (defaults to STDIN, but can be a file)."
    }
        &= program "caesarCypher"
        &= summary "Arbitrary Caesar cypher v0.1, (C) Nimrod Omer 2014"

crypt :: CryptMode -> Int -> String -> String
crypt c o s
    | c == Encrypt = map (cry (+ o)) s
    | otherwise = map (cry (subtract o)) s
    where cry f ch = chr . f . ord $ ch
