module Update exposing (..)

import Dict
import Messages exposing (..)
import Model exposing (..)
import Dom.Scroll
import Dom exposing (Error)
import Task exposing (Task)
import Util exposing (Series(..))
import ImagePaths
    exposing
        ( ArtworkModal
        , updateModal
        , modalValleyCultura
        , modalPrivateDisturbance
        , modalItalyJournals
        , modalImportantPapers
        , modalPrevImg
        , modalNextImg
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- Tabs: -----------------------
        Tab series ->
            let
                activeTabString =
                    case series of
                        ValleyCultura ->
                            "ValleyCultura"

                        PrivateDisturbance ->
                            "PrivateDisturbance"

                        TheItalyJournals ->
                            "TheItalyJournals"

                        ImportantPapers ->
                            "ImportantPapers"
            in
                ( { model | tab = activeTabString }
                , Cmd.none
                )

        ImageClick series title ->
            let
                update =
                    case series of
                        ValleyCultura ->
                            let
                                modelUpdate =
                                    activateModal model.modalValleyCultura title model
                            in
                                { modelUpdate
                                    | modalValleyCultura =
                                        ImagePaths.updateModal title
                                            model.modalValleyCultura
                                }

                        PrivateDisturbance ->
                            let
                                modelUpdate =
                                    activateModal model.modalPrivateDisturbance title model
                            in
                                { modelUpdate
                                    | modalPrivateDisturbance =
                                        ImagePaths.updateModal title
                                            model.modalPrivateDisturbance
                                }

                        TheItalyJournals ->
                            let
                                modelUpdate =
                                    activateModal model.modalTheItalyJournals title model
                            in
                                { modelUpdate
                                    | modalTheItalyJournals =
                                        ImagePaths.updateModal title
                                            model.modalTheItalyJournals
                                }

                        ImportantPapers ->
                            let
                                modelUpdate =
                                    activateModal model.modalImportantPapers title model
                            in
                                { modelUpdate
                                    | modalImportantPapers =
                                        ImagePaths.updateModal title
                                            model.modalImportantPapers
                                }
            in
                ( { update
                    | disableScroll = True
                    , modalIsActive = True
                  }
                , Cmd.none
                )

        CloseModal ->
            ( { model
                | activeArtwork = ""
                , disableScroll = False

                -- , imageIndex = -1
                , modalDisplay = Nothing
                , modalIsActive = False
              }
            , Task.attempt (always NoOp) (Dom.Scroll.toY "bb" model.windowPos)
            )

        GetScrollPos ->
            ( model
            , Task.attempt attemptGetY (Dom.Scroll.y "bb")
            )

        NewPos p ->
            ( { model | windowPos = p }
            , Cmd.none
            )

        ErrOnGetScroll s ->
            ( { model | errors = s }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )

        -- enable esc to close modal:
        KeyMsg keyCode ->
            ( { model
                | modalIsActive =
                    if keyCode == 27 && model.modalIsActive then
                        False
                    else
                        False
                , disableScroll =
                    if keyCode == 27 && model.modalIsActive then
                        False
                    else
                        model.disableScroll
                , activeArtwork =
                    if keyCode == 27 && model.modalIsActive then
                        ""
                    else
                        model.activeArtwork
                , modalDisplay =
                    if keyCode == 27 && model.modalIsActive then
                        Nothing
                    else
                        model.modalDisplay
              }
            , Task.attempt (always NoOp) (Dom.Scroll.toY "bb" model.windowPos)
            )

        Burger ->
            ( { model | isBurgerActive = not model.isBurgerActive }
            , Cmd.none
            )

        ImgNext ->
            ( { model
                | modalDisplay =
                    case model.modalDisplay of
                        Just modal ->
                            Just (modalNextImg modal)

                        Nothing ->
                            Nothing
                , activeArtwork =
                    case model.modalDisplay of
                        Just modal ->
                            modal.currentPath

                        Nothing ->
                            ""
              }
            , Cmd.none
            )

        ImgPrevious ->
            ( { model
                | modalDisplay =
                    case model.modalDisplay of
                        Just modal ->
                            Just (modalPrevImg modal)

                        Nothing ->
                            Nothing
                , activeArtwork =
                    case model.modalDisplay of
                        Just modal ->
                            modal.currentPath

                        Nothing ->
                            ""
              }
            , Cmd.none
            )


attemptGetY : Result Error Float -> Msg
attemptGetY r =
    case r of
        Ok val ->
            NewPos val

        Err val ->
            ErrOnGetScroll <| toString val


activateModal : ArtworkModal -> String -> Model -> Model
activateModal modal title model =
    { model
        | activeArtwork =
            case
                Dict.get title
                    modal.titlesToPaths
            of
                Just path ->
                    path

                Nothing ->
                    "notfound.png"

        {--, modalValleyCultura =
          -     ImagePaths.updateModal title model.modalValleyCultura --}
        , modalDisplay =
            Just
                { modal
                    | currentTitle = title
                    , currentPath =
                        case
                            Dict.get title
                                modal.titlesToPaths
                        of
                            Just path ->
                                path

                            Nothing ->
                                "notfound.png"
                    , currentIndex =
                        case
                            Dict.get title
                                modal.titlesToIndex
                        of
                            Just index ->
                                index

                            Nothing ->
                                -1
                }
    }
