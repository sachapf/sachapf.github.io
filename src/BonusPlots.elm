module BonusPlots exposing (..)

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


init : () -> ( Model, Cmd Msg )
init _ =
  ( Model "Starting it up" Nothing
  , Cmd.none
  )



-- UPDATE


type Msg
  = Something String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Something s ->
      ( model, Cmd.none )



-- PLOTS

plotFiles : List { file : String, header : String }
plotFiles =
    [ { file = "Files/bonus_plots/example_MaNGA_samples_1-623722.png"
      , header = "Example MaNGA SFH and Z Samples for 1-623722"
      },
      { file = "Files/bonus_plots/inference_SFH_metallicity_4.gif"
      , header = "Diffusion Process for SFH/MH Inference - samples"
      },
      { file = "Files/bonus_plots/spectrum_diffusion_process_7565-56809-0737_fsps.gif"
      , header = "Diffusion Process for SFH/MH Inference - spectrum"
      },
      { file = "Files/bonus_plots/spectrum_diffusion_process_7565-56809-0737_fsps.gif"
      , header = "Diffusion Process for SFH/MH Inference - spectrum"
      },
      { file = "Files/bonus_plots/chi2_TNG_train_vs_test.png"
      , header = "PQMass Chi2 Comparison: TNG Train vs Test"
      },
      { file = "Files/bonus_plots/chi2_test_300_0_TNG_vs_test.png"
      , header = "PQMass Chi2 Comparison: Model Samples vs Test"
      },
      { file = "Files/bonus_plots/chi2_tng_vs_eagle.png"
      , header = "PQMass Chi2 Comparison: TNG vs Eagle"
      }
    ]

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
        (List.map viewPlot plotFiles)
    ]


viewPlot : { file : String, header : String } -> Html Msg
viewPlot plot =
    div
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems center
            , paddingBottom (px 30)
            ]
        ]
        [ h3
            [ css
                [ paddingBottom (px 10)
                ]
            ]
            [ text plot.header ]

        , img
            [ src plot.file
            , css
                [ Css.width (px 700)
                 , maxWidth (pct 100)
                ]
            ]
            []
        ]
