module Index exposing (Model)

import Browser
import Html exposing (Html, form, div, input, text, button)
import Html.Attributes exposing (id, value, type_)
import Html.Events exposing (onSubmit, onInput)

main =
  Browser.sandbox { init = init, update = update, view = view }

type alias Model = { content : String }

init: Model
init = { content = "" }

type Msg = UserInput String
  | Search String

update: Msg -> Model -> Model
update msg model =
  case msg of
    UserInput newContent ->
      { model | content = newContent }
    Search newContent ->
      { model | content = "Requesting Matarife ..." }

view : Model -> Html Msg
view model =
  div [id "main"]
    [ form [ id "main-form", onSubmit (Search model.content) ]
      [ input [ value model.content, onInput UserInput ] []
      , button [ type_ "submit" ] [ text "Search" ]
      ]
    ]

