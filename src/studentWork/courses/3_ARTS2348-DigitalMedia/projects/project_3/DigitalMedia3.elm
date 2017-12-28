module DigitalMedia3 exposing (..)

import Html exposing (Html, button, text, div, img, ul, li, a, p)
import Keyboard
import CourseUtils
    exposing
        ( divProjectTabs
        , ActiveProjectTab
        , ActiveProjectTab(..)
        , sectionHeroStudentWork
        )
import NavBar exposing (navNavBar)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- init ------------------------------------------------------------------------


type alias Model =
    { isBurgerActive : Bool, isModalActive : Bool }


initialModel : Model
initialModel =
    { isBurgerActive = False, isModalActive = False }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )


type Msg
    = Burger
    | KeyMsg Keyboard.KeyCode



-- update ----------------------------------------------------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- enable esc to close modal:
        KeyMsg keyCode ->
            ( { model
                | isModalActive =
                    if keyCode == 27 && model.isModalActive then
                        False
                    else
                        False
              }
            , Cmd.none
            )

        -- show burger menu:
        Burger ->
            ( { model | isBurgerActive = not model.isBurgerActive }
            , Cmd.none
            )



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div []
        [ navNavBar
            model.isBurgerActive
            Burger
            "../../../../../../images/ecmw_black.png"
        , sectionHeroStudentWork "Digital Media"
        , divProjectTabs ProjectTab3
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Keyboard.presses KeyMsg ]
