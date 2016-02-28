module MovingAverage1 where
import CLaSH.Prelude

-- naive implementation using n-1 adders and n registers
movingAvarage n signal = mealy mf (replicate n 0) signal
    where
        mf state input = (nexts,output)
            where 
                nexts = input :> init state
                output = fold (+) nexts

topEntity :: Signal (Signed 8) -> Signal (Signed 8)
topEntity = movingAvarage d4


