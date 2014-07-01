import System.Random
import Control.Monad (when)

main = do
    instructions
    gen <- getStdGen
    hiLo gen

instructions :: IO ()
instructions = do
    putStrLn "HiLo (1 - 100)"

hiLo :: StdGen -> IO ()
hiLo gen = do
    let (randNumber, newGen) = randomR (1,100) gen :: (Int, StdGen)
    askForNumber randNumber
    hiLo newGen
    
askForNumber :: Int -> IO ()
askForNumber randNumber = do
    putStrLn "What is your guess? "
    numberString <- getLine
    let number = read numberString :: Int
    when (number /= randNumber) $ do
        if number < randNumber
            then putStrLn "Lo"
            else putStrLn "Hi"
        askForNumber randNumber
    when (number == randNumber) $ do
        putStrLn $ "You guessed it! The secret number is " ++ show randNumber
