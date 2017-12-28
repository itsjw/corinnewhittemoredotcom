module Model exposing (..)


type alias Model =
    { isBurgerActive : Bool }


initialModel : Model
initialModel =
    { isBurgerActive = False }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )
