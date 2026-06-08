module MainPage exposing (..)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)
import Css exposing (..)
import Css.Global

-- MODEL
type alias Model =
  { test : String
  , message : Maybe String
  }


init : () -> (Model, Cmd Msg)
init _ =
  ( Model "Starting it up" Nothing
  , Cmd.none
  )



-- UPDATE

type Msg
  = Something String


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Something s -> ( model, Cmd.none )


-- VIEW


view : Model -> Html Msg
view model =
  div [ css [ padding (px 30) ] ]
    [ h1
        [ css
            [ displayFlex
            , justifyContent center
            , paddingBottom (px 50)
            ]
        ]
        [ text "Bonus Plots" ]

    , div
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems center
            , Css.width (pct 100)
            ]
        ]
        [ img
            [ src "Files/bonus_plots.png"
            , css
                [ Css.width (pct 90)
                , maxWidth (px 900)
                , borderRadius (px 10)
                ]
            ]
            []
        ]
    ]
