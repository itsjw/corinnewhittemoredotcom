module NavBar exposing (navNavBar)

import Html exposing (a, img, div, nav, Html)
import Html.Attributes exposing (href, src, alt, class, height)


imgLogo : Html msg
imgLogo =
    img [ src "/Users/joseph/Code/Elm/corinnewhittemoredotcomTwo/images/ecmw_black.png", alt "ecmw", height 28 ] []


aNavBarItem : Html msg
aNavBarItem =
    a [ class "navbar-item", href "http://corinnewhittemore.com" ]
        [ imgLogo ]


divNavBarBrand : Html msg
divNavBarBrand =
    div [ class "navbar-brand" ] [ aNavBarItem ]


navNavBar : Html msg
navNavBar =
    nav [ class "navbar" ] [ divNavBarBrand ]
