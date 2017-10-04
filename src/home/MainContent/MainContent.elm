module MainContent exposing (mainContent)

import Html exposing (Attribute, article, figure, Html, text, img, div, p)
import Html.Attributes exposing (class, style, src)
import MainCopy exposing (bioCopy)


-- Styles -----------------------------------------------------------------------
-- custom styles for appropriate padding within tiles:


attributeCenterPaddingCopy : Attribute msg
attributeCenterPaddingCopy =
    style
        [ ( "padding-left", "150px" )
        , ( "padding-right", "150px" )
        , ( "padding-top", "75px" )
        , ( "display", "flex" )
        , ( "flex-direction", "column" )
        , ( "justify-content", "center" )
        ]


attributeCenterPaddingImages : Attribute msg
attributeCenterPaddingImages =
    style
        [ ( "padding-left", "175px" )
        , ( "padding-top", "100px" )
        ]


attributeTopPaddingPaperDoll : Attribute msg
attributeTopPaddingPaperDoll =
    style [ ( "padding-top", "25px" ) ]


attributeZoomPaperDool : Attribute msg
attributeZoomPaperDool =
    style [ ( "zoom", "0.70" ) ]



-- Content ---------------------------------------------------------------------
-- biography copy:


divContent : Html msg
divContent =
    div [ class "content is-small" ]
        [ p [] [ text bioCopy ] ]



-- Tiles -----------------------------------------------------------------------
-- tile for biography copy:


divTileIs6Copy : Html msg
divTileIs6Copy =
    div
        [ class "tile is-6" ]
        [ div [ class "tile" ]
            [ article [ class "tile is-vertical", attributeCenterPaddingCopy ]
                [ p [ class "title is-size-2 font-garamond" ] [ text "Corinne Whittemore" ]
                , divContent
                ]
            ]
        ]



---- images in figure ------------------


figureImagePaperdoll : Html msg
figureImagePaperdoll =
    figure [ class "image is-480x853", attributeZoomPaperDool ] [ img [ src "./images/paperDoll3.jpg" ] [] ]



-- tile for the three images:


divTileIs6Image : Html msg
divTileIs6Image =
    div [ class "tile is-6", attributeCenterPaddingImages ]
        [ figureImagePaperdoll ]


divTileIsAncestor : Html msg
divTileIsAncestor =
    div [ class "tile is-ancestor" ]
        [ divTileIs6Copy
        , divTileIs6Image
        ]


mainContent : Html msg
mainContent =
    div [] [ divTileIsAncestor ]


main : Html msg
main =
    mainContent
