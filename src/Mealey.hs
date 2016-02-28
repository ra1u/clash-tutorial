module Mealey where
import CLaSH.Prelude hiding (mealey)

-- mealy in terms of register
mealey :: (s -> a -> (s,b)) -> s -> Signal a -> Signal b
mealey mf initV sig = out
    where
        (nexts,out) = unbundle $ liftA2 mf (register initV nexts) sig


-- unbundle is  function that does some type conversion
-- so it turns signal of tuple in tuple of signals

-- unbundle :: Signal (a,b) -> (Signal a, Signal b)


topEntity :: (Signal (Signed 9)) -> (Signal (Signed 9))
topEntity = mealey (\s i -> (s+i,s)) 0 -- delayed integrator
