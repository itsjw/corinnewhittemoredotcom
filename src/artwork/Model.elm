module Model
    exposing
        ( Model
        , initialModel
        , invertActiveArtwork
        , deactivateModal
        , toggleScrollDisable
          -- , selectedArtwork
        )

import Dict exposing (Dict)
import Html exposing (Attribute)
import Html.Attributes exposing (style)
import ImagePaths
    exposing
        ( pathsArtworkHiRes
        , artworkStrings
        , ArtworkModal
        , modalValleyCultura
        )


type alias ModalDisplay =
    Maybe ArtworkModal


modalDisplayPath : Maybe ArtworkModal -> String
modalDisplayPath awModal =
    case awModal of
        Just modal ->
            modal.currentPath

        Nothing ->
            ""


type alias Model =
    { tab : String
    , activeArtwork : String
    , modalImagePath : String -- Path to images
    , disableScroll : Bool
    , windowPos : Float
    , errors : String
    , isBurgerActive : Bool
    , imageIndex : Int
    , modalValleyCultura : ArtworkModal
    , modalPrivateDisturbance : ArtworkModal
    , modalTheItalyJournals : ArtworkModal
    , modalImportantPapers : ArtworkModal
    , modalDisplay : ModalDisplay
    , modalIsActive : Bool
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
    { -- set tab to start with when loading the page:
      tab = "ValleyCultura"
    , activeArtwork = ""
    , modalImagePath = "" -- Path to highres images

    -- disableScroll is True when modal is active:
    , disableScroll = False

    -- windowPos is used to return mouse position
    -- to original position when exiting modal:
    , windowPos = 0
    , errors = ""
    , isBurgerActive = False
    , imageIndex = -1 -- Negative Value indicates modal is down

    -- Modal structures contain paths to images to be shown:
    , modalValleyCultura = ImagePaths.modalValleyCultura
    , modalPrivateDisturbance = ImagePaths.modalPrivateDisturbance
    , modalTheItalyJournals = ImagePaths.modalItalyJournals
    , modalImportantPapers = ImagePaths.modalImportantPapers
    , modalDisplay = Nothing
    , modalIsActive = False
    }


shrek : Maybe Bool -> Maybe Bool
shrek b =
    case b of
        Nothing ->
            Just False

        Just b ->
            Just (not b)



{--selectedArtwork : Model -> String
  - selectedArtwork model =
  -     let
  -         theTrueVine : Dict.Dict String Bool
  -         theTrueVine =
  -             Dict.filter (\_ v -> v == True) model.activeArtwork
  -
  -         trueVineAsList : List ( String, Bool )
  -         trueVineAsList =
  -             Dict.toList theTrueVine
  -
  -         key : String
  -         key =
  -             case List.head trueVineAsList of
  -                 Nothing ->
  -                     ""
  -
  -                 Just val ->
  -                     Tuple.first val
  -     in
  -         key --}


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
