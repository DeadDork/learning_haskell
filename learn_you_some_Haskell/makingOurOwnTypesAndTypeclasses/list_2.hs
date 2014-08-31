-- Plays with the example from the book.

-- Works!

infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

(++.) :: List a -> List a -> List a
Empty ++. ys = ys
(x :-: xs) ++. ys = x :-: (xs ++. ys)

-- E.G.
-- ghci> :l list_2
-- [1 of 1] Compiling Main             ( list_2.hs, interpreted )
-- Ok, modules loaded: Main.
-- ghci> let xs = 'a' :-: 'b' :-: 'c' :-: 'd' :-: Empty
-- ghci> let ys = '1' :-: '2' :-: '3' :-: '4' :-: Empty
-- ghci> xs ++. ys
-- 'a' :-: ('b' :-: ('c' :-: ('d' :-: ('1' :-: ('2' :-: ('3' :-: ('4' :-: Empty)))))))
