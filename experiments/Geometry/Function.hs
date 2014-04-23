module Geometry.Function
( surface
) where

import qualified Geometry.Shape as Shape

surface :: Shape.Shape -> Float
surface (Circle _ _ r) = pi * r^2
surface (Rectangle x1 y1 x2 y2) = (x2 - x1) * (y2 - y1)
