-- Tests `let .. in` to see if they can be chained.

module Let ( test ) where
  test :: Integer
  test =
    let x = 3 in
    let y = 4 in
    let z = 5
     in x + y + z
