module MainContent exposing (content)

import Html exposing (Attribute, article, section, figure, Html, text, img, div, p)
import Html.Attributes exposing (class, style, src)
import MainCopy exposing (bioCopy)


-- Content -----------------------------------------------------------


content : Html msg
content =
    div [ class "container" ] [ sectionMainContent ]


attributeAlignCenter : Attribute msg
attributeAlignCenter =
    style [ ( "align-content", "center" ) ]



-- biography copy:


divContent : Html msg
divContent =
    div [ class "content is-small" ]
        [ p [] [ text bioCopy ] ]



-- Columns--------------------------------------------------------------
-- tile for biography copy:


divTileCopy : Html msg
divTileCopy =
    div
        [ class "tile"
        , attributeAlignCenter
        ]
        [ article
            [ class "tile is-child" ]
            [ p [ class "title is-size-2 font-garamond" ] [ text "Corinne Whittemore" ]
            , divContent
            ]
        ]



---- images in figure ------------------


figureImagePaperdoll : Html msg
figureImagePaperdoll =
    figure
        [ class "image is-210x373" ]
        [ img
            [ src "./images/paperDoll3_2_copy.png"
            ]
            []
        ]


divTileImg : Html msg
divTileImg =
    div [ class "tile" ]
        [ div [ class "tile is-child" ]
            [ figureImagePaperdoll
            ]
        ]



-- tile for the three images:


divTiles : Html msg
divTiles =
    div [ class "tile is-ancestor" ] [ divTileCopy, divTileImg ]


sectionMainContent : Html msg
sectionMainContent =
    section
        [ class "section"
        , attributeAlignCenter
        , style
            [ ( "padding-left", "10%" )
            , ( "padding-right", "10%" )
            ]
        ]
        [ divTiles ]
