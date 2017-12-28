module Messages exposing (..)

import Html exposing (Attribute, Html, figure, div, img, a)
import Html.Attributes exposing (class, src, alt, style)
import Html.Events exposing (onClick)
import Keyboard
import Util exposing (..)


type Msg
    = Tab Series
    | ImageClick Series ArtworkTitle
    | CloseModal -- Messages used for controlling modal windows:
    | GetScrollPos
    | NewPos Float
    | ErrOnGetScroll String
    | NoOp
    | KeyMsg Keyboard.KeyCode
    | ImgNext
    | ImgPrevious
    | Burger -- Burger in navbar has been clicked



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


centerElement : Attribute msg
centerElement =
    style
        [ ( "display", "flex" )
        , ( "justify-content", "center" )
        , ( "align-items", "center" )
        ]


divTileImgGenerator : ImagePath -> HtmlAlt -> BulmaDimension -> Msg -> Html Msg
divTileImgGenerator path altStr dimension msg =
    div [ class "tile is-child" ]
        [ a [ onClick msg ]
            [ figure
                [ class <| "image is-unselectable " ++ dimension ]
                [ img [ src path, alt altStr ] [] ]
            ]
        ]
