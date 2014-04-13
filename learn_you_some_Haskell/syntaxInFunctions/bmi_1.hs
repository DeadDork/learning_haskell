bmi :: (RealFloat a) => a -> a -> String
bmi weight height
    | bmi <= 18.5 = "Underweight"
    | bmi <= 25.0 = "Optimal"
    | bmi <= 30.0 = "Overweight"
    | otherwise   = "Obese"
    where bmi = weight / height ^ 2
