module TwitterService exposing (getTweets)

import Http
import Json.Decode as Decode exposing (Decoder, field, string)

import Message exposing (Msg(..))

-- HTTP
getTweets : String -> Cmd Msg
getTweets content =
  Http.get
    { url = "http://localhost:8002/test/" ++ content
    , expect = Http.expectJson GotTweets tweetsDecoder
    }

statusDecoder : Decoder String
statusDecoder =
  field "text" string

tweetsDecoder : Decoder (List String)
tweetsDecoder =
  field "statuses" (Decode.list statusDecoder)