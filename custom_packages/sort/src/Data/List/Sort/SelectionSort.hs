{-# LANGUAGE Unsafe #-}

--------------------------------------------------------------------------------
---- |
---- Module         : Data.List.Sort.InsertionSort
---- Copyright      : Nimrod Omer 2015
---- License        : MIT
----
---- Maintainer     : Nimrod Omer
---- Stability      : experimental
---- Portability    : portable
----
---- Basic selection sort.
----
----------------------------------------------------------------------------------

module Data.List.Sort.SelectionSort (
  selectionSort -- * Selection sort
) where

-- | Sort from smallest to greatest.
--
-- @selectionSort [4,7,8,1,6,9,0,5,3,8,9,0,9,0] =
-- [0,0,0,1,3,4,5,6,7,8,8,9,9,9]@
selectionSort :: (Ord a) => [a] -> [a]
selectionSort [] = []
selectionSort (x:xs) = m : selectionSort r
  where (m, r) = foldr select (x, []) xs
        select a ~(b, cs)
          | b < a = (b, a:cs)
          | otherwise = (a, b:cs)
