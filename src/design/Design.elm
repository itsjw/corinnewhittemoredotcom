module Design exposing (..)

import Html exposing (Attribute, section, Html, text, div, ul, li, a)
import Html.Attributes exposing (class, style, href)
import Html.Events exposing (onClick)
import Hero exposing (sectionHeroDesign)
import NavBar exposing (navNavBar)


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


type alias Model =
    String


initialModel : Model
initialModel =
    "ValleyCultura"


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )



-- update ----------------------------------------------------------------------


type Msg
    = ValleyCultura
    | PrivateDisturbance
    | TheItalyJournals
    | ImportantPapers


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ValleyCultura ->
            ( "ValleyCultura"
            , Cmd.none
            )

        PrivateDisturbance ->
            ( "PrivateDisturbance"
            , Cmd.none
            )

        TheItalyJournals ->
            ( "TheItalyJournals"
            , Cmd.none
            )

        ImportantPapers ->
            ( "ImportantPapers"
            , Cmd.none
            )



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div []
        [ navNavBar
        , sectionHeroDesign
        , divTabs model
        , divArtworkContent model
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
    if model == "ValleyCultura" then
        ClassTabs "is-active" "" "" ""
    else if model == "PrivateDisturbance" then
        ClassTabs "" "is-active" "" ""
    else if model == "TheItalyJournals" then
        ClassTabs "" "" "is-active" ""
    else
        ClassTabs "" "" "" "is-active"



-- currently returns empty content:


divArtworkContent : Model -> Html Msg
divArtworkContent model =
    if model == "ValleyCultura" then
        -- ValleyCultura.content
        div [] []
    else if model == "PrivateDisturbance" then
        -- PrivateDisturbance.content
        div [] []
    else if model == "TheItalyJournals" then
        -- ItalyJournals.content
        div [] []
    else
        -- ImportantPapers.content
        div [] []


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
                        [ text "Logos" ]
                    ]
                , li [ class <| .privateDisturbance <| isActiveString model ]
                    [ a [ href "#", onClick <| PrivateDisturbance ]
                        [ text "Digital Photography" ]
                    ]
                , li [ class <| .theItalyJournals <| isActiveString model ]
                    [ a [ href "#", onClick <| TheItalyJournals ]
                        [ text "Identity" ]
                    ]
                , li [ class <| .importantPapers <| isActiveString model ]
                    [ a [ href "#", onClick <| ImportantPapers ]
                        [ text "Book Covers" ]
                    ]
                ]
            ]
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
