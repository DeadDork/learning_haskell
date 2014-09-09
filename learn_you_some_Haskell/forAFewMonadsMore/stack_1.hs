import Control.Monad.State.Lazy

type Stack = [Int]

pop :: State Stack Int
pop = state $ \ (x:xs) -> (x, xs)

push :: Int -> State Stack ()
push x = state $ \ xs -> ((), x:xs)

stackManip :: State Stack ()
stackManip = do
    pop
    pop
    push 3
    push 5
