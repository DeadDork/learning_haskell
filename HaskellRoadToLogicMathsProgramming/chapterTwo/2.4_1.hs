-- Tests xor.

infixl 2 <+>
(<+>) :: Bool -> Bool -> Bool
x <+> y = x /= y
