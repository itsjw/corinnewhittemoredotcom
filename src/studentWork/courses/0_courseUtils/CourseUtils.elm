module CourseUtils
    exposing
        ( ActiveProjectTab(..)
        , divProjectTabs
        , divModal_
        , sectionHeroStudentWork
        )

import Html
    exposing
        ( Attribute
        , button
        , section
        , Html
        , text
        , div
        , img
        , ul
        , li
        , h3
        , h6
        , a
        , p
        )
import Html.Attributes exposing (attribute, style, class, href, src)
import Html.Events exposing (onClick)


-- Tabs ------------------------------------------------------------------------


type ActiveProjectTab
    = ProjectTab1
    | ProjectTab2
    | ProjectTab3


type alias HrefAddress =
    String


type alias HrefText =
    String


type alias TabIsActiveString =
    String


liProjectTab_ : TabIsActiveString -> HrefAddress -> HrefText -> Html msg
liProjectTab_ isActiveString address hrefText =
    li [ class isActiveString ] [ a [ href address ] [ text hrefText ] ]


attributePaddingLeftRight : Attribute msg
attributePaddingLeftRight =
    style
        [ ( "padding-left", "150px" )
        , ( "padding-right", "150px" )
        ]


divProjectTabs : ActiveProjectTab -> Html msg
divProjectTabs project =
    let
        projectTabs =
            case project of
                ProjectTab1 ->
                    ul []
                        [ liProjectTab_ "is-active" "#" "Project 1"
                        , liProjectTab_ "" "../project_2/project2.html" "Project 2"
                        , liProjectTab_ "" "../project_3/project2.html" "Project 3"
                        ]

                ProjectTab2 ->
                    ul []
                        [ liProjectTab_ "" "../project_1/project1.html" "Project 1"
                        , liProjectTab_ "is-active" "#" "Project 2"
                        , liProjectTab_ "" "../project_3/project3.html" "Project 3"
                        ]

                ProjectTab3 ->
                    ul []
                        [ liProjectTab_ "" "../project_1/project1.html" "Project 1"
                        , liProjectTab_ "" "../project_2/project2.html" "Project 2"
                        , liProjectTab_ "is-active" "#" "Project 3"
                        ]
    in
        div [ class "tabs is-centered is-small", attributePaddingLeftRight ] [ projectTabs ]



-- Modal ------------------------------------------------------------------------


type alias BulmaResolution =
    String


type alias ImagePath =
    String


divModal_ : Bool -> ImagePath -> BulmaResolution -> msg -> msg -> msg -> Html msg
divModal_ isModalActive path resolution prevMsg nextMsg closeModal =
    let
        modalString =
            case isModalActive of
                True ->
                    " is-active"

                False ->
                    ""
    in
        div [ class <| "modal" ++ modalString ]
            [ div [ class "modal-background" ] []
            , div [ class "modal-content" ]
                [ p [ class <| "image " ++ resolution ]
                    [ img [ src path ] []
                    , button [ onClick prevMsg ] [ text "<" ]
                    , button [ onClick nextMsg ] [ text ">" ]
                    ]
                ]
            , button
                [ class "modal-close is-large"
                , attribute "aria-label" "close"
                , onClick closeModal
                ]
                []
            ]



-- Hero ------------------------------------------------------------------------


type alias Subtitle =
    String


sectionHeroStudentWork : Subtitle -> Html msg
sectionHeroStudentWork subtitle =
    section [ class "hero" ]
        [ div [ class "hero-body" ]
            [ div [ class "container has-text-centered font-garamond" ]
                [ h3 [ class "title is-3" ] [ text "Student Work" ]
                , h6 [ class "subtitle is-6" ] [ text subtitle ]
                ]
            ]
        ]
