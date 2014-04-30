-- OK, this makes a lot of sense. I think I'm getting the hang of type
-- constructors.

data Perhaps a = Nada | Surely a deriving (Show)
