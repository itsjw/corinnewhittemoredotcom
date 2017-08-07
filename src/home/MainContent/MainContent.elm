module MainContent exposing (mainContent)

import Html exposing (Attribute, article, figure, Html, text, img, div, p)
import Html.Attributes exposing (class, style, src)
import MainCopy exposing (bioCopy)


attributeCenterPaddingCopy : Attribute msg
attributeCenterPaddingCopy =
    style
        [ ( "padding-left", "150px" )
        , ( "padding-right", "150px" )
        , ( "padding-top", "100px" )
        ]


attributeCenterPaddingImages : Attribute msg
attributeCenterPaddingImages =
    style
        [ ( "padding-left", "100px" )
        , ( "padding-right", "100px" )
        , ( "padding-top", "75px" )
        ]


duckImage : String
duckImage =
    "/Users/joseph/Code/Elm/corinnewhittemoredotcomTwo/images/duck.jpg"


turnupHeadImage : String
turnupHeadImage =
    "/Users/joseph/Code/Elm/corinnewhittemoredotcomTwo/images/turnupHead.jpg"


paperDollImage : String
paperDollImage =
    "/Users/joseph/Code/Elm/corinnewhittemoredotcomTwo/images/paperDoll3.jpg"



-- Content ---------------------------------------------------------------------


divContent : Html msg
divContent =
    div [ class "content is-small" ]
        [ p [] [ text bioCopy ] ]



-- Tiles -----------------------------------------------------------------------


divTileIs6Copy : Html msg
divTileIs6Copy =
    div [ class "tile is-6" ]
        [ div [ class "tile" ]
            [ article [ class "tile is-vertical", attributeCenterPaddingCopy ]
                [ p [ class "title" ] [ text "Corinne Whittemore" ]
                , divContent
                ]
            ]
        ]



---- images in figure ------------------


figureImagePaperdoll : Html msg
figureImagePaperdoll =
    figure [ class "image" ] [ img [ src paperDollImage ] [] ]


figureImageDuck : Html msg
figureImageDuck =
    figure [ class "image is-square" ] [ img [ src duckImage ] [] ]


figureImageTurnup : Html msg
figureImageTurnup =
    figure [ class "image is-square" ] [ img [ src turnupHeadImage ] [] ]



---- is-3 tiles ------------------------


divTileIs3Images : Html msg
divTileIs3Images =
    div [ class "tile is-parent is-vertical" ]
        [ div [ class "tile is-child" ] [ figureImageTurnup ]
        , div [ class "tile is-child" ] [ figureImageDuck ]
        ]


divTileIs3PaperDoll : Html msg
divTileIs3PaperDoll =
    div [ class "tile" ]
        [ div [ class "tile", style [ ( "padding-top", "50px" ) ] ] [ figureImagePaperdoll ] ]


divTileIs6Images : Html msg
divTileIs6Images =
    div [ class "tile is-6", attributeCenterPaddingImages ]
        [ divTileIs3Images, divTileIs3PaperDoll ]


divTileIsAncestor : Html msg
divTileIsAncestor =
    div [ class "tile is-ancestor" ]
        [ divTileIs6Copy
        , divTileIs6Images
        ]


mainContent : Html msg
mainContent =
    div [] [ divTileIsAncestor ]
