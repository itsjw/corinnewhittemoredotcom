module ValleyCultura exposing (content)

import Html exposing (Attribute, article, figure, section, text, Html, div, img, p, a)
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
    div [ class "tile is-parent" ]
        [ div [ class "tile is-child is-vertical" ]
            [ p [ class "title font-garamond" ] [ text "Materials &\nProcess" ]
            , article [ class "content", attributeTextAlign ]
                [ p [] [ text valleyCulturaMaterialsProcess ] ]
            ]
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


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child is-vertical is-6" ]
        [ div [ class "title font-garamond" ] [ text "Artist Statement" ]
        , div [ class "content" ]
            [ p [ attributeTextAlign ] [ text valleyCulturaArtistStatement ] ]
        ]


divTileImgCrossing : Html Msg
divTileImgCrossing =
    divTileImgGenerator
        (unwrapPath "crossing" pathsValleyCultura)
        "The Apparition: Border Crossing"
        "is-384-256"
        (ImageClick ValleyCultura "crossing")


divTileTopHalf : Html Msg
divTileTopHalf =
    div [ class "tile" ]
        [ div [ class "tile is-parent" ]
            [ divTileArtistStatement
            , divTileImgCrossing
            ]
        ]


divTileImagesBottomLeft : Html Msg
divTileImagesBottomLeft =
    div [ class "tile is-vertical is-parent" ]
        [ divTileImgMariaMarilyn
        , divTileImgHablaTex
        , divTileImgDigitalLandscape
        , divTileImgRodriguezFlowerShop
        ]


divTileImagesBottomRightLeft : Html Msg
divTileImagesBottomRightLeft =
    div [ class "tile is-child is-parent" ]
        [ divTileImgSunsetMinimart
        , divTileImgMarthasFruitStand
        ]


divTileImagesBottomRight : Html Msg
divTileImagesBottomRight =
    div [ class "tile" ]
        [ divTileImagesBottomRightLeft
        , divTileMaterialsAndProcess
        ]


divTileBottomHalf : Html Msg
divTileBottomHalf =
    div [ class "tile" ] [ divTileImagesBottomLeft, divTileImagesBottomRight ]


divTileIsAncestor : Html Msg
divTileIsAncestor =
    div
        [ class "tile is-ancestor is-vertical" ]
        [ divTileTopHalf, divTileBottomHalf ]


sectionValleyCultura : Html Msg
sectionValleyCultura =
    section
        [ class "section"
        , style
            [ ( "padding-bottom", "50%" )
            ]
        ]
        [ div [ class "container" ] [ divTileIsAncestor ] ]
