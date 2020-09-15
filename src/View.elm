module View exposing (view)

import Html exposing (Html, form, div, input, text, button)
import Html.Attributes exposing (id, value, type_, style)
import Html.Events exposing (onSubmit, onInput)

import Json.Encode as Encode exposing (encode, list)


import Model exposing (State)
import Message exposing (Msg(..))

mainStyle : List ( String, String )
mainStyle = []

view : State -> Html Msg
view model =
  div [ id "main" ]
    [ viewTweetsForm model
    ]

viewTweetsForm : State -> Html Msg
viewTweetsForm model =
  div [] [
    form [ id "main-form", onSubmit (Search model.content) ]
    [ input [ value model.content, onInput UserInput ] []
    , button [ type_ "submit" ] [ text "Search" ]
    ]
    , div [] []
    , text (encode 0 (Encode.list Encode.string model.tweets))
  ]