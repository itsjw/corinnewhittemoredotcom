module Messages exposing (..)

import Html exposing (Attribute, Html, figure, div, img, a)
import Html.Attributes exposing (class, src, alt, style)
import Html.Events exposing (onClick)
import Keyboard
import Util exposing (..)


type Msg
    = ValleyCultura -- Tabs Messages:
    | PrivateDisturbance
    | TheItalyJournals
    | ImportantPapers
    | MariaMarilyn -- Image Messages: ValleyCultura
    | HablaTex
    | DigitalLandscape
    | RodriguezFlowerShop
    | Crossing
    | SunsetMinimart
    | MarthasFruitStand
    | MarthasFruitStandTwo
    | ExcessiveForce -- PrivateDisturbance:
    | BattleField
    | MindGames
    | ShiftingPerspective
    | SubtlePresence
    | NoPrisoners
    | Bed -- The Italy Journals:
    | Bush
    | Period
    | Spent
    | Test
    | ImportantPaper -- Important Papers
    | CloseModal -- Messages used for controlling modal windows:
    | GetScrollPos
    | NewPos Float
    | ErrOnGetScroll String
    | NoOp
    | KeyMsg Keyboard.KeyCode
    | Burger



-- Utils that need Msgs --------------------------------------------------------
-- divTileImgGenerator:
-- used to create tiles with imgs within them
-- included is "Messages.elm" due to Msg being defined here.


attributeFitWidth : Attribute msg
attributeFitWidth =
    style
        [ ( "max-height", "100%" )
        , ( "object-fit", "contain" )
        , ( "overflow", "visible" )
        ]


divTileImgGenerator : ImagePath -> HtmlAlt -> BulmaDimension -> Msg -> Html Msg
divTileImgGenerator path altStr dimension msg =
    div [ class "tile is-child" ]
        [ a [ onClick msg ]
            [ figure
                [ class <| "image is-unselectable " ++ dimension, attributeFitWidth ]
                [ img [ src path, alt altStr ] [] ]
            ]
        ]
