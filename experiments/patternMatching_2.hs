-- Explores pattern matching with functions on arguments.

-- Conclusion: parse error.

main :: IO ()
main = do
    putStrLn $ test "hey"
    putStrLn $ test "yo"

test :: String -> String
test (a == "hey") = "Hello my brother"
test (a == "yo") = "Hello my sister"
test _ = "Ketchuuuuuuup"
