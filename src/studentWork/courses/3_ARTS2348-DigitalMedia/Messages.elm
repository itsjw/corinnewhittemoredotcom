module Messages exposing (Msg(..), Project(..), Student(..))

import Keyboard


type Student
    = Ever
    | Salma


type Project
    = Project1
    | Project2
    | Project3


type Msg
    = Next
    | Prev
    | CloseModal
    | OpenModal String
    | SpecialModal Project Student String
    | Burger
    | KeyMsg Keyboard.KeyCode
