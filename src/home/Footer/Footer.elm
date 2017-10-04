module Footer exposing (footer)

import Html exposing (..)
import Html.Attributes exposing (..)


styleBackgroundColor : Attribute msg
styleBackgroundColor =
    style [ ( "background-color", "white" ) ]


styleColorDimGrey : Attribute msg
styleColorDimGrey =
    style [ ( "color", "#696969" ) ]


styleColorBlack : Attribute msg
styleColorBlack =
    style [ ( "color", "#000000" ) ]


styleFooterPadding : Attribute msg
styleFooterPadding =
    style [ ( "padding-top", "35px" ) ]


divider : Html msg
divider =
    hr
        [ style
            [ ( "display", "flex" )
            , ( "align-items", "center" )
            , ( "width", "100%" )
            , ( "margin", "auto" )
            ]
        ]
        []


divContent : Html msg
divContent =
    div [ class "content has-text-right is-small", styleFooterPadding ]
        [ p [ styleColorDimGrey ]
            [ a [ href "#", styleColorDimGrey ] [ text "lorem" ]
            , text "  /  "
            , a [ href "#", styleColorDimGrey ] [ text "ipsum" ]
            , text "  /  "
            , a [ href "#", styleColorDimGrey ] [ text "contact" ]
            ]
        ]


divContainer : Html msg
divContainer =
    div [ class "container" ] [ divContent ]


footer : Html msg
footer =
    div [ class "footer", styleBackgroundColor ]
        [ divContainer ]
