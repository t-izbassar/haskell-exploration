module BasicsTypeclasses where

data DayOfWeek =
  Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Show)

data Date = Date DayOfWeek Int

-- We can only implement functions from typeclass in
-- instance syntax:
instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Wed Wed = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _ = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday2 dayOfMonth2) =
    weekday == weekday2 && dayOfMonth == dayOfMonth2


data Identity a = Identity a

-- Same syntax for constraint as in functions:
instance Eq a => Eq (Identity a) where
  (Identity i1) == (Identity i2) = i1 == i2
