module Hero exposing (sectionHeroDesign)

import Html exposing (section, Html, text, div, h1, h2)
import Html.Attributes exposing (class)


main : Html msg
main =
    sectionHeroDesign


subtitle : String
subtitle =
    "Professional Works"


sectionHeroDesign : Html msg
sectionHeroDesign =
    section [ class "hero" ]
        [ div [ class "hero-body" ]
            [ div [ class "container has-text-centered font-garamond" ]
                [ h1 [ class "title" ] [ text "Design" ]
                , h2 [ class "subtitle" ] [ text subtitle ]
                ]
            ]
        ]
