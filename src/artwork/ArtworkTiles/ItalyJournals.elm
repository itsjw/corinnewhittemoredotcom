module ItalyJournals exposing (content)

import Html exposing (..)
import Html.Attributes exposing (..)
import ImagePaths exposing (ImagePaths, unwrapPath, pathsTheItalyJournal)
import Messages exposing (Msg(Bed, Bush, Period, Spent, Test))


content : Html msg
content =
    div [ id "italy-journals" ] [ sectionItalyJournals ]


figureImgBed : Html msg
figureImgBed =
    figure [ class "image is-401x502" ]
        [ img [ src <| unwrapPath "bed" pathsTheItalyJournal, alt "Bed" ] [] ]


figureImgBush : Html msg
figureImgBush =
    figure [ class "image is-401x502" ]
        [ img [ src <| unwrapPath "bush" pathsTheItalyJournal, alt "Bush" ] [] ]


figureImgPeriod : Html msg
figureImgPeriod =
    figure [ class "image is-401x502" ]
        [ img [ src <| unwrapPath "period" pathsTheItalyJournal, alt "Period" ] [] ]


figureImgSpent : Html msg
figureImgSpent =
    figure [ class "image is-401x502" ]
        [ img [ src <| unwrapPath "spent" pathsTheItalyJournal, alt "Spent" ] [] ]


figureImgTest : Html msg
figureImgTest =
    figure [ class "image is-401x502" ]
        [ img [ src <| unwrapPath "test" pathsTheItalyJournal, alt "Test" ] [] ]


divTileIs12 : Html msg
divTileIs12 =
    div [ class "tile is-12 is-parent" ]
        [ div [ class "tile is-child box" ] [ figureImgBed ]
        , div [ class "tile is-child box" ] [ figureImgBush ]
        , div [ class "tile is-child box" ] [ figureImgPeriod ]
        , div [ class "tile is-child box" ] [ figureImgSpent ]
        , div [ class "tile is-child box" ] [ figureImgTest ]
        ]


divTileItalyJournals : Html msg
divTileItalyJournals =
    div [ class "tile is-ancestor" ] [ divTileIs12 ]


sectionItalyJournals : Html msg
sectionItalyJournals =
    section [ class "section", style [ ( "zoom", "0.8" ) ] ]
        [ div [ class "container" ]
            [ divTileItalyJournals ]
        ]
