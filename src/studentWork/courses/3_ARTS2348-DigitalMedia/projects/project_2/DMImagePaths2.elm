module DMImagePaths2
    exposing
        ( imagePathsEver
        , imageResolutionsEver
        , imageTitlesEver
        , imageTitlesToPathsEver
        , imagePathsSalma
        , imageResolutionsSalma
        , imageTitlesSalma
        , imageTitlesToPathsSalma
        )

import BulmaCarousel
    exposing
        ( BulmaResolution
        , ImageTitle
        , ImagePath
        , ImageNotFoundPath
        )
import Dict


imageTitlesEver : List ImageTitle
imageTitlesEver =
    [ "one"
    , "two"
    , "four"
    , "five"
    , "six"
    , "seven"
    , "eight"
    , "nine"
    ]


imageTitlesSalma : List ImageTitle
imageTitlesSalma =
    [ "one", "two", "three", "four", "five", "six" ]


imagePathsEver : List ImagePath
imagePathsEver =
    let
        basePath =
            "../../../../../../images/studentWork/3_ARTS2348-DigitalMedia/project_2/ever/"
    in
        List.map (String.append basePath)
            [ "1.jpg", "2.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg" ]


imagePathsSalma : List ImagePath
imagePathsSalma =
    let
        basePath =
            "../../../../../../images/studentWork/3_ARTS2348-DigitalMedia/project_2/salma/"
    in
        List.map (String.append basePath)
            [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg" ]


imageResolutionsEver : List BulmaResolution
imageResolutionsEver =
    List.repeat (List.length imageTitlesEver) "is-750x500"


imageResolutionsSalma : List ImagePath
imageResolutionsSalma =
    List.repeat (List.length imageTitlesSalma) "is-750x500"


imageTitlesToPathsEver_ : Dict.Dict ImageTitle ImagePath
imageTitlesToPathsEver_ =
    Dict.fromList <| List.map2 (,) imageTitlesEver imagePathsEver


imageTitlesToPathsSalma_ : Dict.Dict ImageTitle ImagePath
imageTitlesToPathsSalma_ =
    Dict.fromList <| List.map2 (,) imageTitlesSalma imagePathsSalma


imageTitlesToPathsEver : ImageTitle -> ImageNotFoundPath -> ImagePath
imageTitlesToPathsEver keyTitle notFoundPath =
    case Dict.get keyTitle imageTitlesToPathsEver_ of
        Just path ->
            path

        Nothing ->
            notFoundPath


imageTitlesToPathsSalma : ImageTitle -> ImageNotFoundPath -> ImagePath
imageTitlesToPathsSalma keyTitle notFoundPath =
    case Dict.get keyTitle imageTitlesToPathsSalma_ of
        Just path ->
            path

        Nothing ->
            notFoundPath
