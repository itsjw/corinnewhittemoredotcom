module BulmaCarousel
    exposing
        ( BulmaResolution
        , Carousel
        , ImageNotFoundPath
        , ImagePath
        , ImageTitle
        , carouselFromDicts
        , begin
        , next
        , previous
        )

import List as L
import Array as A
import Dict as D


-- image path should be a string denoting a directory
-- example:
-- "../images/myImage.jpg"


type alias ImagePath =
    String



-- the image title can be a string of your choosing


type alias ImageTitle =
    String



-- bulma resolution exampe:
-- "is-16by9"
-- "is-300x300"
-- or refer to bulma Elements/Image docs


type alias BulmaResolution =
    String



-- the image title can be a string of your choosing


type alias ImageNotFoundPath =
    String


type alias Carousel =
    { titlesToPaths : D.Dict ImageTitle ImagePath
    , titlesToIndices : D.Dict ImageTitle Int
    , titles : List ImageTitle
    , paths : A.Array ImagePath
    , size : Int
    , currentIndex : Int
    , currentPath : ImagePath
    , currentTitle : ImageTitle
    , currentResolution : BulmaResolution
    , notFoundImagePath : ImagePath
    , titlesToBulmaResolutions : D.Dict ImageTitle BulmaResolution
    }


carouselFromDicts :
    D.Dict ImageTitle ImagePath
    -> D.Dict ImageTitle BulmaResolution
    -> ImageNotFoundPath
    -> Carousel
carouselFromDicts titlesToImages titlesToResolutions imgNotFoundPath =
    let
        size_ =
            D.size titlesToImages
    in
        { titlesToPaths = titlesToImages
        , titlesToIndices =
            (D.fromList <|
                L.map2 (,)
                    (D.keys titlesToImages)
                    (L.range 0 size_)
            )
        , titles = D.keys titlesToImages
        , paths = A.fromList <| D.values titlesToImages
        , size = size_
        , currentIndex = -1
        , currentPath = ""
        , currentTitle = ""
        , currentResolution = ""
        , notFoundImagePath = imgNotFoundPath
        , titlesToBulmaResolutions = titlesToResolutions
        }


begin : ImageTitle -> Carousel -> Carousel
begin title carousel =
    { carousel
        | currentTitle = title
        , currentPath =
            case D.get title carousel.titlesToPaths of
                Just path ->
                    path

                Nothing ->
                    carousel.notFoundImagePath
        , currentIndex =
            case D.get title carousel.titlesToIndices of
                Just index ->
                    index

                Nothing ->
                    -1
    }


type Direction
    = Next
    | Previous


updateIndexPosition : Direction -> Carousel -> Carousel
updateIndexPosition direction carousel =
    case direction of
        Next ->
            let
                nextIndex =
                    (carousel.currentIndex + 1) % carousel.size

                nextPath =
                    case A.get nextIndex carousel.paths of
                        Just path ->
                            path

                        Nothing ->
                            carousel.notFoundImagePath
            in
                { carousel
                    | currentIndex = nextIndex
                    , currentPath = nextPath
                }

        Previous ->
            let
                prevIndex =
                    (carousel.currentIndex - 1) % carousel.size

                prevPath =
                    case A.get prevIndex carousel.paths of
                        Just path ->
                            path

                        Nothing ->
                            ""
            in
                { carousel
                    | currentIndex = prevIndex
                    , currentPath = prevPath
                }


next : Carousel -> Carousel
next carousel =
    updateIndexPosition Next carousel


previous : Carousel -> Carousel
previous carousel =
    updateIndexPosition Previous carousel
