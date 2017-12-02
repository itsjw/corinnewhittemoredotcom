module StudentWork exposing (..)

import Html exposing (Attribute, section, Html, text, div, ul, li, a)
import Html.Attributes exposing (class, style, href)
import Html.Events exposing (onClick)
import Hero exposing (sectionHeroStudentWork)
import Messages exposing (Msg(GraphicDesignOne, DesignOne, IndependentStudy))
import Model exposing (Model, init)
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



-- update ----------------------------------------------------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GraphicDesignOne ->
            ( "GraphicDesignOne"
            , Cmd.none
            )

        DesignOne ->
            ( "DesignOne"
            , Cmd.none
            )

        IndependentStudy ->
            ( "IndependentStudy"
            , Cmd.none
            )



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div []
        [ navNavBar
        , sectionHeroStudentWork
        , divTabs model
        , divArtworkContent model
        ]



-- view validation -------------------------------------------------------------


type alias ClassTabs =
    { graphicDesignOne : String
    , designOne : String
    , indepdentStudy : String
    }


isActiveString : Model -> ClassTabs
isActiveString model =
    if model == "GraphicDesignOne" then
        ClassTabs "is-active" "" ""
    else if model == "DesignOne" then
        ClassTabs "" "is-active" ""
    else
        ClassTabs "" "" "is-active"



-- currently returns empty content:
-- need to add which content is shown
-- when tab button is clicked


divArtworkContent : Model -> Html Msg
divArtworkContent model =
    if model == "GraphicDesignOne" then
        -- ValleyCultura.content
        div [] []
    else if model == "DesignOne" then
        -- PrivateDisturbance.content
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
                [ li [ class <| .indepdentStudy <| isActiveString model ]
                    [ a [ href "#", onClick <| IndependentStudy ]
                        [ text "Indepedent Study" ]
                    ]
                , li
                    [ class <| .graphicDesignOne <| isActiveString model ]
                    [ a [ href "#", onClick <| GraphicDesignOne ]
                        [ text "Graphic Design I" ]
                    ]
                , li [ class <| .designOne <| isActiveString model ]
                    [ a [ href "#", onClick <| DesignOne ]
                        [ text "Design I" ]
                    ]
                ]
            ]
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
