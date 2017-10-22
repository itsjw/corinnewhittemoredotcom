module Home exposing (..)

import Html exposing (div, Html, text)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Model exposing (..)
import Update exposing (..)
import NavBar exposing (navNavBar)
import MainContent exposing (content)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


homeNavBar : Bool -> Html Msg
homeNavBar status =
    navNavBar status Burger



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div [ class "main-container" ]
        [ homeNavBar model.isBurgerActive
        , MainContent.content
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
