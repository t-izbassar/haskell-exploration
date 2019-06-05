module Odd where

data Odd = Odd Integer
  deriving (Eq, Show)

addEven :: Odd -> Integer -> Odd
addEven (Odd n) m
  | m `mod` 2 == 0 = Odd (n + m)
  | otherwise      = error "addEven: second parameter cannot be odd"

instance Enum Odd where
  succ o = o `addEven` 2
  pred o = o `addEven` (-2)

  toEnum n
    | n `mod` 2 == 1 = Odd (toInteger n)
    | otherwise      = error "toEnum on even parameter"

  fromEnum (Odd n) = fromInteger n

  enumFrom o = o : enumFrom (succ o)

  enumFromThen (Odd n1) (Odd n2) =
    (Odd n1) : enumFromThen (Odd n2) next where
      nextN = n2 - n1 + n2
      next = Odd nextN

  enumFromTo (Odd n1) (Odd n2) =
    takeWhile (\(Odd n) -> n <= n2) (enumFrom (Odd n1))

  enumFromThenTo (Odd n1) (Odd n2) (Odd n3) =
    takeWhile
      (\(Odd n) -> case n1 < n2 of { True -> n <= n3; False -> n >= n3 })
      (enumFromThen (Odd n1) (Odd n2))
