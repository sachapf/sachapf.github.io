module BonusPlots exposing (..)

import Css exposing (..)
import Css.Global
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)


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
            [ viewPlot
                "Example MaNGA SFH and Z Samples for 1-623722"
                "Files/bonus_plots/example_MaNGA_samples_1-623722.png"
                Nothing

            , viewPlot
                "Diffusion Process for SFH/MH Inference - samples"
                "Files/bonus_plots/inference_SFH_metallicity_4.gif"
                Nothing

            , viewPlot
                "Diffusion Process for SFH/MH Inference - spectrum"
                "Files/bonus_plots/spectrum_diffusion_process_7565-56809-0737_fsps.gif"
                Nothing

            , viewPlot
                "PQMass Chi2 Comparison: TNG Train vs Test"
                "Files/bonus_plots/chi2_TNG_train_vs_test.png"
                Nothing

            , viewPlot
                "PQMass Chi2 Comparison: Model Samples vs Test"
                "Files/bonus_plots/chi2_test_300_0_TNG_vs_test.png"
                Nothing

            , viewPlot
                "PQMass Chi2 Comparison: TNG vs Eagle"
                "Files/bonus_plots/chi2_tng_vs_eagle.png"
                Nothing
            ]
        ]


viewPlot : String -> String -> Maybe String -> Html Msg
viewPlot header file maybeDescription =
    div
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems center
            , paddingBottom (px 40)
            , Css.width (pct 100)
            ]
        ]
        ([ h3
            [ css
                [ paddingBottom (px 10)
                , margin zero
                ]
            ]
            [ text header ]
         ]
            ++ viewDescription maybeDescription
            ++ [ img
                    [ src file
                    , css
                        [ Css.width (px 700)
                        , maxWidth (pct 100)
                        ]
                    ]
                    []
               ]
        )


viewDescription : Maybe String -> List (Html Msg)
viewDescription maybeDescription =
    case maybeDescription of
        Just description ->
            [ p
                [ css
                    [ Css.width (px 700)
                    , maxWidth (pct 100)
                    , textAlign center
                    , paddingBottom (px 15)
                    , margin zero
                    ]
                ]
                [ text description ]
            ]

        Nothing ->
            []