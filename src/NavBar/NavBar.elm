module NavBar exposing (navNavBar)

import Html exposing (a, li, ul, img, div, nav, span, text, Html, Attribute)
import Html.Events exposing (onClick)
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


-- styles


styleFontSize : Attribute msg
styleFontSize =
    style [ ( "font-size", "13px" ) ]


stylePaddingRight : Attribute msg
stylePaddingRight =
    style [ ( "padding-right", "10px" ) ]


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
        , href "../home/home.html"
        ]
        [ imgLogo path ]


divNavbarBurger : Bool -> msg -> Html msg
divNavbarBurger status msg =
    div
        [ class <| isBurgerActiveCrossStr status
        , attribute "data-target" "navMenubd"
        , onClick msg
        ]
        [ span [] []
        , span [] []
        , span [] []
        ]


divNavbarBrand : Bool -> msg -> String -> Html msg
divNavbarBrand status msg path =
    div [ class "navbar-brand" ] [ aNavbarItem path, divNavbarBurger status msg ]


navBreadcrumb : Html msg
navBreadcrumb =
    nav [ class "breadcrumb", styleFontSize, stylePaddingRight, attribute "aira-label" "breadcrumbs" ]
        [ ul []
            [ li []
                [ a
                    [ href
                        "../artwork/artwork.html"
                    ]
                    [ text "Artwork" ]
                ]
            , li []
                [ a
                    [ href
                        "../design/design.html"
                    ]
                    [ text "Design" ]
                ]
            , li []
                [ a
                    [ href
                        "../studentWork/studentwork.html"
                    ]
                    [ text "Student Work" ]
                ]
            , li [] [ a [ href "#" ] [ text "Contact" ] ]
            ]
        ]


divNavbarEnd : Html msg
divNavbarEnd =
    div [ class "navbar-end" ]
        [ navBreadcrumb ]


divNavbarMenu : Bool -> Html msg
divNavbarMenu status =
    div [ id "navMenubd", class <| isBurgerActiveMenuStr status ] [ divNavbarEnd ]


navNavBar : Bool -> msg -> Html msg
navNavBar status msg =
    nav [ class "navbar" ]
        [ divNavbarBrand
            status
            msg
            "../../images/ecmw_black.png"
        , divNavbarMenu status
        ]



-- validation


isBurgerActiveCrossStr : Bool -> String
isBurgerActiveCrossStr active =
    if active then
        "navbar-burger burger is-active"
    else
        "navbar-burger burger"


isBurgerActiveMenuStr : Bool -> String
isBurgerActiveMenuStr active =
    if active then
        "navbar-menu is-active"
    else
        "navbar-menu"
