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

module Data.List.Sort.QuickSort (
  quickSort -- * Quick sort
) where

-- | Haskell's list processing facilities make it particular easy to implement
-- the quicksort algorithm.
--
-- > quickSort :: (Ord a) => [a] -> [a]
-- > quickSort [] = []
-- > quickSort (x:xs) = quickSort [y | y <- xs, y < x]
-- >                  ++ [x]
-- >                  ++ quickSort [y | y <- xs, y >= x]
--
-- However, the above implementation unnecessarily consumes memory on the
-- recursions, and lists concatenate very inefficiently.
--
-- The implementation used solves both problems.
--
-- (Heavily inspired by <http://en.literateprograms.org/Quicksort_(Haskell)>'s
-- `qsort3`.)
--
-- @quickSort [4,7,9,1,3,2,4,5,6,8,8,9,5,3,4] = [1,2,3,3,4,4,4,5,5,6,7,8,8,9,9]@
quickSort :: (Ord a) => [a] -> [a]
quickSort xs = qsort xs []
  where qsort [] sorted = sorted
        qsort [pivot] sorted = pivot : sorted
        qsort (pivot : unsorted) sorted = part unsorted [] [pivot] []
          where part [] lt eq gt = qsort lt (eq ++ qsort gt sorted)
                part (x : unsorted) lt eq gt
                  | x < pivot = part unsorted (x : lt) eq gt
                  | x > pivot = part unsorted lt eq (x : gt)
                  | x == pivot = part unsorted lt (x : eq) gt
