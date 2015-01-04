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
---- Basic insertion sort.
----
----------------------------------------------------------------------------------

module Data.List.Sort.InsertionSort (
  insertionSort -- * Insertion sort
) where

-- | Sorts from smallest to greatest.
--
-- @insertionSort [1,6,4,2,5,7,8,9,7,3,7,5] = [1,2,3,4,5,5,6,7,7,7,8,9]@
insertionSort :: (Ord a) => [a] -> [a]
insertionSort = foldr insert []
  where insert x [] = [x]
        insert x (y:zs)
          | x > y = y : insert x zs
          | otherwise = x : y : zs
