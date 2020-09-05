module Index exposing (Model)

import Browser
import Html exposing (Html, form, div, input, text, button)
import Html.Attributes exposing (id, value, type_)
import Html.Events exposing (onSubmit, onInput)

import Http
import Json.Decode as Decode exposing (Decoder, field, string)
import Json.Encode as Encode exposing (encode, list)

main =
  Browser.element { init = init, update = update, view = view }

type alias Model = { content : String, tweets : List String }
type Model = Failing
  | Loading
  | Sucess (List String)

type alias ResponseRecord = { statuses : List String }


init: () -> (Model, Cmd Msg)
-- init = { content = "", tweets = [] }
init = ( , Cmd.none )

type Msg = UserInput String
  | Search String
  | GotTweets (Result Http.Error (List String))

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UserInput newContent ->
      ( { model | content = newContent }, Cmd.none )
    Search newContent ->
      ( model, getTweets )

    GotTweets result ->
      case result of
        Ok tweetsResponse ->
          ( { model | tweets = tweetsResponse }, Cmd.none )
        Err _ ->
          ( model, Cmd.none )

view : Model -> Html Msg
view model =
  div [id "main"]
    [ form [ id "main-form", onSubmit (Search model.content) ]
      [ input [ value model.content, onInput UserInput ] []
      , button [ type_ "submit" ] [ text "Search" ]
      ]
      , div [] []
      , text (encode 0 (Encode.list Encode.string model.tweets))
    ]

-- HTTP

getTweets : Cmd Msg
getTweets =
  Http.get
    { url = "http://localhost:8002/test/" ++ "matarife"
    , expect = Http.expectJson GotTweets tweetsDecoder
    }

statusDecoder : Decoder String
statusDecoder =
  field "text" string

tweetsDecoder : Decoder (List String)
tweetsDecoder =
  field "statuses" (Decode.list statusDecoder)
