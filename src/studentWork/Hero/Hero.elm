module Hero exposing (sectionHeroStudentWork)

import Html exposing (section, Html, text, div, h1, h2)
import Html.Attributes exposing (class)


main : Html msg
main =
    sectionHeroStudentWork


subtitle : String
subtitle =
    ""


sectionHeroStudentWork : Html msg
sectionHeroStudentWork =
    section [ class "hero" ]
        [ div [ class "hero-body" ]
            [ div [ class "container has-text-centered font-garamond" ]
                [ h1 [ class "title" ] [ text "Student Works" ]
                , h2 [ class "subtitle" ] [ text subtitle ]
                ]
            ]
        ]
