module Content exposing (content)

import Html
    exposing
        ( article
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
import ImagePaths exposing (imageTitlesToPaths)
import Messages exposing (Msg(OpenModal))


divTileDescription : Html Msg
divTileDescription =
    div [ class "tile is-parent is-6 is-vertical" ]
        [ article [ class "content" ]
            [ p [ class "title is-2 has-text-weight-bold" ] [ text "The Project" ]
            , p [ class "is-6" ] [ text """Create an animated gif that represents you, either
        literally, in character or personality.""" ]
            ]
        , article [ class "content" ]
            [ h2 [ class "title is-2 has-text-weight-bold" ] [ text "Objective" ]
            , p [ class "is-6" ] [ text "Define digital media and begin building a vocabulary of terminology." ]
            ]
        ]


type alias AltString =
    String


imgStudentImage : ImageTitle -> ImageNotFoundPath -> Html Msg
imgStudentImage studentName imgNotFoundPath =
    div [ class "tile is-parent" ]
        [ -- larger screens:
          div [ class "tile is-child is-hidden-mobile" ]
            [ figure [ class "image is-square" ]
                [ a []
                    [ img
                        [ src <| imageTitlesToPaths studentName imgNotFoundPath
                        , alt <| studentName
                        , onClick <| OpenModal studentName
                        ]
                        []
                    ]
                ]
            ]
        , -- smaller screens:
          div [ class "tile is-child is-hidden-tablet" ]
            [ figure [ class "image is-square" ]
                [ img
                    [ src <| imageTitlesToPaths studentName imgNotFoundPath
                    , alt <| studentName
                    ]
                    []
                ]
            ]
        ]


divTileStudentImagesRow1 : ImageNotFoundPath -> Html Msg
divTileStudentImagesRow1 imgNotFoundPath =
    let
        imgTiles =
            List.map
                (\str -> imgStudentImage str imgNotFoundPath)
                [ "alyssa_rangel", "ever", "karely_gallegos", "lauren_michelle" ]
    in
        div [ class "tile" ] imgTiles


divTileStudentImagesRow2 : ImageNotFoundPath -> Html Msg
divTileStudentImagesRow2 imgNotFoundPath =
    let
        imgTiles =
            List.map
                (\str -> imgStudentImage str imgNotFoundPath)
                [ "lisa_marie", "salma", "stephanie_r", "valerie_dna" ]
    in
        div [ class "tile" ] imgTiles


divTileStudentImages : ImageNotFoundPath -> Html Msg
divTileStudentImages imgNotFoundPath =
    div [ class "tile is-parent is-vertical" ]
        [ divTileStudentImagesRow1 imgNotFoundPath
        , divTileStudentImagesRow2 imgNotFoundPath
        ]


divTileIsAncestor : ImageNotFoundPath -> Html Msg
divTileIsAncestor imgNotFoundPath =
    div [ class "tile is-ancestor" ]
        [ divTileDescription, divTileStudentImages imgNotFoundPath ]


content : ImageNotFoundPath -> Html Msg
content path =
    section
        [ style
            [ ( "zoom", "0.8" )
            , ( "-moz-transform-origin", "top" )
            , ( "-moz-transform", "scale(0.8)" )
            , ( "margin-left", "15%" )
            , ( "margin-right", "15%" )
            , ( "margin-top", "1%" )
            ]
        ]
        [ divTileIsAncestor path ]
