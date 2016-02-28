module Integrator where
import CLaSH.Prelude

integrator signal = mealy mf 0 signal
    where 
        mf state input = (nextstate,output)
            where
                nextstate = state + input
                output = nextstate

topEntity :: Signal (SFixed 2 8) -> Signal (SFixed 2 8)
topEntity = integrator


