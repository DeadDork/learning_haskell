doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
    then x
    else doubleMe x
--['a', [['b']]] --doesn't work because the elements in the list of different types, respectively char and list of char.
