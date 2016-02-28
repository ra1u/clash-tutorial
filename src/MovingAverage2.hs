module MovingAverage where
import CLaSH.Prelude


-- it that takes n+1 sized registers and 2 adders
-- 
movingAvarage n signal = mealy mf ((replicate n 0),0) signal
    where
        mf (vec,total) input = ((nextVec,nextTot),output)
            where 
                output = total + input - (last vec)
                nextVec = input :> init vec
                nextTot = output

topEntity :: Signal (Signed 8) -> Signal (Signed 8)
topEntity = movingAvarage d16
