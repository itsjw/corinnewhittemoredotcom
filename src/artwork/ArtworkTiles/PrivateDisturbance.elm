module PrivateDisturbance exposing (content)

import Html exposing (Attribute, section, figure, text, Html, div, img, p)
import Html.Attributes exposing (class, style, src, alt, id)
import ArtworkCopy exposing (privateDisturbanceArtistStatement)
import ImagePaths exposing (pathsPrivateDisturbance)
import Util exposing (ImagePaths, ImagePath, unwrapPath)
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
        , divTileImgGenerator
        )


content : Html Msg
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
        [ -- div [ class "tile is-child" ]
          -- [ figure [ class "image is-173x137" ]
          -- [ img
          -- [ src <| unwrapPath "mindGames" pathsPrivateDisturbance
          -- , alt "Mind Games"
          -- ]
          -- []
          -- ]
          -- ]
          divTileImgGenerator
            (unwrapPath "mindGames" pathsPrivateDisturbance)
            "Mind Games"
            "is-173x137"
            MindGames
        , divTileImgGenerator
            (unwrapPath "shiftingPerspective" pathsPrivateDisturbance)
            "Excessive Force"
            "is-173x137"
            ShiftingPerspective

        -- div [ class "tile is-child " ]
        -- [ figure [ class "image is-173x137" ]
        -- [ img
        -- [ src <| unwrapPath
        -- "shiftingPerspective"
        -- pathsPrivateDisturbance
        -- , alt "Excessive Force"
        -- ]
        -- []
        -- ]
        -- ]
        ]


divTileWideImages : Html Msg
divTileWideImages =
    div [ class "tile is-child is-vertical" ]
        [ divTileImgGenerator
            (unwrapPath "excessiveForce" pathsPrivateDisturbance)
            "Excessive Force"
            "is-16by9"
            ExcessiveForce

        -- div [ class "tile is-child " ]
        -- [ figure [ class "image is-16by9" ]
        -- [ img
        -- [ src <| unwrapPath "excessiveForce" pathsPrivateDisturbance
        -- , alt "Excessive Force"
        -- ]
        -- []
        -- ]
        -- ]
        , divTileImgGenerator
            (unwrapPath "battleField" pathsPrivateDisturbance)
            "Battle Field"
            "is-16by9"
            BattleField

        -- div [ class "tile is-child " ]
        -- [ figure [ class "image is-16by9" ]
        -- [ img
        -- [ src <| unwrapPath "battleField" pathsPrivateDisturbance
        -- , alt "Battle Field"
        -- ]
        -- []
        -- ]
        -- ]
        ]


divTileIs6Right : Html Msg
divTileIs6Right =
    div [ class "tile is-vertical is-parent", attributeRightTilePadding ]
        [ divTileWideImages ]


divTileBottomLeft : Html Msg
divTileBottomLeft =
    div [ class "tile is-parent" ]
        [ divTileImgGenerator
            (unwrapPath "subtlePresence" pathsPrivateDisturbance)
            "Subtle Presence"
            "is-173x137"
            SubtlePresence

        -- div [ class "tile is-child" ]
        -- [ figure [ class "image is-173x137" ]
        -- [ img
        -- [ src <| unwrapPath "subtlePresence" pathsPrivateDisturbance
        -- , alt "Subtle Presence"
        -- ]
        -- []
        -- ]
        -- ]
        , divTileImgGenerator
            (unwrapPath "noPrisoners" pathsPrivateDisturbance)
            "No Prisoners"
            "is-173x137"
            NoPrisoners

        -- div [ class "tile is-child" ]
        -- [ figure [ class "image is-173x137" ]
        -- [ img
        -- [ src <| unwrapPath "noPrisoners" pathsPrivateDisturbance
        -- , alt "No Prisoners"
        -- ]
        -- []
        -- ]
        -- ]
        ]


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child" ]
        [ p [ class "title font-garamond", attributeTextAlignJustify ] [ text "Artist Statement" ]
        , p [] [ text privateDisturbanceArtistStatement ]
        ]


divTileIs6Left : Html msg
divTileIs6Left =
    div [ class "tile is-6 is-vertical is-parent" ]
        [ divTileArtistStatement ]


divTileTop : Html Msg
divTileTop =
    div [ class "tile" ] [ divTileIs6Left, divTileIs6Right ]


divTileBottom : Html Msg
divTileBottom =
    div [ class "tile" ] [ divTileBottomLeft, divTileBottomRight ]


divTilePrivateDisturbance : Html Msg
divTilePrivateDisturbance =
    div [ class "tile is-ancestor is-vertical" ] [ divTileTop, divTileBottom ]


sectionPrivateDisturbance : Html Msg
sectionPrivateDisturbance =
    section [ class "section", id "private-disturbance" ]
        [ div [ class "container", style [ ( "zoom", "0.8" ) ] ] [ divTilePrivateDisturbance ] ]
