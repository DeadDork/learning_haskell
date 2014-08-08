-- Explores pattern matching arguments.

main :: IO ()
main = do
    putStrLn $ test True
    putStrLn $ test False

test :: Bool -> String
test True = "Yeah buddy"
test False = "God DAMN"
