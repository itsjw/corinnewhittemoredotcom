module Model
    exposing
        ( Model
        , initialModel
        , invertActiveArtwork
        , deactivateModal
        , toggleScrollDisable
        )

import Dict exposing (Dict)
import Html exposing (Attribute)
import Html.Attributes exposing (style)


type alias Model =
    { tab : String
    , activeArtwork : Dict.Dict String Bool
    , modalImagePath : String -- Path to images
    , disableScroll : Bool
    }



-- strings that identify a piece of
-- artwork within various sets


artworkStrings : List String
artworkStrings =
    [ "mariaMarilyn" -- Valley Cultura
    , "hablaTex"
    , "digitalLandscape"
    , "rodriguezFlowerShop"
    , "crossing"
    , "sunsetMinimart"
    , "marthasFruitStand"
    , "marthasFruitStandTwo"
    , "excessiveForce" -- Private Disturbance
    , "battleField"
    , "mindGames"
    , "shiftingPerspective"
    , "subtlePresence"
    , "noPrisoners"
    , "bed" -- The Italy Journals
    , "bush"
    , "period"
    , "spent"
    , "test"
    , "importantPaper" -- Important Papers
    ]



-- some number of bools to zip
-- for activeArtwork


falses_ : Int -> List Bool
falses_ noOfRepeats =
    List.repeat noOfRepeats False


falses : List Bool
falses =
    falses_ (List.length artworkStrings)



-- initial model for start of elm app


initialModel : Model
initialModel =
    { tab = "ValleyCultura"
    , activeArtwork = Dict.fromList <| List.map2 (,) artworkStrings falses
    , modalImagePath = "" -- Path to images
    , disableScroll = False
    }


shrek : Maybe Bool -> Maybe Bool
shrek b =
    case b of
        Nothing ->
            Just False

        Just b ->
            Just (not b)


invertActiveArtwork : Dict String Bool -> String -> Dict String Bool
invertActiveArtwork dict artworkStr =
    Dict.update artworkStr shrek dict


deactivateModal : Dict String Bool
deactivateModal =
    Dict.fromList <| List.map2 (,) artworkStrings falses


toggleScrollDisable : Model -> Attribute msg
toggleScrollDisable model =
    if model.disableScroll then
        style
            [ ( "overflow", "hidden" )
            , ( "position", "fixed" )
            , ( "width", "0 !important" )
            , ( "-moz-appearance", "menuimage" )
            , ( "top", "0" )
            , ( "left", "0" )
            , ( "right", "0" )
            , ( "bottom", "0" )
            ]
    else
        style
            [ ( "", "" )
            ]
