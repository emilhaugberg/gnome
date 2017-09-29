module Gnome where

import Prelude
import Data.Array
import Data.Maybe
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

type Position = Int

gnome :: forall a. (Ord a) => Position -> Position -> Array a -> Maybe (Array a)
gnome x y arr = if x < length arr then swap else pure arr
  where
    swap = join do
      previous <- index arr (x - 1)
      current  <- index arr x

      if previous <= current
        then pure $ gnome y (y+1) arr
        else do
          newArr1 <- modifyAt (x - 1) (\z -> current) arr
          newArr2 <- modifyAt x (\z -> previous) newArr1

          if x < 1 then pure $ gnome (y + 1) y newArr2 else pure $ gnome (x - 1) y newArr2
