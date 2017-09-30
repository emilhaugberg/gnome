module Gnome where

import Prelude (class Ord, bind, const, join, pure, ($), (+), (-), (<), (<=), (==))
import Data.Array (index, length, modifyAt)
import Data.Maybe (Maybe)

type Position = Int

gnome :: forall a. (Ord a) => Position -> Position -> Array a -> Maybe (Array a)
gnome x y arr = if x < length arr then sort else pure arr
  where
    sort :: _
    sort = join $ pure do
      previous <- index arr (x - 1)
      current  <- index arr x

      if previous <= current
        then gnome y (y + 1) arr
        else do
          newArr1 <- swap (x - 1) (const current)  arr
          newArr2 <- swap x       (const previous) newArr1

          gnome (if x - 1 == 0 then y else (x - 1)) y newArr2

    swap :: _
    swap = modifyAt
