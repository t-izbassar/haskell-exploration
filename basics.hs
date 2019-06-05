module Basics where

{-
  Everything in Haskell is an expression or declaration.

  The expression are in *Normal Form* when there are no
  more evaluation steps.
-}

{-|
  This is how function is defined in Haskell. It takes
  formal parameters followed by the actual expression.
-}
-- `Num a` is constraint for the type a
triple :: Num a => a -> a
triple y = y * 3

{- 
  Operators can be used in `infix` form meaning that
  they appear between arguments i.e. `f + g`.
  The (+) is just a function that takes two parameters
  and it can be called directly in `prefix` form
  i.e. `(+) f g`.
-}

{- 
  Associativity and precedence. The (+) function is
  `infixl 6` meaning that it is infix by default and
  is left associative. It also has the precedence
  number, which means that it will be evaluated
  before any operation with less number and after
  any operation with higher number.
-}
power1 = 2 ^ 3 ^ 4

-- the (^) is right associative so it is the same as:
power2 = 2 ^ (3 ^ 4)

-- but not the same as:
power3 = (2 ^ 3) ^ 4

-- the (*) is evaluated first as it has higher precedence:
sumAndMultiplication = 2 + 3 * 4

{-
  The whitespaces are significant. Code that is part of an
  expression should be indented under the beginning of that
  expression. Parts of the expression that are grouped should
  be indented to the same level.
-}

{-
  The ($) :: (a -> b) -> a -> b takes function which expects
  a and produces b and a and produces b. Basically it does
  what function is doing, but it has `infixr 0` precedence.
  It is used to fewer pairs of parentheses.
 -}
withParentheses = (2^) (2 + 2)
withDollar = (2^) $ 2 + 2
{-
  It works because $ is right associative so evaluation must
  start from the right. Since $ has 0 precedence the (+)
  operator takes over and being evaluating first:
  (2^) $ 4
  Then the $ itself is applied and we get (2^) 4.
-}
complexDollar = (2^) $ (*10) $ 2 + 3
-- right associativity: (2^) $ ((*10) $ 2 + 3)
-- lowest precedence: (2^) $ ((*10) $ 5)
-- appllication: (2^) $ ((*10) 5)
-- function is evaluated: (2^) $ 50
-- application: (2^) 50

{-
  Sectioning: (2^) means that the first argument
  of operator is being fixed to 2 and this returns
  function which expects the second argument. We
  can choose another one (^2) and then this function
  will expect the first argument of an operator.
-}

-- the where binds declaration to the expresion
-- which is using it.
functionWithWhere n = print plusOne
  where plusOne = n + 1

-- let also binds declaration to the expression
-- but let is an expression by itself
functionWithLet n = let plusOne = n + 1
                    in print plusOne
