module BasicsTypes where

{-
  The definition of Bool. `data` starts data declaration.
  Bool -> type constructor
  True -> data constructor
  |    -> denotes sum type (or)
-}
data Bool = False | True

{-
  Pattern match allows to match agains data constructor
  to extract possible values from given type.
-}

{-
  The tuple is defined having the `(,)` as type constructor.
  It takes two parameters and forms `product type`.
-}
-- data (,) a b = (,) a b

-- Zero tuple Unit: `()`.

{-
  There are two types of polymorphism in Haskell:
  parametric and constrained. Parametric means
  that we can take any type and constrained means
  that the type which is supplied must have one
  instance. For example (Eq a, Eq b) => a -> b.

  The compiler tries to get the most polymorphic
  type from the expression.
-}

{-
  The Function type. `(->)` is the type constructor
  for functions. It has no data constructor. Functions
  are values. The arrow itself is an infix operator
  with right associativity. All functions in Haskell
  take one argument and return one result.

  The function application is left associative meaning
  that the leftmost argument is taken first.
-}

-- The + takes multiple arguments.
-- (+) :: Num a => a -> a -> a

{-
  Currying. The function type constructor associates
  to the right. This means that given one argument a
  to the function `+` it will produce another function,
  which expects one argument a and produces result.
  Haskell is curried by default.

  The association used not to control precedence or
  order of evaluation. It is used only to denote
  argument and result of the function. The (->) operator
  has same precedence.
-}
-- (+) :: Num a => a -> (a -> a)

-- This will return function, which will take next argument:
-- (+) 10

{-
  Parametric polymorphism. When the type is declared as a
  then it can be `any` type. Since we don't know which type
  it is then we cannot do anything with a. There are no
  methods to operate that can do something with a.

  Concrete classes have more flexibility in terms of computation.
  Int can use methods of the Num and Integral typeclasses because
  it has instances of both. The typeclasses are additive as we
  can describe Num as being a superclass of several other numeric
  typeclasses. They will all inherit operations from Num.
-}

-- we can define this two and only two implementations:
parametricFunction1 :: a -> a -> a
parametricFunction1 x y = x

parametricFunction2 :: a -> a -> a
parametricFunction2 x y = y

-- we can pass or not pass parametrically polymorphic values
-- and that's all we can do
parametricFunction3 :: a -> b -> b
parametricFunction3 x y = y

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC $ aToB a

a :: (a -> c) -> a -> a
a _ x = x

m :: (x -> y) -> (y -> (w, z)) -> x -> w
m xToY yToWZ givenX = fst $ yToWZ $ xToY givenX
