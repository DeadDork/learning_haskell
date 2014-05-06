import qualified Control.Monad as Ctrl
import qualified Data.Char as Chr

main = Ctrl.forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map Chr.toUpper l
