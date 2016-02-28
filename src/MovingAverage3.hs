module MovingAverage3 where
import CLaSH.Prelude
import qualified MovingAverage1

-- naive implementation using n-1 adders and n-1 registers 
-- same topology as movingAvarage1 except one adder less
movingAvarage n signal = mealy mf (init (replicate n 0)) signal
    where
        mf state input = (nexts,output)
            where 
                nexts = input :> init state
                output = fold (+) (input :> state)


topEntity :: Signal (Signed 8) -> Signal (Signed 8)
topEntity = movingAvarage d4


