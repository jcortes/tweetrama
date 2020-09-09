module Index exposing (..)

import Browser
import Html exposing (Html, form, div, input, text, button)
import Html.Attributes exposing (id, value, type_)
import Html.Events exposing (onSubmit, onInput)

import Http
import Json.Decode as Decode exposing (Decoder, field, string)
import Json.Encode as Encode exposing (encode, list)

main =
  Browser.element
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

type alias TweetsModel = 
  { content : String
  , tweets : List String
  }

type Model = FormSuccess TweetsModel

init: () -> (Model, Cmd Msg)
init _ = (FormSuccess { content = "", tweets = [] }, Cmd.none)

type Msg = UserInput String
  | Search String
  | GotTweets (Result Http.Error (List String))

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UserInput newContent ->
      case model of
        FormSuccess tweetsModel ->
          ( FormSuccess { tweetsModel | content = newContent }, Cmd.none )

    Search newContent ->
      case model of
        FormSuccess tweetsModel ->
          ( FormSuccess { tweetsModel | content = newContent }, getTweets newContent )

    GotTweets result ->
      case result of
        Ok tweetsResponse ->
          case model of
            FormSuccess tweetsModel ->
              ( FormSuccess { tweetsModel | tweets = tweetsResponse }, Cmd.none )

        Err _ ->
          case model of
            FormSuccess tweetsModel ->
              ( FormSuccess tweetsModel, Cmd.none )

view : Model -> Html Msg
view model =
  div [id "main"]
    [ viewTweetsForm model
    ]

viewTweetsForm : Model -> Html Msg
viewTweetsForm model =
  case model of
    FormSuccess tweetsModel ->
      div [] [
        form [ id "main-form", onSubmit (Search tweetsModel.content) ]
        [ input [ value tweetsModel.content, onInput UserInput ] []
        , button [ type_ "submit" ] [ text "Search" ]
        ]
        , div [] []
        , text (encode 0 (Encode.list Encode.string tweetsModel.tweets))
      ]
    
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
