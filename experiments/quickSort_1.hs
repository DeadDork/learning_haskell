module Sort
( quickSort
) where

  import qualified Data.Vector.Unboxed as V

  {- Naive implementation
  -- Main advantage: incredibly simple.
  -- Two drawbacks: 1) concatenation is expensive in lists 2) has a large
  -- memory footprint
  quickSort :: (Ord a) => [a] -> [a]
  quickSort [] = []
  quickSort (x:xs) = quickSort [y | y <- xs, y < x]
                   ++ [x]
                   ++ quickSort [y | y <- xs, y >= x]
  -}

  -- This implementation solves both problems.
  -- Pretty much copies <http://en.literateprograms.org/Quicksort_(Haskell)>'s
  -- `qsort3`
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
