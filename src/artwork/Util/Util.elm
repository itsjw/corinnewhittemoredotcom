module Util exposing (divTileImgGenerator)


type alias ImagePath =
    String


type alias HtmlAlt =
    String


type alias BulmaDimension =
    String



-- example BulmaDimension: "is-169x142"
-- example HtmlAlt: "blah"
-- This is just an alternative
-- String for an image in an href.


divTileImgGenerator : ImagePath -> HtmlAlt -> BulmaDimension -> Msg -> Html Msg
divTileImgGenerator path altStr dimension msg =
    div [ class "tile is-child" ]
        [ a [ onClick msg ]
            [ figure [ class <| "image is-unselectable" ++ dimension ]
                [ img [ src path, alt altStr ] [] ]
            ]
        ]
