module DigitalMedia exposing (..)

import Dict
import Html exposing (Html, button, text, div, img, ul, li, a, p)
import Keyboard
import List
import BulmaCarousel as C
import BulmaCarousel exposing (..)
import CourseUtils
    exposing
        ( divProjectTabs
        , divModal_
        , ActiveProjectTab
        , ActiveProjectTab(..)
        , sectionHeroStudentWork
        )
import Content as C
import Content exposing (content)
import ImagePaths exposing (imageTitles, imagePaths, imageResolutions)
import Messages exposing (Msg(..))
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
    { carousel : Carousel
    , isBurgerActive : Bool
    , isModalActive : Bool
    }


initialModel : Model
initialModel =
    { carousel =
        C.carouselFromDicts
            (Dict.fromList <| List.map2 (,) imageTitles imagePaths)
            (Dict.fromList <| List.map2 (,) imageTitles imageResolutions)
            "../../imagez/"
    , isBurgerActive = False
    , isModalActive = False
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )



-- update ----------------------------------------------------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- open modal window:
        OpenModal key ->
            ( { model
                | isModalActive = True
                , carousel = C.begin key model.carousel
              }
            , Cmd.none
            )

        -- move to next image:
        Next ->
            ( { model
                | carousel = C.next model.carousel
              }
            , Cmd.none
            )

        -- move to previous image:
        Prev ->
            ( { model
                | carousel = C.previous model.carousel
              }
            , Cmd.none
            )

        -- close modal window:
        CloseModal ->
            ( { model | isModalActive = False }, Cmd.none )

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

        -- does nothing on project 1 page.
        SpecialModal _ _ _ ->
            ( model, Cmd.none )



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div []
        [ navNavBar
            model.isBurgerActive
            Burger
            "../../../../../../images/ecmw_black.png"
        , sectionHeroStudentWork "Digital Media"
        , divProjectTabs ProjectTab1
        , divModal model
        , C.content model.carousel.notFoundImagePath
        ]



-- launches model on active bool:


divModal : Model -> Html Msg
divModal model =
    divModal_
        model.isModalActive
        model.carousel.currentPath
        model.carousel.currentResolution
        -- Clicked prev button sends Prev message:
        Prev
        -- Clicked prev button sends Next message:
        Next
        -- Clicked close button sends CloseModal messages:
        CloseModal



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Keyboard.presses KeyMsg ]
