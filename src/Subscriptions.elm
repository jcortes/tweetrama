module Subscriptions exposing (subscriptions)

import Model exposing (State)
import Message exposing (Msg)

-- SUBSCRIPTIONS
subscriptions : State -> Sub Msg
subscriptions _ = Sub.none