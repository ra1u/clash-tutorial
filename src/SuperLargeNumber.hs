module SuperLargeNumber where

import CLaSH.Prelude
import qualified Prelude as P

composeFunc :: (b->c) -> (a->b) -> a -> c
composeFunc f g x = f (g x)

minus1 x = x - 1
largeNum x = x > 3
superLargeNum =  composeFunc largeNum minus1

topEntity :: Signal (Signed 7) -> Signal Bool
topEntity = fmap superLargeNum

