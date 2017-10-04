module ImagePaths exposing (..)

import Dict


type alias ImagePath =
    String


type alias ImagePaths =
    Dict.Dict String String


unwrapPath : String -> ImagePaths -> ImagePath
unwrapPath key paths =
    case Dict.get key paths of
        Nothing ->
            ""

        Just val ->
            val


pathsValleyCultura : ImagePaths
pathsValleyCultura =
    Dict.fromList
        [ ( "mariaMarilyn"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/MariaMarilyn_thumb.png"
          )
        , ( "hablaTex"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/HablaTex_thumb.png"
          )
        , ( "digitalLandscape"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/DigitalLandscape_thumb.png"
          )
        , ( "rodriguezFlowerShop"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/Rodriguez-Flower-Shop_thumb.png"
          )
        , ( "crossing"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/crossing_thumb.png"
          )
        , ( "sunsetMinimart"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/SunsetMiniMart_thumb2.png"
          )
        , ( "marthasFruitStand"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/MarthasFruitStand_thumb2.png"
          )
        , ( "marthasFruitStandTwo"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/valleyCultura/MarthasFruitStand3_2_thumb.png"
          )
        ]


pathsPrivateDisturbance : ImagePaths
pathsPrivateDisturbance =
    Dict.fromList
        [ ( "excessiveForce"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/privateDisturbance/4_excessiveForce_thumb.png"
          )
        , ( "battleField"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/privateDisturbance/5_battleField_thumb.png"
          )
        , ( "mindGames"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/privateDisturbance/3_mindGames_thumb.png"
          )
        , ( "shiftingPerspective"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/privateDisturbance/2_shiftingPerspective_thumb.png"
          )
        , ( "subtlePresence"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/privateDisturbance/1_subtlePresence_thumb.png"
          )
        , ( "noPrisoners"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/privateDisturbance/6_noPrisoners_thumb.png"
          )
        ]


pathsTheItalyJournal : ImagePaths
pathsTheItalyJournal =
    Dict.fromList
        [ ( "bed"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/theItalyJournals/bed.gif"
          )
        , ( "bush"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/theItalyJournals/bush.gif"
          )
        , ( "period"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/theItalyJournals/period.gif"
          )
        , ( "spent"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/theItalyJournals/spent.gif"
          )
        , ( "test"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/theItalyJournals/test.gif"
          )
        ]


pathsImportantPapers : ImagePaths
pathsImportantPapers =
    Dict.fromList
        [ ( "importantPaper"
          , "/Users/joseph/Code/Elm/corinnewhittemoredotcom/images/artwork/importantPapers/importantPaper.jpg"
          )
        ]


allPaths : ImagePaths
allPaths =
    Dict.fromList <|
        Dict.toList pathsValleyCultura
            ++ Dict.toList pathsPrivateDisturbance
            ++ Dict.toList pathsTheItalyJournal
            ++ Dict.toList pathsImportantPapers
