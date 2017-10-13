module Model
    exposing
        ( Model
        , initialModel
        , invertActiveArtwork
        , deactivateModal
        , toggleScrollDisable
        , selectedArtwork
        )

import Dict exposing (Dict)
import Html exposing (Attribute)
import Html.Attributes exposing (style)
import Util exposing (artworkStrings)


type alias Model =
    { tab : String
    , activeArtwork : Dict.Dict String Bool
    , modalImagePath : String -- Path to images
    , disableScroll : Bool
    , windowPos : Float
    , errors : String
    }


artworkShortNameToProper : Dict String String
artworkShortNameToProper =
    let
        artworkNames =
            [ "Maria Marilyn" -- Valley Cultura
            , "Habla Tex"
            , "Digital Landscape"
            , "Rodriguez Flower Shop"
            , "The Apparition: Border Crossing"
            , "Sunset Minimart"
            , "Marthas Fruit Stand"
            , "Marthas Fruit Stand"
            , "Excessive Force" -- Private Disturbance
            , "Battle Field"
            , "Mind Games"
            , "Shifting Perspective"
            , "Subtle Pressence"
            , "No Prisoners"
            , "Bed" -- The Italy Journals
            , "Bush"
            , "Period"
            , "Spent"
            , "Test"
            , "Important Papers" -- Important Papers
            ]
    in
        Dict.fromList <| List.map2 (,) artworkStrings artworkNames



--
--
-- artworkStringsToModalDimensions : Dict String String
-- artworkStringsToModalDimensions = ?
--
--
--
--
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
    , windowPos = 0 -- used primarily for modal
    , errors = ""
    }


shrek : Maybe Bool -> Maybe Bool
shrek b =
    case b of
        Nothing ->
            Just False

        Just b ->
            Just (not b)


selectedArtwork : Model -> String
selectedArtwork model =
    let
        -- unwrapping in an inelegant way
        -- i am open to suggestions...?
        theTrueVine : Dict.Dict String Bool
        theTrueVine =
            Dict.filter (\_ v -> v == True) model.activeArtwork

        trueVineAsList : List ( String, Bool )
        trueVineAsList =
            Dict.toList theTrueVine

        key : String
        key =
            case List.head trueVineAsList of
                Nothing ->
                    ""

                Just val ->
                    Tuple.first val
    in
        key


invertActiveArtwork : Dict String Bool -> String -> Dict String Bool
invertActiveArtwork dict artworkStr =
    Dict.update artworkStr shrek dict


deactivateModal : Dict String Bool
deactivateModal =
    Dict.fromList <| List.map2 (,) artworkStrings falses



-- utility functions that use the model ----------------------------------------


toggleScrollDisable : Model -> Attribute msg
toggleScrollDisable model =
    let
        windowPosStr =
            toString (-model.windowPos) ++ "px"
    in
        if model.disableScroll then
            style
                [ ( "position", "fixed" )
                , ( "overflow", "hidden" )
                , ( "-moz-appearance", "menuimage" )
                , ( "width", "100%" )
                , ( "top", windowPosStr )
                ]
        else
            style
                [ ( "", "" )
                ]
