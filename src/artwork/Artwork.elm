module Artwork exposing (..)

import Html exposing (Attribute, section, Html, text, div, ul, li, a)
import Html.Attributes exposing (class, style, href)
import Html.Events exposing (onClick)
import Hero exposing (sectionHeroArtwork)
import ItalyJournals exposing (content)
import ImportantPapers exposing (content)
import Messages exposing (..)
import Model exposing (..)
import Modal exposing (..)
import NavBar exposing (navNavBar)
import PrivateDisturbance exposing (content)
import Update exposing (..)
import ValleyCultura exposing (content)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- styles ----------------------------------------------------------------------


attributeFontSize : Attribute msg
attributeFontSize =
    style [ ( "font-size", "14px" ) ]


attributePaddingLeftRight : Attribute msg
attributePaddingLeftRight =
    style
        [ ( "padding-left", "150px" )
        , ( "padding-right", "150px" )
        ]



-- init ------------------------------------------------------------------------


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div [ toggleScrollDisable model ]
        [ div []
            [ navNavBar
            , sectionHeroArtwork
            , divTabs model
            , divArtworkContent model
            , divModal model
            ]
        ]



-- view validation -------------------------------------------------------------


type alias ClassTabs =
    { valleyCultura : String
    , privateDisturbance : String
    , theItalyJournals : String
    , importantPapers : String
    }


isActiveString : Model -> ClassTabs
isActiveString model =
    if model.tab == "ValleyCultura" then
        ClassTabs "is-active" "" "" ""
    else if model.tab == "PrivateDisturbance" then
        ClassTabs "" "is-active" "" ""
    else if model.tab == "TheItalyJournals" then
        ClassTabs "" "" "is-active" ""
    else
        ClassTabs "" "" "" "is-active"


divArtworkContent : Model -> Html Msg
divArtworkContent model =
    if model.tab == "ValleyCultura" then
        ValleyCultura.content
    else if model.tab == "PrivateDisturbance" then
        PrivateDisturbance.content
    else if model.tab == "TheItalyJournals" then
        ItalyJournals.content
    else
        ImportantPapers.content


divTabs : Model -> Html Msg
divTabs model =
    section [ attributePaddingLeftRight ]
        [ div
            [ class "tabs is-centered is-medium"
            , attributeFontSize
            ]
            [ ul []
                [ li [ class <| .valleyCultura <| isActiveString model ]
                    [ a [ href "#", onClick <| ValleyCultura ]
                        [ text "Valley Cultura" ]
                    ]
                , li [ class <| .privateDisturbance <| isActiveString model ]
                    [ a [ href "#", onClick <| PrivateDisturbance ]
                        [ text "Private Disturbance" ]
                    ]
                , li [ class <| .theItalyJournals <| isActiveString model ]
                    [ a [ href "#", onClick <| TheItalyJournals ]
                        [ text "The Italy Journals" ]
                    ]
                , li [ class <| .importantPapers <| isActiveString model ]
                    [ a [ href "#", onClick <| ImportantPapers ]
                        [ text "Important Papers" ]
                    ]
                ]
            ]
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
