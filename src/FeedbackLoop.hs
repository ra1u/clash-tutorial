module FeedbackLoop where
import CLaSH.Prelude
import Integrator (integrator)-- integrator function from module in this folder


--              +---+    +---+
--    input -->-| f |-->-| g |-->-+-->-- out
--              +---+    +---+    |
--                |               ∨
--                ∧      +---+    |
--                +----<-| h |-<--+
--                       +---+     

feedbackLoop :: (Signal a -> Signal b -> Signal c) ->
                (Signal c -> Signal d) ->
                (Signal d -> Signal b) ->
                Signal a -> Signal d
feedbackLoop f g h input = out where
    out = g fout
    fout = f input (h out)



--                       +---+
--    input -->-( - )-->-| g |-->-+-->-- output 
--                |      +---+    |
--                ∧               ∨ 
--                +--------<------+

-- expressed in terms of feedbackLoop
negativeFeedback :: Num a => (Signal a -> Signal a) -> Signal a -> Signal a
negativeFeedback g = feedbackLoop (liftA2 (-)) g (register 0)

-- integrator from Integrator.hs in feedback loop
topEntity :: Signal (Signed 8) -> Signal (Signed 8)
topEntity = negativeFeedback integrator
