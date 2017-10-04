module PrivateDisturbance exposing (content)

import Html exposing (Attribute, section, figure, text, Html, div, img, p)
import Html.Attributes exposing (class, style, src, alt, id)
import Html.Events exposing (onClick)
import ArtworkCopy exposing (privateDisturbanceArtistStatement)
import ImagePaths
    exposing
        ( ImagePath
        , ImagePaths
        , pathsPrivateDisturbance
        , unwrapPath
        )
import Messages
    exposing
        ( Msg
            ( ExcessiveForce
            , BattleField
            , MindGames
            , ShiftingPerspective
            , SubtlePresence
            , NoPrisoners
            )
        )


content : Html msg
content =
    sectionPrivateDisturbance



-- attributes ------------------------------------------------------------------


attributeTextAlignJustify : Attribute msg
attributeTextAlignJustify =
    style [ ( "text-align", "justify" ) ]


attributeRightTilePadding : Attribute msg
attributeRightTilePadding =
    style [ ( "padding-top", "88px" ) ]



-- html generation -------------------------------------------------------------


divTileBottomRight : Html Msg
divTileBottomRight =
    div [ class "tile is-parent" ]
        [ div [ class "tile is-child" ]
            [ figure [ class "image is-173x137" ]
                [ img
                    [ src <| unwrapPath "mindGames" pathsPrivateDisturbance
                    , alt "Mind Games"
                    ]
                    []
                ]
            ]
        , div [ class "tile is-child " ]
            [ figure [ class "image is-173x137" ]
                [ img
                    [ src <|
                        unwrapPath
                            "shiftingPerspective"
                            pathsPrivateDisturbance
                    , alt "Excessive Force"
                    ]
                    []
                ]
            ]
        ]


divTileWideImages : Html msg
divTileWideImages =
    div [ class "tile is-child is-vertical" ]
        [ div [ class "tile is-child " ]
            [ figure [ class "image is-16by9" ]
                [ img
                    [ src <| unwrapPath "excessiveForce" pathsPrivateDisturbance
                    , alt "Excessive Force"
                    ]
                    []
                ]
            ]
        , div [ class "tile is-child " ]
            [ figure [ class "image is-16by9" ]
                [ img
                    [ src <| unwrapPath "battleField" pathsPrivateDisturbance
                    , alt "Battle Field"
                    ]
                    []
                ]
            ]
        ]


divTileIs6Right : Html msg
divTileIs6Right =
    div [ class "tile is-vertical is-parent", styleRightTilePadding ]
        [ divTileWideImages ]


divTileBottomLeft : Html msg
divTileBottomLeft =
    div [ class "tile is-parent" ]
        [ div [ class "tile is-child" ]
            [ figure [ class "image is-173x137" ]
                [ img
                    [ src <| unwrapPath "subtlePresence" pathsPrivateDisturbance
                    , alt "Subtle Presence"
                    ]
                    []
                ]
            ]
        , div [ class "tile is-child" ]
            [ figure [ class "image is-173x137" ]
                [ img
                    [ src <| unwrapPath "noPrisoners" pathsPrivateDisturbance
                    , alt "No Prisoners"
                    ]
                    []
                ]
            ]
        ]


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child" ]
        [ p [ class "title font-garamond", styleTextAlignJustify ] [ text "Artist Statement" ]
        , p [] [ text privateDisturbanceArtistStatement ]
        ]


divTileIs6Left : Html msg
divTileIs6Left =
    div [ class "tile is-6 is-vertical is-parent" ]
        [ divTileArtistStatement ]



-- !! dude, add divTileImagesBelowStatement as something else!


divTileTop : Html msg
divTileTop =
    div [ class "tile" ] [ divTileIs6Left, divTileIs6Right ]


divTileBottom : Html msg
divTileBottom =
    div [ class "tile" ] [ divTileBottomLeft, divTileBottomRight ]


divTilePrivateDisturbance : Html msg
divTilePrivateDisturbance =
    div [ class "tile is-ancestor is-vertical" ] [ divTileTop, divTileBottom ]


sectionPrivateDisturbance : Html msg
sectionPrivateDisturbance =
    section [ class "section", id "private-disturbance" ]
        [ div [ class "container", style [ ( "zoom", "0.8" ) ] ] [ divTilePrivateDisturbance ] ]
