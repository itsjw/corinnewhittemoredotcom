module Model exposing (..)

-- init ------------------------------------------------------------------------


type alias Model =
    String


initialModel : Model
initialModel =
    "IndependentStudy"


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )
