module Update exposing (update)

import Model exposing (State)
import Message exposing (Msg(..))
import TwitterService exposing (getTweets)

update: Msg -> State -> (State, Cmd Msg)
update msg model =
  case msg of
    UserInput newContent ->
      ( { model | content = newContent }, Cmd.none )

    Search newContent ->
      ( { model | content = newContent }, getTweets newContent )

    GotTweets result ->
      case result of
        Ok tweetsResponse ->
          ( { model | tweets = tweetsResponse }, Cmd.none )

        Err _ ->
          ( model, Cmd.none )