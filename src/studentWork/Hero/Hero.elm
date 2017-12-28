module Hero exposing (sectionHeroStudentWork)

import Html exposing (Attribute, section, Html, text, div, h1, h2, hr)
import Html.Attributes exposing (style, class)


main : Html msg
main =
    sectionHeroStudentWork


subtitle : String
subtitle =
    ""


attributeUnselectable : Attribute msg
attributeUnselectable =
    style
        [ ( "-webkit-user-select", "none" )
        , ( "-moz-user-select", "none" )
        , ( "-ms-user-select", "none" )
        , ( "-o-user-select", "none" )
        , ( "user-select", "none" )
        ]


attributeUnderline : Attribute msg
attributeUnderline =
    style
        [ ( "alig-items", "center" )
        , ( "border-bottom-color", "#dbdbdb" )
        , ( "border-bottom-style", "solid" )
        , ( "border-bottom-width", "1px" )
        , ( "display", "flex" )
        , ( "flex-grow", "1" )
        , ( "flex-shrink", "0" )
        , ( "box-sizing", "inherit" )
        , ( "margin", "0 auto" )
        , ( "width", "33%" )
        ]


sectionHeroStudentWork : Html msg
sectionHeroStudentWork =
    div []
        [ section [ class "hero", attributeUnselectable ]
            [ div [ class "hero-body" ]
                [ div [ class "container has-text-centered font-garamond" ]
                    [ h1 [ class "title" ] [ text "Student Work" ] ]
                ]
            ]
        , hr
            [ attributeUnderline ]
            []
        ]
