module NormalForm where

data Fiction = Fiction
data Nonfiction = Nonfiction

data BookType = FictionBook Fiction
              | NonfictionBook Nonfiction

type Name = String
-- The Author is a product of Name and BookType
data Author = Author (Name, BookType)

-- The Author1 is a sum of products
data Author1 =
    Fiction1 Name
  | Nonfiction1 Name
