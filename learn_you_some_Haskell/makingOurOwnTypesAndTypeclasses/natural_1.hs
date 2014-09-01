-- I attempt to create a natural number data type.

-- Conclusion: what I am trying to do requires dependent types, which are
-- absent in core Haskell (though they exist in extensions). Agda, Idris, etc.
-- have it, though, so if I want to build a Natural type, it's straightforward
-- with those languages. Now, I do know that it is possible to build a natural
-- type in Haskell (cf http://hackage.haskell.org/package/natural-numbers),
-- it's just not trivially easy.

-- Doesn't work (Illegal literal in type)
data (Integer n) => Natural n = 1 | succ (Natural n) 

--data Stupid = 1 | 2 | 3 -- Doesn't work (Illegal literal in type)
--data Stupid' = One | Two | Three -- Does work
