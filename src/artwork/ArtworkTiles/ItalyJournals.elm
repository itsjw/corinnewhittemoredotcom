module ItalyJournals exposing (content)

import Html exposing (..)
import Html.Attributes exposing (..)
import ImagePaths exposing (pathsTheItalyJournal)
import Util exposing (ImagePaths, unwrapPath, Series(TheItalyJournals))
import Messages exposing (Msg(ImageClick), divTileImgGenerator)


content : Html Msg
content =
    div [ id "italy-journals" ] [ sectionItalyJournals ]


divTileImgBed : Html Msg
divTileImgBed =
    divTileImgGenerator
        (unwrapPath
            "bed"
            pathsTheItalyJournal
        )
        "Bed"
        "is-401x502"
        (ImageClick TheItalyJournals "bed")


divTileImgBush : Html Msg
divTileImgBush =
    divTileImgGenerator
        (unwrapPath "bush" pathsTheItalyJournal)
        "Bush"
        "is-401x502"
        (ImageClick TheItalyJournals "bush")


divTileImgPeriod : Html Msg
divTileImgPeriod =
    divTileImgGenerator
        (unwrapPath "period" pathsTheItalyJournal)
        "Period"
        "is-401x502"
        (ImageClick TheItalyJournals "period")


divTileImgSpent : Html Msg
divTileImgSpent =
    divTileImgGenerator
        (unwrapPath "spent" pathsTheItalyJournal)
        "Spent"
        "is-401x502"
        (ImageClick TheItalyJournals "spent")


divTileImgTest : Html Msg
divTileImgTest =
    divTileImgGenerator
        (unwrapPath "test" pathsTheItalyJournal)
        "Test"
        "is-401x502"
        (ImageClick TheItalyJournals "test")


divLeftTileTop : Html Msg
divLeftTileTop =
    div [ class "tile" ] [ divTileImgSpent, divTileImgPeriod ]


divLeftTileBottom : Html Msg
divLeftTileBottom =
    div [ class "tile" ] [ divTileImgTest, divTileImgBed ]


divLeftTile : Html Msg
divLeftTile =
    div [ class "tile is-parent is-vertical" ] [ divLeftTileTop, divLeftTileBottom ]


divRightTile : Html Msg
divRightTile =
    div [ class "tile is-parent is-vertical" ] [ divTileImgBush ]


divTileItalyJournals : Html Msg
divTileItalyJournals =
    div [ class "tile is-ancestor" ] [ divLeftTile, divRightTile ]


sectionItalyJournals : Html Msg
sectionItalyJournals =
    section
        [ class "section"
        , style [ ( "zoom", "0.8" ), ( "-moz-transform", "scale(0.8)" ) ]
        ]
        [ div [ class "container" ]
            [ divTileItalyJournals ]
        ]
