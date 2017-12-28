module ValleyCultura exposing (content)

import Html
    exposing
        ( Attribute
        , article
        , figure
        , section
        , text
        , Html
        , div
        , img
        , hr
        , p
        , a
        )
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


type alias ImageTile =
    Html Msg


type alias ArtworkTitle =
    String


type alias ArtworkInfo =
    String


divTileIconGenerator : ImageTile -> ArtworkTitle -> ArtworkInfo -> Html Msg
divTileIconGenerator tile title info =
    let
        lineStyle =
            style
                [ ( "padding-bottom", "15px" ), ( "border-bottom", "1px solid #000" ) ]

        noWrap =
            style [ ( "white-space", "pre" ) ]

        width =
            style [ ( "max-width", "160px" ) ]
    in
        div [ class "tile is-parent is-vertical", width ]
            [ tile
            , p [ class "title is-6 has-text-centered", noWrap ]
                [ text title ]
            , p [ class "subtitle is-6 has-text-centered", noWrap, lineStyle ]
                [ text info ]
            ]


divTileImgMarthasFruitStand : Html Msg
divTileImgMarthasFruitStand =
    divTileImgGenerator
        (unwrapPath
            "marthasFruitStand"
            pathsValleyCultura
        )
        "Marthas Fruit Stand"
        "is-square"
        (ImageClick ValleyCultura "marthasFruitStand")


divTileImgMarthasFruitStandTwo : Html Msg
divTileImgMarthasFruitStandTwo =
    divTileImgGenerator
        (unwrapPath
            "marthasFruitStandTwo"
            pathsValleyCultura
        )
        "Marthas Fruit Stand"
        "is-square"
        (ImageClick ValleyCultura "marthasFruitStandTwo")


divTileImgSunsetMinimart : Html Msg
divTileImgSunsetMinimart =
    divTileImgGenerator
        (unwrapPath "sunsetMinimart" pathsValleyCultura)
        "Sunset Minimart"
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
        "is-square"
        (ImageClick ValleyCultura "rodriguezFlowerShop")


divTileImgDigitalLandscape : Html Msg
divTileImgDigitalLandscape =
    divTileImgGenerator
        (unwrapPath "digitalLandscape" pathsValleyCultura)
        "Digital Landscape"
        "is-square"
        (ImageClick ValleyCultura "digitalLandscape")


divTileImgHablaTex : Html Msg
divTileImgHablaTex =
    divTileImgGenerator
        (unwrapPath "hablaTex" pathsValleyCultura)
        "Habla Tex"
        "is-square"
        (ImageClick ValleyCultura "hablaTex")


divTileImgMariaMarilyn : Html Msg
divTileImgMariaMarilyn =
    divTileImgGenerator
        (unwrapPath "mariaMarilyn" pathsValleyCultura)
        "Maria Marilyn"
        "is-square"
        (ImageClick ValleyCultura "mariaMarilyn")


divTileImgTheApparition : Html Msg
divTileImgTheApparition =
    divTileImgGenerator
        (unwrapPath "crossing" pathsValleyCultura)
        "The Apparition: Crossing"
        "is-square"
        (ImageClick ValleyCultura "crossing")


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child is-vertical" ]
        [ div [ class "title font-garamond" ] [ text "Artist Statement" ]
        , article [ class "content" ]
            [ p [ attributeTextAlign ] [ text valleyCulturaArtistStatement ] ]
        ]


divTileImgCrossing : Html Msg
divTileImgCrossing =
    divTileImgGenerator
        (unwrapPath "crossing" pathsValleyCultura)
        "The Apparition: Border Crossing"
        "is-square"
        (ImageClick ValleyCultura "crossing")



-- icons -----------------------------------------------------------------------


divTileIconHablaTex : Html Msg
divTileIconHablaTex =
    divTileIconGenerator
        divTileImgHablaTex
        "Habla Tex"
        "Sublimation on Aluminum\n48″x17″ 2016"


divTileIconRodriguezFlowerShop : Html Msg
divTileIconRodriguezFlowerShop =
    divTileIconGenerator
        divTileImgRodriguezFlowerShop
        "Rodriguez Flower Shop"
        "Sublimation on Aluminum\n48″x17″ 2016"


divTileIconElBombon : Html Msg
divTileIconElBombon =
    divTileIconGenerator
        divTileImgDigitalLandscape
        "El Bombon — Lucid Scape"
        "Sublimation on Aluminum\n48″x17″ 2016"


divTileIconMarthasFruitStand : Html Msg
divTileIconMarthasFruitStand =
    divTileIconGenerator
        divTileImgMarthasFruitStand
        "Martha's Fruit Stand"
        "Sublimation on Aluminum\n48″x17″ 2016"


divTileIconMarthasFruitStandTwo : Html Msg
divTileIconMarthasFruitStandTwo =
    divTileIconGenerator
        divTileImgMarthasFruitStandTwo
        "Martha's Fruit Stand"
        "Sublimation on Aluminum\n48″x17″ 2016"


divTileIconSunsetMinimart : Html Msg
divTileIconSunsetMinimart =
    divTileIconGenerator
        divTileImgSunsetMinimart
        "Sunset Minimart"
        "Sublimation on Aluminum\n48″x17″ 2016"


divTileIconDosMarias : Html Msg
divTileIconDosMarias =
    divTileIconGenerator
        divTileImgMariaMarilyn
        "Dos Marías"
        "Sublimation on Aluminum\n48″x17″ 2016"


divTileIconTheApparition : Html Msg
divTileIconTheApparition =
    divTileIconGenerator
        divTileImgCrossing
        "The Apparition:\nCrossing"
        "Sublimation on Aluminum\n48″x17″ 2016"



-- layout ----------------------------------------------------------------------


paddingRight : Attribute msg
paddingRight =
    style
        [ ( "padding-right", "120px" )
        ]


paddingTop : Attribute msg
paddingTop =
    style [ ( "padding-top", "66px" ) ]


paddingBottom : Attribute msg
paddingBottom =
    style [ ( "padding-bottom", "80px" ) ]


paddingLeft : Attribute msg
paddingLeft =
    style [ ( "padding-left", "120px" ) ]


divTileIsAncestorRowOne : Html Msg
divTileIsAncestorRowOne =
    div [ class "tile is-ancestor", paddingTop ]
        [ div [ class "tile", paddingLeft, paddingRight ] [ divTileIconHablaTex ]
        , div [ class "tile", paddingRight ] [ divTileIconRodriguezFlowerShop ]
        , div [ class "tile", paddingRight ] [ divTileIconElBombon ]
        , div [ class "tile", paddingRight ] [ divTileIconMarthasFruitStand ]
        ]


divTileIsAncestorRowTwo : Html Msg
divTileIsAncestorRowTwo =
    div [ class "tile is-ancestor", paddingTop ]
        [ div [ class "tile", paddingLeft, paddingRight ] [ divTileIconMarthasFruitStandTwo ]
        , div [ class "tile", paddingRight ] [ divTileIconSunsetMinimart ]
        , div [ class "tile", paddingRight ] [ divTileIconDosMarias ]
        , div [ class "tile", paddingRight ] [ divTileIconTheApparition ]
        ]


divtileIsAncestorRowThree : Html Msg
divtileIsAncestorRowThree =
    div [ class "tile is-ancestor", paddingTop ]
        [ div [ class "tile", paddingLeft, paddingRight ] [ divTileArtistStatement ]
        , div [ class "tile", paddingRight ] [ divTileMaterialsAndProcess ]
        ]


sectionValleyCultura : Html Msg
sectionValleyCultura =
    section
        [ class "section"
        , style
            [ ( "zoom", "0.8" )
            , ( "-moz-transform-origin", "top" )
            , ( "-moz-transform", "scale(0.8)" )
            ]
        ]
        [ div [ class "container" ]
            [ divTileIsAncestorRowOne
            ]
        ]
