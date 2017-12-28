module Model exposing (..)

-- init ------------------------------------------------------------------------


type alias Model =
    { hoverAttribute : String
    , isBurgerActive : Bool
    }


initialModel : Model
initialModel =
    { hoverAttribute = ""
    , isBurgerActive = False
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )
