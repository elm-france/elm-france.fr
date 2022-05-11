module Page.Index exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html.Styled exposing (Html, a, div, h1, img, p, text)
import Html.Styled.Attributes exposing (class, href, src, target)
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)
import View.Icons


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


type alias Data =
    ()


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head _ =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Elm France"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "todo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Elm France"
        , locale = Nothing
        , title = "Elm France"
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view _ _ _ =
    { title = "Elm France"
    , body =
        [ hero
            { title = "Elm est un langage exquis et fiable."
            , description =
                [ p [] [ text "Elm est un langage facile à apprendre et avec des messages d’erreur conviviaux." ]
                , p [ class "mt-4" ] [ text "En production, vos applications web sont performantes et ne génèrent aucune erreur d'exécution." ]
                ]
            , image = img [ src "/img/elm-example.png" ] []
            }
        ]
    }


hero :
    { a
        | title : String
        , description : List (Html msg)
        , image : Html msg
    }
    -> Html.Styled.Html msg
hero config =
    div
        [ class "lg:flex px-4 sm:px-6 lg:px-8" ]
        [ div
            [ class "max-w-7xl mx-auto" ]
            [ div
                [ class "mx-auto max-w-3xl" ]
                [ div
                    [ class "mt-12 sm:text-center lg:text-left" ]
                    [ h1
                        [ class "text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl" ]
                        [ text config.title ]
                    , p
                        [ class "mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-0" ]
                        config.description
                    ]
                , div
                    [ class "mt-5 sm:mt-8 sm:flex sm:justify-center lg:justify-start" ]
                    [ a
                        [ href "https://guide.elm-france.fr/"
                        , class "mb-3 sm:mb-0 sm:mr-3"
                        , class "w-full flex items-center justify-center px-8 py-3 md:px-10"
                        , class "border border-gray-300 rounded-md"
                        , class "text-base font-medium text-gray-900 bg-white hover:bg-gray-50 md:py-4 md:text-lg"
                        ]
                        [ text "Découvrir Elm →" ]
                    , a
                        [ href "https://discord.gg/ZRvrcu7R3U"
                        , target "_blank"
                        , class "w-full flex items-center justify-center"
                        , class "pl-4 pr-6 py-3 border border-transparent rounded-md"
                        , class "text-base font-medium text-white bg-blue-600 hover:bg-blue-500 md:py-4 md:text-lg md:pl-6 md:pr-10"
                        ]
                        [ View.Icons.discord
                        , text "Discuter"
                        ]
                    ]
                ]
            ]
        , div
            [ class "grow flex items-center justify-center lg:-mr-20" ]
            [ div [ class "w-auto md:w-[740px]" ] [ config.image ]
            ]
        ]
