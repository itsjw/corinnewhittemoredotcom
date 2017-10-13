module Util exposing (..)

import Dict exposing (Dict)


-- This is just an alternative
-- String for an image in an href.


type alias ImagePath =
    String



-- holds image paths
-- Dictionary: (key : artworkString)
-- (value : pathString)


type alias ImagePaths =
    Dict.Dict String String



-- example HtmlAlt: "blah"


type alias HtmlAlt =
    String



-- example BulmaDimension: "is-169x142"


type alias BulmaDimension =
    String



-- artwork strings that identify a piece of
-- work within various sets
-- meant to zip into dictionary with other lists


artworkStrings : List String
artworkStrings =
    [ "mariaMarilyn" -- Valley Cultura
    , "hablaTex"
    , "digitalLandscape"
    , "rodriguezFlowerShop"
    , "crossing"
    , "sunsetMinimart"
    , "marthasFruitStand"
    , "marthasFruitStandTwo"
    , "excessiveForce" -- Private Disturbance
    , "battleField"
    , "mindGames"
    , "shiftingPerspective"
    , "subtlePresence"
    , "noPrisoners"
    , "bed" -- The Italy Journals
    , "bush"
    , "period"
    , "spent"
    , "test"
    , "importantPaper" -- Important Papers
    ]



-- Functions -------------------------------------------------------------------
--
--
--
--
-- unwraps a path from ImagePaths


unwrapPath : String -> ImagePaths -> ImagePath
unwrapPath key paths =
    case Dict.get key paths of
        Nothing ->
            ""

        Just val ->
            val


unwrapBulmaDimension : String -> Dict String BulmaDimension -> BulmaDimension
unwrapBulmaDimension key dimensions =
    case Dict.get key dimensions of
        Nothing ->
            ""

        Just val ->
            val
