module ValleyCultura exposing (content)

import Html exposing (Attribute, figure, section, text, Html, div, img, p, a)
import Html.Attributes exposing (style, class, src, alt, id)
import ArtworkCopy exposing (valleyCulturaArtistStatement, valleyCulturaMaterialsProcess)
import ImagePaths exposing (pathsValleyCultura)
import Util exposing (ImagePath, ImagePaths, unwrapPath, Series(ValleyCultura))
import Messages exposing (Msg(ImageClick), divTileImgGenerator)


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
        -- "is-169x142"
        "is-square"
        (ImageClick ValleyCultura "marthasFruitStand")


divTileImgSunsetMinimart : Html Msg
divTileImgSunsetMinimart =
    divTileImgGenerator
        (unwrapPath "sunsetMinimart" pathsValleyCultura)
        "Sunset Minimart"
        -- "is-169x142"
        "is-square"
        (ImageClick ValleyCultura "sunsetMinimart")


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
    div [ class "columns" ]
        [ div [ class "column" ] [ divTileTwoVerticalImages ]
        , div [ class "column" ] [ divTileMaterialsAndProcess ]
        ]


divTileSecondHalf : Html Msg
divTileSecondHalf =
    div [ class "tile is-vertical is-parent" ]
        [ divTileImgCrossing
        , divColumnsImagesAndCopy
        ]


divTileImgRodriguezFlowerShop : Html Msg
divTileImgRodriguezFlowerShop =
    divTileImgGenerator
        (unwrapPath "rodriguezFlowerShop" pathsValleyCultura)
        "Rodriguez Flower Shop"
        "is-384x68"
        (ImageClick ValleyCultura "rodriguezFlowerShop")


divTileImgDigitalLandscape : Html Msg
divTileImgDigitalLandscape =
    divTileImgGenerator
        (unwrapPath "digitalLandscape" pathsValleyCultura)
        "Digital Landscape"
        "is-384x68"
        (ImageClick ValleyCultura "digitalLandscape")


divTileImgHablaTex : Html Msg
divTileImgHablaTex =
    divTileImgGenerator
        (unwrapPath "hablaTex" pathsValleyCultura)
        "Habla Tex"
        "is-384-68"
        (ImageClick ValleyCultura "hablaTex")


divTileImgMariaMarilyn : Html Msg
divTileImgMariaMarilyn =
    divTileImgGenerator
        (unwrapPath "mariaMarilyn" pathsValleyCultura)
        "Maria Marilyn"
        "is-384-68"
        (ImageClick ValleyCultura "mariaMarilyn")


divTileImgCrossing : Html Msg
divTileImgCrossing =
    divTileImgGenerator
        (unwrapPath "crossing" pathsValleyCultura)
        "The Apparition: Border Crossing"
        "is-384-256"
        (ImageClick ValleyCultura "crossing")


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child" ]
        [ div [ class "title font-garamond" ] [ text "Artist Statement" ]
        , div [ class "content" ]
            [ p [ attributeTextAlign ] [ text valleyCulturaArtistStatement ] ]
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
    div
        [ class "tile is-ancestor" ]
        [ divTileFirstHalf, divTileSecondHalf ]


sectionValleyCultura : Html Msg
sectionValleyCultura =
    section
        [ class "section"
        , id "valley-cultura"
        ]
        [ div [ class "container" ] [ divTileIsAncestor ] ]
