module Home exposing (..)

import Html exposing (div, Html)
import Html.Attributes exposing (class)
import NavBar exposing (navNavBar)
import MainContent exposing (mainContent)


main : Html msg
main =
    div [ class "main-container" ]
        [ navNavBar, mainContent ]
