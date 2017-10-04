module NavBar exposing (navNavBar)

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


-- styles


styleFontSize : Attribute msg
styleFontSize =
    style [ ( "font-size", "13px" ) ]


stylePaddingRight : Attribute msg
stylePaddingRight =
    style [ ( "padding-right", "10px" ) ]


imgLogo : Html msg
imgLogo =
    img
        [ src
            "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/ecmw_black.png"
        , alt "ecmw"
        , height 28
        ]
        []


aNavbarItem : Html msg
aNavbarItem =
    a
        [ class "navbar-item hvr-sink"
        , style [ ( "background-color", "white" ) ]
        , href "/Users/joseph/Code/Elm/corinnewhittemoredotcom/home.html"
        ]
        [ imgLogo ]


divNavbarBurger : Html msg
divNavbarBurger =
    div [ class "navbar-burger burger", attribute "data-target" "navMenubd" ]
        [ span [] []
        , span [] []
        , span [] []
        ]


divNavbarBrand : Html msg
divNavbarBrand =
    div [ class "navbar-brand" ] [ aNavbarItem, divNavbarBurger ]


navBreadcrumb : Html msg
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


divNavbarEnd : Html msg
divNavbarEnd =
    div [ class "navbar-end" ]
        [ navBreadcrumb ]


divNavbarMenu : Html msg
divNavbarMenu =
    div [ id "navMenubd", class "navbar-menu" ] [ divNavbarEnd ]


navNavBar : Html msg
navNavBar =
    nav [ class "navbar" ] [ divNavbarBrand, divNavbarMenu ]
