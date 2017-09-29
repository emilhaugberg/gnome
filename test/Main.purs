module Test.Main where

import Prelude
import Gnome
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ show $ gnome 1 2 [1,2,3,5,4,3]
