module Columns exposing (content)

import Html exposing (Attribute, section, Html, div, h3, text, p, a, hr)
import Html.Attributes exposing (class, style, href)
import Messages exposing (Msg)


attributeAlignCenter : Attribute msg
attributeAlignCenter =
    style
        [ ( "display", "-webkit-flex" )
        , ( "-webkit-align-items", "center" )
        , ( "display", "flex" )
        , ( "align-items", "center" )
        ]


attributeBorder : Attribute msg
attributeBorder =
    style [ ( "border", "1px solid black" ) ]


classTileGenerator : String -> String -> Html Msg
classTileGenerator title link =
    a [ href link ]
        [ div [ class <| "content hvr-underline-from-left" ]
            [ h3
                [ class "title is-1 has-text-weight-bold has-text-grey-dark"
                , style [ ( "white-space", "pre-wrap" ) ]
                ]
                [ text title ]
            ]
        ]



-- Design I


divTileArts1311 : Html Msg
divTileArts1311 =
    div [ class "tile is-parent" ]
        [ classTileGenerator
            "ARTS\n1311"
            "./courses/1_ARTS1311-DesignOne/designone.html"
        ]



-- Design II


divTileArts1312 : Html Msg
divTileArts1312 =
    div [ class "tile is-parent" ]
        [ classTileGenerator
            "ARTS\n1312"
            "./courses/2_ARTS1312-DesignTwo/designtwo.html"
        ]



-- Digital Media


divTileArts2348 : Html Msg
divTileArts2348 =
    div [ class "tile is-parent" ]
        [ classTileGenerator
            "ARTS\n2348"
            "./courses/3_ARTS2348-DigitalMedia/projects/project_1/digitalmedia.html"
        ]



-- Typography


divTileArts2363 : Html Msg
divTileArts2363 =
    div [ class "tile is-parent" ]
        [ classTileGenerator
            "ARTS\n2363"
            "./courses/4_ARTS2363-Typography/typography.html\n"
        ]



-- History of Graphic Design


divTileArts3354 : Html Msg
divTileArts3354 =
    div [ class "tile is-parent" ]
        [ classTileGenerator
            "ARTS\n3354"
            "./courses/5_ARTS3354-HistoryOfGraphicDesign/historyofgraphicdesign.html\n"
        ]



-- Graphic Design I


divTileArts4333 : Html Msg
divTileArts4333 =
    div [ class "tile is-parent" ]
        [ classTileGenerator
            "ARTS\n4333"
            "./courses/6_ARTS4333-GraphicDesignOne/graphicdesignone.html\n"
        ]



-- Independent Study


divTileArts4391 : Html Msg
divTileArts4391 =
    div [ class "tile is-parent" ]
        [ classTileGenerator
            "ARTS\n4391"
            "./courses/7_ARTS4391-IndepdentStudy/independentstudy.html\n"
        ]


divTileClasses : Html Msg
divTileClasses =
    div [ class "tile is-ancestor is-vertical" ]
        [ div [ class "tile is-parent" ]
            [ div [ class "tile is-3" ] []
            , div [ class "tile" ]
                [ divTileArts1311
                , divTileArts1312
                , divTileArts2363
                ]
            ]
        , div [ class "tile is-parent" ]
            [ div [ class "tile is-2" ] []
            , div [ class "tile" ]
                [ divTileArts2348
                , divTileArts3354
                , divTileArts4333
                , divTileArts4391
                ]
            ]
        ]


content : Html Msg
content =
    section
        [ style
            [ ( "zoom", "0.88" )
            , ( "-moz-transform-origin", "top" )
            , ( "-moz-transform", "scale(0.88)" )
            , ( "padding-top", "9%" )
            ]
        ]
        [ divTileClasses ]
