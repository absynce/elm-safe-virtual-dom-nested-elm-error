module AppTwoElements exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html)
import Html.Attributes
import Url


main : Program {} Model Msg
main =
    Browser.application
        -- Does _not_ error when using Browser.element. Only with Browser.{document|application}.
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }



-- Model


type alias Model =
    { key : Nav.Key
    }



-- Init


init : {} -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { key = key
      }
    , Cmd.none
    )



-- View


view : Model -> Browser.Document Msg
view model =
    { title = "❌ Error 2+ Elm custom element"
    , body =
        [ Html.p []
            [ Html.text "Below is an Elm custom element that breaks when nested 2+ times in Browser.application...depending on spacing in HTML body or if Elm debugger is opened."
            ]
        , Html.node "custom-elm"
            [ Html.Attributes.attribute "data-elm" ""
            , Html.Attributes.attribute "say" "hola"
            ]
            [ Html.text "Hello, World!"
            ]
        , Html.node "custom-elm"
            [ Html.Attributes.attribute "data-elm" ""
            , Html.Attributes.attribute "say" "hej"
            ]
            [ Html.text "Hello, World!"
            ]
        ]
    }



-- Update


type Msg
    = NoOp
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )

        UrlChanged url ->
            ( model, Cmd.none )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
