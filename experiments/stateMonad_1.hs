import Control.Monad.State

type Stack = [Int]

pop :: State Stack Int
pop = state $ \ (x:xs) -> (x,xs)

push :: Int -> State Stack ()
push x = state $ \ xs -> ((),(x:xs))

stackManip :: State Stack ()
stackManip = do push 1
                push 2
                push 3
                push 4
                push 5
                push 6
                push 7
                push 8
                push 9

-- E.G.
-- ghci> runState stackManip []
-- ((),[9,8,7,6,5,4,3,2,1])
