module StudentWork exposing (..)

import Html exposing (Attribute, section, Html, text, div, ul, li, a)
import Html.Attributes exposing (class, style, href)
import Columns exposing (content)
import Hero exposing (sectionHeroStudentWork)
import Messages exposing (Msg(Burger))
import Model exposing (Model, init)
import StudentWorkUtil exposing (navStudentNavBar)
import Update exposing (update)


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



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div []
        [ navStudentNavBar model.isBurgerActive Burger
        , sectionHeroStudentWork
        , Columns.content
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
