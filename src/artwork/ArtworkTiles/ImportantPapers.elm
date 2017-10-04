module ImportantPapers exposing (content)

import Html exposing (..)
import Html.Attributes exposing (..)
import ImagePaths exposing (pathsImportantPapers)
import Messages exposing (Msg(ImportantPaper))


content : Html msg
content =
    div [ id "important-papers" ] []
