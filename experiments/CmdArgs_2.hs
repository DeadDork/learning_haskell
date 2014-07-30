-- N.B. the minor alteration with min & max. There was a namespace issue with
-- Prelude I still don't know how to solve.

{-# LANGUAGE DeriveDataTypeable #-}

import System.Console.CmdArgs

data Guess = Guess { min' :: Int
                   , max' :: Int
                   , limit :: Maybe Int
                   } deriving (Data,Typeable,Show)

guess = cmdArgsMode $ Guess {min' = 1, max' = 100, limit = Nothing}

main = do
    x <- cmdArgsRun guess
    print x
