import qualified Control.Monad as Ctrl
import qualified Data.Char as Ch

main = Ctrl.forever $ do
    putStrLn "Enter some input:"
    l <- getLine
    putStrLn $ map Ch.toUpper l
