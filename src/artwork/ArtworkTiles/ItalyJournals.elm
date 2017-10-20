module ItalyJournals exposing (content)

import Html exposing (..)
import Html.Attributes exposing (..)
import ImagePaths exposing (pathsTheItalyJournal)
import Util exposing (ImagePaths, unwrapPath)
import Messages
    exposing
        ( Msg(Bed, Bush, Period, Spent, Test)
        , divTileImgGenerator
        )


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
        Bed


divTileImgBush : Html Msg
divTileImgBush =
    divTileImgGenerator
        (unwrapPath "bush" pathsTheItalyJournal)
        "Bush"
        "is-401x502"
        Bush


divTileImgPeriod : Html Msg
divTileImgPeriod =
    divTileImgGenerator
        (unwrapPath "period" pathsTheItalyJournal)
        "Period"
        "is-401x502"
        Period


divTileImgSpent : Html Msg
divTileImgSpent =
    divTileImgGenerator
        (unwrapPath "spent" pathsTheItalyJournal)
        "Spent"
        "is-401x502"
        Spent


divTileImgTest : Html Msg
divTileImgTest =
    divTileImgGenerator
        (unwrapPath "test" pathsTheItalyJournal)
        "Test"
        "is-401x502"
        Test


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
    section [ class "section", style [ ( "zoom", "0.8" ) ] ]
        [ div [ class "container" ]
            [ divTileItalyJournals ]
        ]
