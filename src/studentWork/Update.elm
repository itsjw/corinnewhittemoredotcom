module Update exposing (update)

import Messages exposing (..)
import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Burger ->
            ( { model | isBurgerActive = not model.isBurgerActive }, Cmd.none )
