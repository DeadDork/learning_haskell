{-# LANGUAGE DeriveDataTypeable #-}

import System.Console.CmdArgs

data Guess = Guess { min :: Int
                   , max :: Int
                   , limit :: Maybe Int
                   } deriving (Data,Typeable,Show)

main = do
    x <- cmdArgs $ Guess 1 100 Nothing
    print x
