module Update exposing (..)

import Messages exposing (..)
import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Burger ->
            ( { model | isBurgerActive = not model.isBurgerActive }
            , Cmd.none
            )

        KeyMsg ->
            ( model
            , Cmd.none
            )
