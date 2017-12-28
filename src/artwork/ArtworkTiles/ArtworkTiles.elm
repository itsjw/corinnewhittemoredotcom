module Tiles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import ArtworkCopy
    exposing
        ( valleyCulturaArtistStatement
        , valleyCulturaMaterialsProcess
        , privateDisturbanceArtistStatement
        )


attributeCenterPadding : Attribute msg
attributeCenterPadding =
    style
        [ ( "zoom", "0.6" ) ]



-- valley cultura


divTileValleyCultura : Html msg
divTileValleyCultura =
    div [ class "tile is-ancestor" ]
        [ div [ class "tile is-parent is-vertical is-6" ]
            [ div [ class "tile is-child box" ]
                [ p [ class "title" ] [ text "Artist Statement" ]
                , div [ class "content" ]
                    [ p [] [ text valleyCulturaArtistStatement ] ]
                ]
            , div [ class "tile  is-vertical" ]
                [ div [ class "class tile is-child box" ]
                    [ figure [ class "image is-384x68" ]
                        [ img
                            [ src
                                "../../../images/artwork/valleyCultura/MariaMarilyn_thumb.png"
                            , alt ""
                            ]
                            []
                        ]
                    ]
                , div [ class "class tile is-child box" ]
                    [ figure [ class "image is-384x68" ]
                        [ img
                            [ src
                                "../../../images/artwork/valleyCultura/HablaTex_thumb.png"
                            , alt ""
                            ]
                            []
                        ]
                    ]
                , div [ class "class tile is-child box" ]
                    [ figure [ class "image is-384x68" ]
                        [ img
                            [ src
                                "../../../images/artwork/valleyCultura/DigitalLandscape_thumb.png"
                            , alt ""
                            ]
                            []
                        ]
                    ]
                , div [ class "class tile is-child box" ]
                    [ figure [ class "image is-384x68" ]
                        [ img
                            [ src
                                "../../../images/artwork/valleyCultura/Rodriguez-Flower-Shop_thumb.png"
                            , alt ""
                            ]
                            []
                        ]
                    ]
                ]
            ]
        , div [ class "tile is-parent is-6 is-vertical" ]
            [ div [ class "tile is-child box" ]
                [ figure [ class "image is-384x256" ]
                    [ img
                        [ src
                            "../../../images/artwork/valleyCultura/crossing_thumb.png"
                        , alt ""
                        ]
                        []
                    ]
                ]
            , div [ class "tile is-parent" ]
                [ div [ class "tile is-vertical" ]
                    [ div [ class "tile box" ]
                        [ figure [ class "image is-169x142" ]
                            [ img
                                [ src
                                    "../../../images/artwork/valleyCultura/SunsetMiniMart_thumb2.png"
                                , alt ""
                                ]
                                []
                            ]
                        ]
                    , div [ class "tile box" ]
                        [ figure [ class "image is-169x142" ]
                            [ img
                                [ src
                                    "../../../images/artwork/valleyCultura/MarthasFruitStand_thumb2.png"
                                , alt ""
                                ]
                                []
                            ]
                        ]
                    ]
                , div [ class "tile box  is-vertical" ]
                    [ p [ class "title" ] [ text "Materials &\nProcess" ]
                    , div [ class "content" ]
                        [ p [] [ text valleyCulturaMaterialsProcess ] ]
                    ]
                ]
            ]
        ]


sectionValleyCultura : Html msg
sectionValleyCultura =
    section [ class "section", style [ ( "zoom", "0.8" ) ] ]
        [ div [ class "container" ]
            [ divTileValleyCultura ]
        ]



-- private disturbance


divTileSmallerSquareImages : Html msg
divTileSmallerSquareImages =
    div [ class "tile" ]
        [ div [ class "tile is-child box" ]
            [ figure [ class "image is-16by9" ]
                [ img
                    [ src
                        "../../../images/artwork/privateDisturbance/3_mindGames_thumb.png"
                    , alt "Mind Games"
                    ]
                    []
                ]
            ]
        , div [ class "tile is-child box" ]
            [ figure [ class "image is-16by9" ]
                [ img
                    [ src
                        "../../../images/artwork/privateDisturbance/4_excessiveForce_thumb.png"
                    , alt "Excessive Force"
                    ]
                    []
                ]
            ]
        ]


divTileWideImages : Html msg
divTileWideImages =
    div [ class "tile is-child is-vertical" ]
        [ div [ class "tile is-child box" ]
            [ figure [ class "image is-16by9" ]
                [ img
                    [ src
                        "../../../images/artwork/privateDisturbance/4_excessiveForce_thumb.png"
                    , alt "Excessive Force"
                    ]
                    []
                ]
            ]
        , div [ class "tile is-child box" ]
            [ figure [ class "image is-16by9" ]
                [ img
                    [ src
                        "../../../images/artwork/privateDisturbance/5_battleField_thumb.png"
                    , alt "Battle Field"
                    ]
                    []
                ]
            ]
        ]


divTileIs6Right : Html msg
divTileIs6Right =
    div [ class "tile is-vertical is-parent" ]
        [ divTileWideImages, divTileSmallerSquareImages ]


divTileImagesBelowStatement : Html msg
divTileImagesBelowStatement =
    div [ class "tile" ]
        [ div [ class "tile box is-child" ]
            [ figure [ class "image is-square is-centered" ]
                [ img
                    [ src
                        "../../../images/artwork/privateDisturbance/1_subtlePresence_thumb.png"
                    , alt "Subtle Presence"
                    ]
                    []
                ]
            ]
        , div [ class "tile box is-child" ]
            [ figure [ class "image is-square" ]
                [ img
                    [ src
                        "../../../images/artwork/privateDisturbance/6_noPrisoners_thumb.png"
                    , alt "No Prisoners"
                    ]
                    []
                ]
            ]
        ]


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child box" ]
        [ p [ class "title" ] [ text "Artist Statement" ]
        , p [] [ text privateDisturbanceArtistStatement ]
        ]


divTileIs6Left : Html msg
divTileIs6Left =
    div [ class "tile is-6 is-vertical is-parent" ]
        [ divTileArtistStatement, divTileImagesBelowStatement ]


divTilePrivateDisturbance : Html msg
divTilePrivateDisturbance =
    div [ class "tile is-ancestor" ] [ divTileIs6Left, divTileIs6Right ]


sectionPrivateDisturbance : Html msg
sectionPrivateDisturbance =
    section [ class "section", style [ ( "zoom", "0.66" ) ] ]
        [ div [ class "container" ] [ divTilePrivateDisturbance ] ]


main : Html msg
main =
    sectionPrivateDisturbance
