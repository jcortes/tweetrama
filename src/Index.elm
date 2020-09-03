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

type Msg = Search String

update: Msg -> Model -> Model
update msg model =
  case msg of
    Search newContent ->
      { model | content = newContent }

view : Model -> Html Msg
view model =
  div [id "main"]
    [ form [ id "main-form", onSubmit (Search model.content) ]
      [ input [ value model.content, onInput Search ] []
      , button [ type_ "submit" ] [ text "Search" ]
      ]
    ]

