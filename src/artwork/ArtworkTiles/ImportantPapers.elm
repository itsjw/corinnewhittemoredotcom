module ImportantPapers exposing (content)

import Html exposing (..)
import Html.Attributes exposing (..)
import ImagePaths exposing (pathsImportantPapers)
import Messages exposing (Msg(ImageClick), divTileImgGenerator)
import Util exposing (unwrapPath, Series(ImportantPapers))


content : Html Msg
content =
    div [] [ sectionImportantPapers ]


divTileImgImportantPaper : Html Msg
divTileImgImportantPaper =
    divTileImgGenerator
        (unwrapPath "importantPaper" pathsImportantPapers)
        "Important Papers"
        "is-1024x563"
        (ImageClick ImportantPapers "importantPaper")


dummyTile : Html msg
dummyTile =
    div [ class "tile" ] []


divTileImportantPaperContainer : Html Msg
divTileImportantPaperContainer =
    div [ class "tile is-parent is-vertical" ]
        [ dummyTile
        , dummyTile
        , divTileImgImportantPaper
        ]


divTileImportantPapers : Html Msg
divTileImportantPapers =
    div [ class "tile is-ancestor" ]
        [ divTileImportantPaperContainer
        ]


sectionImportantPapers : Html Msg
sectionImportantPapers =
    section
        [ class "section"
        , style [ ( "zoom", "0.8" ), ( "-moz-transform", "scale(0.8)" ) ]
        ]
        [ div [ class "container" ] [ divTileImportantPapers ] ]
