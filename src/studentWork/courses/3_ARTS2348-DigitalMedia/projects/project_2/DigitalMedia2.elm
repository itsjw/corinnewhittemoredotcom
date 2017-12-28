module DigitalMedia2 exposing (..)

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
import DMProj2Content as C
import DMProj2Content exposing (content)
import DMImagePaths2
    exposing
        ( imageTitlesEver
        , imagePathsEver
        , imageResolutionsEver
        , imageTitlesSalma
        , imagePathsSalma
        , imageResolutionsSalma
        )
import Messages exposing (Msg(..), Project(..), Student(..))
import NavBar exposing (navNavBar)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type CurrentStudentModal
    = CurrentlyEver
    | CurrentlySalma
    | NoOne



-- init ------------------------------------------------------------------------


type alias Model =
    { carouselEver : Carousel
    , carouselSalma : Carousel
    , isBurgerActive : Bool
    , isModalActive : Bool
    , currentStudentModal : CurrentStudentModal
    }


initialModel : Model
initialModel =
    { carouselEver =
        C.carouselFromDicts
            (Dict.fromList <| List.map2 (,) imageTitlesEver imagePathsEver)
            (Dict.fromList <| List.map2 (,) imageTitlesEver imageResolutionsEver)
            ""
    , carouselSalma =
        C.carouselFromDicts
            (Dict.fromList <| List.map2 (,) imageTitlesSalma imagePathsSalma)
            (Dict.fromList <| List.map2 (,) imageTitlesSalma imageResolutionsSalma)
            ""
    , isBurgerActive = False
    , isModalActive = False
    , currentStudentModal = NoOne
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )



-- update ----------------------------------------------------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- No openmodal in project 2:
        OpenModal _ ->
            ( model, Cmd.none )

        -- move to next image:
        Next ->
            let
                model_ =
                    case model.currentStudentModal of
                        CurrentlySalma ->
                            { model | carouselSalma = C.next model.carouselSalma }

                        CurrentlyEver ->
                            { model | carouselEver = C.next model.carouselEver }

                        NoOne ->
                            model
            in
                ( model_, Cmd.none )

        -- move to previous image:
        Prev ->
            let
                model_ =
                    case model.currentStudentModal of
                        CurrentlySalma ->
                            { model | carouselSalma = C.previous model.carouselSalma }

                        CurrentlyEver ->
                            { model | carouselEver = C.previous model.carouselEver }

                        NoOne ->
                            model
            in
                ( model_, Cmd.none )

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

        SpecialModal project student titleKey ->
            let
                model_ =
                    case project of
                        Project2 ->
                            case student of
                                Salma ->
                                    { model
                                        | carouselSalma =
                                            C.begin titleKey
                                                model.carouselSalma
                                        , currentStudentModal =
                                            CurrentlySalma
                                    }

                                Ever ->
                                    { model
                                        | carouselEver =
                                            C.begin titleKey
                                                model.carouselEver
                                        , currentStudentModal =
                                            CurrentlyEver
                                    }

                        _ ->
                            model
            in
                ( { model_ | isModalActive = True }, Cmd.none )

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
        , divProjectTabs ProjectTab2
        , divModal model
        , C.content ""
        ]



-- launches model on active bool:


divModal : Model -> Html Msg
divModal model =
    let
        divModal__ =
            case model.currentStudentModal of
                CurrentlyEver ->
                    divModal_
                        model.isModalActive
                        model.carouselEver.currentPath
                        model.carouselEver.currentResolution
                        -- Clicked prev button sends Prev message:
                        Prev
                        -- Clicked prev button sends Next message:
                        Next
                        -- Clicked close button sends CloseModal messages:
                        CloseModal

                CurrentlySalma ->
                    divModal_
                        model.isModalActive
                        model.carouselSalma.currentPath
                        model.carouselSalma.currentResolution
                        -- Clicked prev button sends Prev message:
                        Prev
                        -- Clicked prev button sends Next message:
                        Next
                        -- Clicked close button sends CloseModal messages:
                        CloseModal

                NoOne ->
                    div [] []
    in
        divModal__



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Keyboard.presses KeyMsg ]
