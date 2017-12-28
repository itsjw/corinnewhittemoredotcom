module DMProj2Content exposing (content)

import Html
    exposing
        ( Attribute
        , article
        , section
        , figure
        , text
        , Html
        , img
        , div
        , li
        , ul
        , h2
        , p
        , a
        )
import Html.Attributes exposing (class, style, alt, src)
import Html.Events exposing (onClick)
import BulmaCarousel exposing (ImageNotFoundPath, ImageTitle, Carousel)
import Messages exposing (Msg(OpenModal, SpecialModal), Project(..), Student(..))


divProjectDescription : Html Msg
divProjectDescription =
    div [ class "tile is-parent is-vertical" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-2 has-text-weight-bold" ] [ text "The Project" ]
            , p [ class "is-size-5" ] [ text """Create a sequential digital
            narrative about a site or place in the Rio Grande
            Valley""" ]
            ]
        ]


divObjectiveDescription : Html Msg
divObjectiveDescription =
    div [ class "tile is-parent  is-vertical" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-2 has-text-weight-bold" ] [ text "Objective" ]
            , p [ class "is-size-5" ] [ text "Utilize digital media to communicate meaningful artistic content." ]
            ]
        ]


type alias AltString =
    String



-- NOTE: restructure for project 2 images:
-- what kind of design for mobile?


everThumbPath : String
everThumbPath =
    "../../../../../../images/studentWork/3_ARTS2348-DigitalMedia/project_2/ever_thumb_3.png"


attributeMaxWidthHeight : Attribute msg
attributeMaxWidthHeight =
    style [ ( "max-height", "700px" ), ( "max-width", "700px" ) ]


divEverThumb : Html Msg
divEverThumb =
    div [ class "tile is-parent" ]
        [ div [ class "tile is-child is-hidden-mobile", attributeMaxWidthHeight ]
            [ figure [ class "image is-square" ]
                [ a []
                    [ img
                        [ src everThumbPath
                        , alt "ever thumb"
                        , onClick <| SpecialModal Project2 Ever "one"
                        ]
                        []
                    ]
                ]
            ]
        ]


salmaThumbPath : String
salmaThumbPath =
    "../../../../../../images/studentWork/3_ARTS2348-DigitalMedia/project_2/salma_thumb_4.png"


divSalmaThumb : Html Msg
divSalmaThumb =
    div [ class "tile is-parent" ]
        [ div [ class "tile is-child is-hidden-mobile", attributeMaxWidthHeight ]
            [ figure [ class "image is-square" ]
                [ a []
                    [ img
                        [ src salmaThumbPath
                        , alt "salma thumb"
                        , onClick <| SpecialModal Project2 Salma "one"
                        ]
                        []
                    ]
                ]
            ]
        ]


divFirstColumn : Html Msg
divFirstColumn =
    div [ class "tile is-parent is-vertical" ] [ divEverThumb, divProjectDescription ]


divSecondColumn : Html Msg
divSecondColumn =
    div [ class "tile is-parent is-vertical" ] [ divSalmaThumb, divObjectiveDescription ]


divTileIsAncestor : ImageNotFoundPath -> Html Msg
divTileIsAncestor imgNotFoundPath =
    div [ class "tile is-ancestor" ]
        [ divFirstColumn, divSecondColumn ]


content : ImageNotFoundPath -> Html Msg
content path =
    section
        [ style
            [ ( "zoom", "0.8" )
            , ( "-moz-transform-origin", "top" )
            , ( "-moz-transform", "scale(0.8)" )
            , ( "margin-left", "17%" )
            , ( "margin-right", "17%" )
            , ( "margin-top", "1%" )
            ]
        ]
        [ divTileIsAncestor path ]
