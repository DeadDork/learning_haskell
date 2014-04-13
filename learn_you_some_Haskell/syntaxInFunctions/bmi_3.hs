bmi :: (RealFloat a) => a -> a -> String
bmi weight height
    | bmi <= skinny     = "Underweight"
    | bmi <= normal     = "Optimal"
    | bmi <= fat        = "Overweight"
    | otherwise         = "Obese"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
