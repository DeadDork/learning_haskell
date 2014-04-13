bmi :: (RealFloat a) => a -> a -> String
bmi weight height
    | bmi <= skinny     = "Underweight"
    | bmi <= normal     = "Optimal"
    | bmi <= fat        = "Overweight"
    | otherwise         = "Obese"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
