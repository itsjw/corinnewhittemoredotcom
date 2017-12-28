module ImagePaths
    exposing
        ( imagePaths
        , imageResolutions
        , imageTitles
        , imageTitlesToPaths
        )

import BulmaCarousel
    exposing
        ( BulmaResolution
        , ImageTitle
        , ImagePath
        , ImageNotFoundPath
        )
import Dict


imageTitles : List ImageTitle
imageTitles =
    [ "alyssa_rangel"
    , "ever"
    , "karely_gallegos"
    , "lauren_michelle"
    , "lisa_marie"
    , "salma"
    , "stephanie_r"
    , "valerie_dna"
    ]


imagePaths : List ImagePath
imagePaths =
    let
        basePath =
            "../../../../../../images/studentWork/3_ARTS2348-DigitalMedia/project_1/"
    in
        List.map (String.append basePath)
            [ "alyssa_rangel.gif"
            , "ever.gif"
            , "karely_gallegos.gif"
            , "lauren_michelle.gif"
            , "lisa_marie.gif"
            , "salma.gif"
            , "stephanie_r.gif"
            , "valerie_dna.gif"
            ]


imageResolutions : List BulmaResolution
imageResolutions =
    List.repeat (List.length imageTitles) "is-square"


imageTitlesToPaths_ : Dict.Dict ImageTitle ImagePath
imageTitlesToPaths_ =
    Dict.fromList <| List.map2 (,) imageTitles imagePaths


imageTitlesToPaths : ImageTitle -> ImageNotFoundPath -> ImagePath
imageTitlesToPaths keyTitle notFoundPath =
    case Dict.get keyTitle imageTitlesToPaths_ of
        Just path ->
            path

        Nothing ->
            notFoundPath
