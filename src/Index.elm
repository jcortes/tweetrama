module Index exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onSubmit)

main =
  Browser.sandbox { init = init, update = update, view = view }

type alias Model = { searchText : String }

init: Model
init = { searchText = "" }

type Msg = Submit String

update: Msg -> Model -> Model
update msg model =
  case msg of
    Submit newSearhText -> { model | searchText = newSearhText }

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Search", value model.searchText ] []
    ]

