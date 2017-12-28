module Hero exposing (sectionHeroArtwork)

import Html exposing (Attribute, section, Html, text, div, h1, h2)
import Html.Attributes exposing (class, style)


attributeUnselectable : Attribute msg
attributeUnselectable =
    style
        [ ( "-webkit-user-select", "none" )
        , ( "-moz-user-select", "none" )
        , ( "-ms-user-select", "none" )
        , ( "-o-user-select", "none" )
        , ( "user-select", "none" )
        ]


sectionHeroArtwork : Html msg
sectionHeroArtwork =
    section [ class "hero", attributeUnselectable ]
        [ div [ class "hero-body" ]
            [ div
                [ class "container has-text-centered font-garamond"
                ]
                [ h1 [ class "title" ] [ text "Artwork" ]
                ]
            ]
        ]
