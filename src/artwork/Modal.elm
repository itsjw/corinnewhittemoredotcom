module Modal exposing (divModal)

import Dict exposing (values)
import Html exposing (Attribute, Html, div, img, button, a)
import Html.Attributes exposing (class, src, alt, attribute, style)
import Html.Events exposing (onClick)
import Model exposing (..)
import Messages exposing (Msg(CloseModal))
import ImagePaths exposing (ImagePaths, ImagePath, allPaths)


attributeCenter : Attribute msg
attributeCenter =
    style
        [ ( "display", "flex" )
        , ( "justify-content", "center" )
        , ( "align-items", "center" )
        ]


imgInModal : String -> String -> Html Msg
imgInModal path bulmaAttrs =
    div [ class <| "image is-unselectable" ++ bulmaAttrs ]
        [ img [ src path ] [] ]


divTileImageContainer : String -> String -> Html Msg
divTileImageContainer imgPath attrsForImage =
    div [ class "tile is-child" ] [ imgInModal imgPath attrsForImage ]


divTileAncestor : String -> String -> Html Msg
divTileAncestor imgPath attrsForImage =
    div [ class "tile is-ancestor" ]
        [ divTileImageContainer imgPath
            attrsForImage
        ]


divModalContent : String -> String -> Html Msg
divModalContent imgPath attrsForImage =
    div [ class "modal-content" ] [ divTileAncestor imgPath attrsForImage ]


divModalBackground : String -> String -> Html Msg
divModalBackground imgPath attrsForImage =
    div [ class "modal-background", attributeCenter, attributeDisableScroll ] [ divModalContent imgPath attrsForImage ]



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
        [ ( "position", "fixed" )
        , ( "overflow-x", "hidden" )
        , ( "overflow-y", "auto" )
        ]


divModal_ : Model -> String -> String -> Html Msg
divModal_ model imgPath attrsForImage =
    div
        [ class <| "modal" ++ (isModalActiveString model)
        ]
        [ divModalBackground imgPath attrsForImage
        , buttonCloseModal
        ]


divModal : Model -> Html Msg
divModal model =
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
            case Dict.get key allPaths of
                Nothing ->
                    ""

                Just path ->
                    path
    in
        divModal_ model imagePath ""


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
