module Modal exposing (divModal)

import Html exposing (Attribute, section, figure, Html, div, img, button, span, a, text, em, i)
import Html.Attributes exposing (class, src, alt, attribute, style)
import Html.Events exposing (onClick)
import Model exposing (..)
import Messages exposing (Msg(CloseModal, ImgNext, ImgPrevious))
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
        [ divTileImageContainer path bulmaAttrsMobile bulmaAttrsDesktop ]


divModalContent : ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
divModalContent path bulmaAttrsMobile bulmaAttrsDesktop =
    div
        [ class "modal-content"
        , style [ ( "overflow", "visible" ) ]
        ]
        [ divTileAncestor path bulmaAttrsMobile bulmaAttrsDesktop ]


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


rightChevronStyle : Attribute msg
rightChevronStyle =
    style
        [ ( "font-size", "72px" )
        , ( "position", "absolute" )
        , ( "top", "0" )
        , ( "bottom", "0" )
        , ( "left", "100px" )
        , ( "margin", "auto" )
        , ( "height", "54px" )
        ]


leftChevronStyle : Attribute msg
leftChevronStyle =
    style
        [ ( "font-size", "72px" )
        , ( "position", "absolute" )
        , ( "top", "0" )
        , ( "bottom", "0" )
        , ( "right", "100px" )
        , ( "margin", "auto" )
        , ( "height", "54px" )
        ]


divModal_ : Model -> ImagePath -> BulmaDimension -> BulmaDimension -> Html Msg
divModal_ model path bulmaAttrsMobile bulmaAttrsDesktop =
    div
        [ class <| "modal " ++ (isModalActiveString model) ]
        [ divModalBackground path bulmaAttrsMobile bulmaAttrsDesktop
        , buttonCloseModal
        , span [ class "icon", onClick ImgPrevious, leftChevronStyle ]
            [ i [ class "fa fa-chevron-circle-right" ] [] ]
        , span [ class "icon", onClick ImgNext, rightChevronStyle ]
            [ i [ class "fa fa-chevron-circle-left" ] [] ]
        ]


divModal : Model -> BulmaDimension -> BulmaDimension -> Html Msg
divModal model bulmaAttrsMobile bulmaAttrsDesktop =
    let
        imgPath =
            case model.modalDisplay of
                Just modal ->
                    modal.currentPath

                Nothing ->
                    ""
    in
        divModal_ model imgPath bulmaAttrsMobile bulmaAttrsDesktop


isModalActiveString : Model -> String
isModalActiveString model =
    if model.modalIsActive then
        "is-active"
    else
        ""
