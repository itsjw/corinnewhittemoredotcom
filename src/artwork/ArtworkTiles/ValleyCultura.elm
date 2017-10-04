module ValleyCultura exposing (content)

import Html exposing (Attribute, figure, section, text, Html, div, img, p, a)
import Html.Attributes exposing (style, class, src, alt, id)
import Html.Events exposing (onClick)
import ImagePaths exposing (ImagePath, ImagePaths, unwrapPath, pathsValleyCultura)
import Messages
    exposing
        ( Msg
            ( MariaMarilyn
            , HablaTex
            , DigitalLandscape
            , RodriguezFlowerShop
            , Crossing
            , SunsetMinimart
            , MarthasFruitStand
            , MarthasFruitStandTwo
            )
        )
import ArtworkCopy
    exposing
        ( valleyCulturaArtistStatement
        , valleyCulturaMaterialsProcess
        )


{--css globals:
  - font-garamond class can be found
  - in the root directory
  - it is used to define the font
  - garamond. --}


content : Html Msg
content =
    sectionValleyCultura



-- attributes ------------------------------------------------------------------


attributeTextAlign : Attribute msg
attributeTextAlign =
    style [ ( "text-align", "justify" ) ]


stylePaddingColumns : Attribute msg
stylePaddingColumns =
    style
        [ ( "padding-top", "84px" )
        , ( "padding-bottom", "34px" )
        ]


stylePaddingImgCrossing : Attribute msg
stylePaddingImgCrossing =
    style [ ( "padding-top", "28px" ) ]


type alias BulmaDimension =
    String



-- example BulmaDimension: "is-169x142"


type alias HtmlAlt =
    String



-- example HtmlAlt: "blah"
-- This is just an alternative
-- String for an image in an href.


divTileImgGenerator : ImagePath -> HtmlAlt -> BulmaDimension -> Msg -> Html Msg
divTileImgGenerator path altStr dimension msg =
    div [ class "tile is-child" ]
        [ a [ onClick msg ]
            [ figure [ class <| "image is-unselectable" ++ dimension ]
                [ img [ src path, alt altStr ] [] ]
            ]
        ]



-- tiles -----------------------------------------------------------------------
--
--
-- tiles with zero level depth that contain images within them


divTileImgMarthasFruitStand : Html Msg
divTileImgMarthasFruitStand =
    divTileImgGenerator
        (unwrapPath
            "marthasFruitStand"
            pathsValleyCultura
        )
        "Marthas Fruit Stand"
        "is-169x142"
        MarthasFruitStand


divTileImgSunsetMinimart : Html Msg
divTileImgSunsetMinimart =
    divTileImgGenerator
        (unwrapPath "sunsetMinimart" pathsValleyCultura)
        "Sunset Minimart"
        "is-169x142"
        SunsetMinimart


divTileMaterialsAndProcess : Html msg
divTileMaterialsAndProcess =
    div [ class "tile is-vertical" ]
        [ p [ class "title font-garamond" ] [ text "Materials &\nProcess" ]
        , div [ class "content", attributeTextAlign ]
            [ p [] [ text valleyCulturaMaterialsProcess ] ]
        ]


divTileTwoVerticalImages : Html Msg
divTileTwoVerticalImages =
    div [ class "tile is-vertical" ]
        [ divTileImgSunsetMinimart
        , divTileImgMarthasFruitStand
        ]


divColumnsImagesAndCopy : Html Msg
divColumnsImagesAndCopy =
    div [ class "columns", stylePaddingColumns ]
        [ div [ class "column" ] [ divTileTwoVerticalImages ]
        , div [ class "column" ] [ divTileMaterialsAndProcess ]
        ]


divTileSecondHalf : Html Msg
divTileSecondHalf =
    div [ class "tile is-vertical is-parent", stylePaddingImgCrossing ]
        [ divTileImgCrossing
        , divColumnsImagesAndCopy
        ]


divTileImgRodriguezFlowerShop : Html Msg
divTileImgRodriguezFlowerShop =
    divTileImgGenerator
        (unwrapPath "rodriguezFlowerShop" pathsValleyCultura)
        "Rodriguez Flower Shop"
        "is-384x68"
        RodriguezFlowerShop


divTileImgDigitalLandscape : Html Msg
divTileImgDigitalLandscape =
    divTileImgGenerator
        (unwrapPath "digitalLandscape" pathsValleyCultura)
        "Digital Landscape"
        "is-384x68"
        DigitalLandscape


divTileImgHablaTex : Html Msg
divTileImgHablaTex =
    divTileImgGenerator
        (unwrapPath "hablaTex" pathsValleyCultura)
        "Habla Tex"
        "is-384-68"
        HablaTex


divTileImgMariaMarilyn : Html Msg
divTileImgMariaMarilyn =
    divTileImgGenerator
        (unwrapPath "mariaMarilyn" pathsValleyCultura)
        "Maria Marilyn"
        "is-384-68"
        MariaMarilyn


divTileImgCrossing : Html Msg
divTileImgCrossing =
    divTileImgGenerator
        (unwrapPath "crossing" pathsValleyCultura)
        "The Apparition: Border Crossing"
        "is-384-256"
        Crossing


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child" ]
        [ div [ class "title font-garamond" ] [ text "Artist Statement" ]
        , div [ class "content" ]
            [ p [ attributeTextAlign ]
                [ text valleyCulturaArtistStatement ]
            ]
        ]


divTileFirstHalf : Html Msg
divTileFirstHalf =
    div [ class "tile is-6 is-parent is-vertical" ]
        [ divTileArtistStatement
        , divTileImgMariaMarilyn
        , divTileImgHablaTex
        , divTileImgDigitalLandscape
        , divTileImgRodriguezFlowerShop
        ]


divTileIsAncestor : Html Msg
divTileIsAncestor =
    div [ class "tile is-ancestor" ] [ divTileFirstHalf, divTileSecondHalf ]


sectionValleyCultura : Html Msg
sectionValleyCultura =
    section [ class "section", id "valley-cultura", style [ ( "zoom", "0.8" ) ] ]
        [ div [ class "container" ]
            [ divTileIsAncestor ]
        ]
