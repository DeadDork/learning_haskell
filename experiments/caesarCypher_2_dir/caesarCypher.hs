{-# LANGUAGE DeriveDataTypeable #-}

-- Comments

-- This is just a slightly more feature-ful version of the Caesar cypher. It
-- lets you select from a handful of different substitution cyphers:
--  (a) a rotating cypher (e.g. Rot-13)
--  (b) an arbitrary cypher (e.g. 'a' = 'l', 'b' = 'z', 'c' = 'b')

-- StdLib
import Data.Char
import qualified Data.Map.Strict as Map
import Data.Maybe
import Data.Tuple
import Text.ParserCombinators.Parsec

-- Hackage
import System.Console.CmdArgs

data CryptMode = Encrypt | Decrypt deriving (Eq, Data, Typeable, Show)

data CypherArgs = CypherArgs { cryptMode :: CryptMode
                             , offset :: Int
                             , substitutionFile :: Maybe FilePath
                             , input :: Maybe FilePath
                             } deriving (Data, Typeable, Show)

main :: IO ()
main = do argv <- cmdArgsRun argMode
          k <- getK $ (\ a -> if isJust $ substitutionFile a
                              then Right $ fromJust . substitutionFile $ a
                              else Left $ offset a) argv
          let key = getKey (cryptMode argv) k
          s <- getInput' (input argv)
          putStrLn $ map (crypt key) s

argMode :: Mode (CmdArgs CypherArgs)
argMode = cmdArgsMode $ CypherArgs 
    { cryptMode = Encrypt
        &= typ "CRYPTMODE"
        &= help ( "Set the mode to either Encrypt or Decrypt (defaults to"
                ++ "Encrypt)."
                )
    , offset = 13
        &= typ "INTEGER"
        &= help "Set the offset for the Caesar cypher (defaults to 13)."
    , substitutionFile = Nothing
        &= typFile
        &= help ( "Optionally set an arbitrary substitution key from a file"
                ++ "(will negate any offset entered)."
                )
    , input = Nothing
        &= typ "INPUT"
        &= help "Set input (defaults to STDIN, but can be a file)."
    }
      &= program "caesarCypher"
      &= summary "Arbitrary Caesar cypher v0.2, (C) Nimrod Omer 2014"

getK :: Either Int FilePath -> IO (Map.Map Char Char)
getK (Right f) = sub $ f
getK (Left n) = return $ rot n

rot :: Int -> Map.Map Char Char
rot o = let rotator c = rotate (ord c) (if isUpper c then ord 'A' else ord 'a')
            rotate c a = chr $ a + (c - a + o) `mod` alphaSize
        in Map.map rotator basicKey
    where alphaSize = 26

basicKey :: Map.Map Char Char
basicKey = Map.fromList [(x, x) | x <- ['A' .. 'z'], isAlpha x]

sub :: FilePath -> IO (Map.Map Char Char)
sub f = do contents <- readFile f
           let parseMap = parse (pair `endBy` char '\n') "" contents
           let subKey = case parseMap of Left _ -> basicKey
                                         Right r -> Map.fromList r
           return $ Map.union subKey basicKey

pair :: GenParser Char st (Char, Char)
pair = do k <- letter
          _ <- char ':'
          v <- letter
          return (k, v)

getKey :: CryptMode -> Map.Map Char Char -> Map.Map Char Char
getKey Encrypt dict = dict
getKey Decrypt dict = (flipMap dict) `Map.union` basicKey
    where flipMap d = Map.fromList $ map swap $ Map.toList $ subMap d
          subMap d = Map.filterWithKey (\ k v -> k /= v) d

getInput' :: Maybe FilePath -> IO String
getInput' f = if isNothing f
              then getContents
              else readFile $ fromJust f

crypt :: Map.Map Char Char -> Char -> Char
crypt key c = if isAlpha c
              then case c `Map.lookup` key of Nothing -> c
                                              Just x -> x
              else c
