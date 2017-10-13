module ImagePaths exposing (..)

import Dict exposing (Dict)
import Util exposing (ImagePath, ImagePaths, artworkStrings, BulmaDimension)


pathsValleyCultura : ImagePaths
pathsValleyCultura =
    Dict.fromList
        [ ( "mariaMarilyn"
          , "../../images/artwork/valleyCultura/MariaMarilyn_thumb.png"
          )
        , ( "hablaTex"
          , "../../images/artwork/valleyCultura/HablaTex_thumb.png"
          )
        , ( "digitalLandscape"
          , "../../images/artwork/valleyCultura/DigitalLandscape_thumb.png"
          )
        , ( "rodriguezFlowerShop"
          , "../../images/artwork/valleyCultura/Rodriguez-Flower-Shop_thumb.png"
          )
        , ( "crossing"
          , "../../images/artwork/valleyCultura/crossing_thumb.png"
          )
        , ( "sunsetMinimart"
          , "../../images/artwork/valleyCultura/SunsetMiniMart_thumb.png"
          )
        , ( "marthasFruitStand"
          , "../../images/artwork/valleyCultura/MarthasFruitStand_thumb.png"
          )
        , ( "marthasFruitStandTwo"
          , "../../images/artwork/valleyCultura/MarthasFruitStand_thumb2.png"
          )
        ]


pathsPrivateDisturbance : ImagePaths
pathsPrivateDisturbance =
    Dict.fromList
        [ ( "excessiveForce"
          , "../../images/artwork/privateDisturbance/1_subtlePresence_thumb.png"
          )
        , ( "battleField"
          , "../../images/artwork/privateDisturbance/2_shiftingPerspective_thumb.png"
          )
        , ( "mindGames"
          , "../../images/artwork/privateDisturbance/3_mindGames_thumb.png"
          )
        , ( "shiftingPerspective"
          , "../../images/artwork/privateDisturbance/4_excessiveForce_thumb.png"
          )
        , ( "subtlePresence"
          , "../../images/artwork/privateDisturbance/5_battleField_thumb.png"
          )
        , ( "noPrisoners"
          , "../../images/artwork/privateDisturbance/6_noPrisoners_thumb.png"
          )
        ]


pathsTheItalyJournal : ImagePaths
pathsTheItalyJournal =
    Dict.fromList
        [ ( "bed"
          , "../../images/artwork/theItalyJournals/bed.gif"
          )
        , ( "bush"
          , "../../images/artwork/theItalyJournals/bush.gif"
          )
        , ( "period"
          , "../../images/artwork/theItalyJournals/period.gif"
          )
        , ( "spent"
          , "../../images/artwork/theItalyJournals/spent.gif"
          )
        , ( "test"
          , "../../images/artwork/theItalyJournals/test.gif"
          )
        ]


pathsImportantPapers : ImagePaths
pathsImportantPapers =
    Dict.fromList
        [ ( "importantPaper"
          , "../../images/artwork/importantPapers/importantPaper.jpg"
          )
        ]


artworkDimensionsMobile : Dict String BulmaDimension
artworkDimensionsMobile =
    let
        dimensions =
            [ -- Valley Cultura
              "is-720x255" -- Maria Marilyn
            , "is-720x255" -- Habla Tex
            , "is-720x255" -- Digital Landscape
            , "is-720x255" -- Rodriguez Flower Shop
            , "is-720x255" -- Crossing
            , "is-720x255" -- Sunset Minimart
            , "is-720x255" -- Marthas Fruitstand
            , "is-720x255" -- Marthas Fruitstand Two

            -- Private Disturbance
            , "is-720x103" -- Excessive Force
            , "is-720x103" -- Battle Field
            , "is-720x103" -- Mind Games
            , "is-720x103" -- Shifting Perspective
            , "is-720x103" -- Subtle Presence
            , "is-720x103" -- No Prisoners

            -- The Italy Journals
            , "is-720x900" -- bed
            , "is-720x900" -- bush
            , "is-720x900" -- period
            , "is-720x900" -- spent
            , "is-720x900" -- test

            -- Important Papers
            , ""

            -- Important Paper: No Dimension Implemented Yet because a
            -- dummy source
            ]
    in
        Dict.fromList <| List.map2 (,) artworkStrings dimensions


artworkDimensionsDesktop : Dict String BulmaDimension
artworkDimensionsDesktop =
    let
        dimensions =
            [ -- Valley Cultura
              "is-1024x364" -- Maria Marilyn
            , "is-1024x364" -- Habla Tex
            , "is-1024x364" -- Digital Landscape
            , "is-1024x364" -- Rodriguez Flowershop
            , "is-1024x364" -- Crossing
            , "is-1024x364" -- Sunset Minimart
            , "is-1024x364" -- Marthas Fruitstand
            , "is-1024x364" -- Marthas Fruitstand Two

            -- Private Disturbance
            , "is-1025x146" -- Excessive Force
            , "is-1025x146" -- Battle Field
            , "is-1025x146" -- Mind Games
            , "is-1025x146" -- Shifting Perspective
            , "is-1025x146" -- Subtle Presence
            , "is-1025x146" -- No Prisoners

            -- The Italy Journals
            , "is-615x768" -- Bed
            , "is-615x768" -- Bush
            , "is-615x768" -- Period
            , "is-615x768" -- Spent
            , "is-615x768" -- Test

            -- Important Papers
            , ""

            -- Important Paper: No Dimension Implemented Yet because a
            -- dummy source
            ]
    in
        Dict.fromList <| List.map2 (,) artworkStrings dimensions


allPathsHighRes : ImagePaths
allPathsHighRes =
    let
        highResPaths =
            [ -- Valley Cultura
              "../../images/artwork/valleyCultura/MariaMarilyn_2.png"
            , "../../images/artwork/valleyCultura/HablaTex.png"
            , "../../images/artwork/valleyCultura/DigitalLandscape.png"
            , "../../images/artwork/valleyCultura/Rodriguez-Flower-Shop.png"
            , "../../images/artwork/valleyCultura/crossing_2.png"
            , "../../images/artwork/valleyCultura/SunsetMiniMart.png"
            , "../../images/artwork/valleyCultura/MarthasFruitStand_2.png"
            , "../../images/artwork/valleyCultura/MarthasFruitStand3_2.png"

            -- Private Disturbance
            , "../../images/artwork/privateDisturbance/1_SubtlePresence.png"
            , "../../images/artwork/privateDisturbance/2_ShiftingPerspective.png"
            , "../../images/artwork/privateDisturbance/3_MindGames.png"
            , "../../images/artwork/privateDisturbance/4_ExcessiveForce.png"
            , "../../images/artwork/privateDisturbance/5_Battlefield.png"
            , "../../images/artwork/privateDisturbance/6_NoPrisoners.png"

            -- The Italy Journals
            , "../../images/artwork/theItalyJournals/bed.png"
            , "../../images/artwork/theItalyJournals/bush.png"
            , "../../images/artwork/theItalyJournals/period.png"
            , "../../images/artwork/theItalyJournals/spent.png"
            , "../../images/artwork/theItalyJournals/test.gif"

            -- Important Papers
            , "../../images/artwork/importantPapers/importantPaper.jpg"
            ]
    in
        Dict.fromList <| List.map2 (,) artworkStrings highResPaths



-- paths to thumbnails (low res):


allPaths : ImagePaths
allPaths =
    Dict.fromList <|
        Dict.toList pathsValleyCultura
            ++ Dict.toList pathsPrivateDisturbance
            ++ Dict.toList pathsTheItalyJournal
            ++ Dict.toList pathsImportantPapers
