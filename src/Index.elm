module Index exposing (main)

import Browser

import Model exposing (State)
import Subscriptions exposing (subscriptions)
import Message exposing (Msg)
import Update exposing (update)
import View exposing (view)

init: () -> ( State, Cmd Msg )
init _ = ( { content = "", since = "", until = "", tweets = [] }, Cmd.none )

main =
  Browser.element
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }
