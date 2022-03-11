module Page.Index exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html.Styled exposing (Html, a, div, h1, p, text)
import Html.Styled.Attributes exposing (class, href, target)
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
        [ heroAngledImage
            { title = "Elm France"
            , description =
                [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." ]
            , image = View.Icons.elmFrance
            }
        ]
    }


heroAngledImage :
    { a
        | title : String
        , description : List (Html msg)
        , image : Html msg
    }
    -> Html.Styled.Html msg
heroAngledImage config =
    div
        [ class "lg:flex bg-white" ]
        [ div
            [ class "max-w-7xl mx-auto" ]
            [ div
                [ class "relative z-10 pb-8 bg-white sm:pb-16 md:pb-20 lg:max-w-2xl lg:w-full lg:pb-28 xl:pb-32" ]
                [ div
                    [ class "pt-10 mx-auto max-w-7xl px-4 sm:pt-12 sm:px-6 md:pt-16 lg:pt-20 lg:px-8 xl:pt-28" ]
                    [ div
                        [ class "sm:text-center lg:text-left" ]
                        [ h1
                            [ class "text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl" ]
                            [ text config.title ]
                        , p
                            [ class "mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-0" ]
                            config.description
                        , div
                            [ class "mt-5 sm:mt-8 sm:flex sm:justify-center lg:justify-start" ]
                            [ div
                                [ class "rounded-md" ]
                                [ a
                                    [ href "https://discord.gg/ZRvrcu7R3U"
                                    , target "_blank"
                                    , class "w-full flex items-center justify-center pl-5 pr-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 md:py-4 md:text-lg md:pl-6 md:pr-10"
                                    ]
                                    [ View.Icons.discord
                                    , text "Rejoindre sur Discord →"
                                    ]
                                ]
                            , div
                                [ class "mt-3 sm:mt-0 sm:ml-3" ]
                                [ a
                                    [ href "https://twitter.com/elmfrance"
                                    , class "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-gray-900 bg-gray-100 hover:bg-gray-200 md:py-4 md:text-lg md:px-10"
                                    ]
                                    [ text "Prochains évenements" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , div
            [ class "grow flex items-center justify-center" ]
            [ div [ class "w-64" ] [ config.image ]
            ]
        ]
