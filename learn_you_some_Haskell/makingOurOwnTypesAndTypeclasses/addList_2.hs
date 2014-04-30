infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

infixr 5 +++
(+++) :: List a -> List a -> List a
Empty      +++ ys = ys
(x :-: xs) +++ ys = x :-: (xs +++ ys)

s1 = 'H' :-: 'i' :-: Empty
s2 = 'B' :-: 'y' :-: 'E' :-: Empty

-- Test
-- ghci> s1 +++ s2
-- 'H' :-: ('i' :-: ('B' :-: ('y' :-: ('E' :-: Empty))))
