module StudentWorkUtil exposing (navStudentNavBar)

import Html exposing (Html, div)
import NavBar exposing (navNavBar)


type alias ModalState =
    Bool


navStudentNavBar : ModalState -> msg -> Html msg
navStudentNavBar isModalActive msg =
    navNavBar isModalActive msg "../../images/ecmw_black.png"
