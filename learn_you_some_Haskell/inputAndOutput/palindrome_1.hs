main = interact respondPalindrome

respondPalindrome = unlines . filter isPalindrome . lines
    where isPalindrome xs = xs == reverse xs
