{-# LANGUAGE Unsafe #-}

--------------------------------------------------------------------------------
-- |
-- Module         : Data.List.Sort.HeapSort
-- Copyright      : Nimrod Omer 2015
-- License        : MIT
--
-- Maintainer     : Nimrod Omer
-- Stability      : experimental
-- Portability    : portable
--
-- Implements max-to-min heap sort (e.g. [zyx]).
--
----------------------------------------------------------------------------------

module HeapSort (
  heapSort -- * Heap sort
) where

import qualified Data.Heap.BinaryHeap.MaxHeap as H

-- | Sorts a list
--
-- N.B. As this function uses a max heap, the list is sorted from highest to
-- lowest.
--
-- @heapSort [1,5,6,2,3,2,3,5,5,9] :: [Int] = [9,6,5,5,5,3,3,2,2,1]@
heapSort :: (Ord a, H.Unbox a) => [a] -> [a]
heapSort = heapSort' . H.fromList
  where heapSort' H.Empty = []
        heapSort' h =
          let (v,h') = H.pop h
           in v : heapSort' h'
