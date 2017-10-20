module NavBar exposing (navNavBar, main, Msg, Model)

import Html.Events exposing (onClick)
import Html exposing (a, li, ul, img, div, nav, span, text, Html, Attribute)
import Html.Attributes
    exposing
        ( attribute
        , href
        , src
        , alt
        , class
        , height
        , style
        , id
        )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { burgerIsActive : Bool }


initialModel : Model
initialModel =
    { burgerIsActive = False }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )


type Msg
    = Burger


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Burger ->
            ( { model | burgerIsActive = not model.burgerIsActive }
            , Cmd.none
            )



-- styles --------------------------------------------------------------------


styleFontSize : Attribute msg
styleFontSize =
    style [ ( "font-size", "13px" ) ]


stylePaddingRight : Attribute msg
stylePaddingRight =
    style [ ( "padding-right", "10px" ) ]



-- content --------------------------------------------------------------------


imgLogo : String -> Html msg
imgLogo path =
    img
        [ src path
        , alt "ecmw"
        , height 28
        ]
        []


aNavbarItem : String -> Html msg
aNavbarItem path =
    a
        [ class "navbar-item hvr-sink"
        , style [ ( "background-color", "white" ) ]
        , href "/Users/joseph/Code/Elm/corinnewhittemoredotcom/home.html"
        ]
        [ imgLogo path ]


divNavbarBurger : Model -> Html Msg
divNavbarBurger model =
    div
        [ class <| navBarActiveStr model
        , attribute "data-target"
            "navMenubd"
        , onClick Burger
        ]
        [ span [] []
        , span [] []
        , span [] []
        ]


divNavbarBrand : Model -> String -> Html Msg
divNavbarBrand model path =
    div [ class "navbar-brand" ] [ aNavbarItem path, divNavbarBurger model ]


navBreadcrumb : Html Msg
navBreadcrumb =
    nav [ class "breadcrumb", styleFontSize, stylePaddingRight, attribute "aira-label" "breadcrumbs" ]
        [ ul []
            [ li []
                [ a
                    [ href
                        "/Users/joseph/Code/Elm/corinnewhittemoredotcom/src/artwork/artwork.html"
                    ]
                    [ text "Artwork" ]
                ]
            , li []
                [ a
                    [ href
                        "/Users/joseph/Code/Elm/corinnewhittemoredotcom/src/design/design.html"
                    ]
                    [ text "Design" ]
                ]
            , li []
                [ a
                    [ href
                        "/Users/joseph/Code/Elm/corinnewhittemoredotcom/src/studentWork/studentwork.html"
                    ]
                    [ text "Student Work" ]
                ]
            , li [] [ a [ href "#" ] [ text "Contact" ] ]
            ]
        ]


divNavbarEnd : Html Msg
divNavbarEnd =
    div [ class "navbar-end" ]
        [ navBreadcrumb ]


divNavbarMenu : Html Msg
divNavbarMenu =
    div [ id "navMenubd", class "navbar-menu" ] [ divNavbarEnd ]


navNavBar : Model -> String -> Html Msg
navNavBar model path =
    nav [ class "navbar" ] [ divNavbarBrand model path, divNavbarMenu ]


view : Model -> Html Msg
view model =
    div [ class "main-container" ]
        [ navNavBar model "../../../images/ecmw_black.png" ]



-- view validation -------------------------------------------------------------


navBarActiveStr : Model -> String
navBarActiveStr model =
    if model.burgerIsActive then
        "navbar-burger burger is-active"
    else
        "navbar-burger burger"


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
