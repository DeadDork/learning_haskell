{-# LANGUAGE DeriveDataTypeable #-}

import System.Console.CmdArgs

data Guess = Guess { min' :: Int
                   , max' :: Int
                   , limit :: Maybe Int
                   } deriving (Data,Typeable,Show)

guess = cmdArgsMode $ Guess
    { min' = 1   &= argPos 0 &= typ "MIN"
    , max' = 100 &= argPos 1 &= typ "MAX"
    , limit = Nothing &= name "n" &= help "Limit the number of choices"
    } &= summary "Neil's awesome guessing program"

main = do
    x <- cmdArgsRun guess
    print x
