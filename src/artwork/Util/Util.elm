module Util exposing (..)

import Dict exposing (Dict)


-- Used to refer to respective artwork series


type Series
    = ValleyCultura
    | PrivateDisturbance
    | TheItalyJournals
    | ImportantPapers


type alias ArtworkTitle =
    String



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
