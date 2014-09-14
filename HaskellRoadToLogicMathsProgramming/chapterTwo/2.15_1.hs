-- Tests for contradiction in logical functions with 1, 2, and 3 arguments.

contradictionTest1 :: (Bool -> Bool) -> Bool
contradictionTest1 bf = or [bf p | p <- [True, False]]

contradictionTest2 :: (Bool -> Bool -> Bool) -> Bool
contradictionTest2 bf = or [bf p q | p <- [True, False],
                                     q <- [True, False]]

contradictionTest3 :: (Bool -> Bool -> Bool -> Bool) -> Bool
contradictionTest3 bf = or [bf p q r | p <- [True, False],
                                       q <- [True, False],
                                       r <- [True, False]]
