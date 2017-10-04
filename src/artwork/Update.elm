module Update exposing (..)

import Messages exposing (..)
import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- Tabs: -----------------------
        ValleyCultura ->
            ( { model | tab = "ValleyCultura" }
            , Cmd.none
            )

        PrivateDisturbance ->
            ( { model | tab = "PrivateDisturbance" }
            , Cmd.none
            )

        TheItalyJournals ->
            ( { model | tab = "TheItalyJournals" }
            , Cmd.none
            )

        ImportantPapers ->
            ( { model | tab = "ImportantPapers" }
            , Cmd.none
            )

        -- Images: ValleyCultura -------
        MariaMarilyn ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "mariaMarilyn"
                , disableScroll = True
              }
            , Cmd.none
            )

        HablaTex ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "hablaTex"
                , disableScroll = True
              }
            , Cmd.none
            )

        DigitalLandscape ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "digitalLandscape"
                , disableScroll = True
              }
            , Cmd.none
            )

        RodriguezFlowerShop ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "rodriguezFlowerShop"
                , disableScroll = True
              }
            , Cmd.none
            )

        Crossing ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "crossing"
                , disableScroll = True
              }
            , Cmd.none
            )

        SunsetMinimart ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "sunsetMinimart"
                , disableScroll = True
              }
            , Cmd.none
            )

        MarthasFruitStand ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "marthasFruitStand"
                , disableScroll = True
              }
            , Cmd.none
            )

        MarthasFruitStandTwo ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "marthasFruitStandTwo"
                , disableScroll = True
              }
            , Cmd.none
            )

        -- Images: PrivateDisturbance --
        ExcessiveForce ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "excessiveForce"
                , disableScroll = True
              }
            , Cmd.none
            )

        BattleField ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "battleField"
                , disableScroll = True
              }
            , Cmd.none
            )

        MindGames ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "mindGames"
                , disableScroll = True
              }
            , Cmd.none
            )

        ShiftingPerspective ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "shiftingPerspective"
                , disableScroll = True
              }
            , Cmd.none
            )

        SubtlePresence ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "subtlePresence"
                , disableScroll = True
              }
            , Cmd.none
            )

        NoPrisoners ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "noPrisoners"
                , disableScroll = True
              }
            , Cmd.none
            )

        Bed ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "bed"
                , disableScroll = True
              }
            , Cmd.none
            )

        Bush ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "bush"
                , disableScroll = True
              }
            , Cmd.none
            )

        Period ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "period"
                , disableScroll = True
              }
            , Cmd.none
            )

        Spent ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "spent"
                , disableScroll = True
              }
            , Cmd.none
            )

        Test ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "test"
                , disableScroll = True
              }
            , Cmd.none
            )

        ImportantPaper ->
            ( { model
                | activeArtwork =
                    invertActiveArtwork model.activeArtwork
                        "importantPaper"
                , disableScroll = True
              }
            , Cmd.none
            )

        CloseModal ->
            ( { model
                | activeArtwork = deactivateModal
                , disableScroll = False
              }
            , Cmd.none
            )
