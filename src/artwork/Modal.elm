module Modal exposing (divModal)

import Dict exposing (values)
import Html exposing (Attribute, section, figure, Html, div, img, button, a, text, em)
import Html.Attributes exposing (class, src, alt, attribute, style)
import Html.Events exposing (onClick)
import Model exposing (..)
import Messages exposing (Msg(CloseModal))
import ImagePaths exposing (allPathsHighRes)
import Util exposing (BulmaDimension, ImagePath)


attributeCenter : Attribute msg
attributeCenter =
    style
        [ ( "display", "flex" )
        , ( "justify-content", "center" )
        , ( "align-items", "center" )
        ]


imgInModal : ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
imgInModal path bulmaAttrsMobile bulmaAttrsDesktop =
    div []
        [ figure [ class <| "image is-unselectable is-hidden-tablet " ++ bulmaAttrsMobile ] [ img [ src path ] [] ]
        , figure
            [ class <| "image is-unselectable is-hidden-mobile " ++ bulmaAttrsDesktop ]
            [ img [ src path ] [] ]
        ]


divTileImageContainer : ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
divTileImageContainer path bulmaAttrsMobile bulmaAttrsDesktop =
    div [ class "tile is-child" ]
        [ imgInModal path
            bulmaAttrsMobile
            bulmaAttrsDesktop
        ]


divTileAncestor : ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
divTileAncestor path bulmaAttrsMobile bulmaAttrsDesktop =
    div [ class "tile is-ancestor" ]
        [ divTileImageContainer path bulmaAttrsMobile bulmaAttrsDesktop
        ]


divModalContent : ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
divModalContent path bulmaAttrsMobile bulmaAttrsDesktop =
    div
        [ class "modal-content"
        , style [ ( "overflow", "visible" ) ]
        ]
        [ divTileAncestor path bulmaAttrsMobile bulmaAttrsDesktop
        ]


divModalBackground : ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
divModalBackground path bulmaAttrsMobile bulmaAttrsDesktop =
    div [ class "modal-background", attributeCenter, onClick CloseModal ]
        [ divModalContent path
            bulmaAttrsMobile
            bulmaAttrsDesktop
        ]



-- button to deactivate modal


buttonCloseModal : Html Msg
buttonCloseModal =
    button
        [ class "modal-close is-large"
        , attribute "aria-label" "close"
        , onClick CloseModal
        ]
        []



-- parent modal div


attributeDisableScroll : Attribute msg
attributeDisableScroll =
    style
        [ ( "position", "absolute" )
        , ( "width", "100%" )
        , ( "height", "100%" )
        ]


divModal_ : Model -> ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
divModal_ model path bulmaAttrsMobile bulmaAttrsDesktop =
    div
        [ class <| "modal " ++ (isModalActiveString model) ]
        [ divModalBackground path bulmaAttrsMobile bulmaAttrsDesktop
        , buttonCloseModal
        ]


divModal : Model -> BulmaDimension -> BulmaDimension -> Html Msg
divModal model bulmaAttrsMobile bulmaAttrsDesktop =
    let
        -- unwrapping in an inelegant way
        -- i am open to suggestions...?
        theTrueVine : Dict.Dict String Bool
        theTrueVine =
            Dict.filter (\_ v -> v == True) model.activeArtwork

        trueVineAsList : List ( String, Bool )
        trueVineAsList =
            Dict.toList theTrueVine

        key : String
        key =
            case List.head trueVineAsList of
                Nothing ->
                    ""

                Just val ->
                    Tuple.first val

        imagePath : String
        imagePath =
            case Dict.get key allPathsHighRes of
                Nothing ->
                    ""

                Just path ->
                    path
    in
        divModal_ model imagePath bulmaAttrsMobile bulmaAttrsDesktop


isModalActive : Dict.Dict String Bool -> Bool
isModalActive d =
    List.any (\v -> v == True) <| Dict.values d



-- String which activates modal. See bulma
-- docs on Modal for details.


isModalActiveString : Model -> String
isModalActiveString model =
    if isModalActive model.activeArtwork then
        "is-active"
    else
        ""
