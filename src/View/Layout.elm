module View.Layout exposing (layoutHeader, view)

import Html.Styled exposing (a, button, div, footer, h2, h3, header, li, node, span, text, ul)
import Html.Styled.Attributes exposing (attribute, class, href, id, type_)
import Html.Styled.Events exposing (onClick)
import Machine.Menu exposing (State(..))
import View.Icons as Icons


view : { a | onOpenMobileMenu : msg, mobileMenu : State, onCloseMobileMenu : msg } -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
view config body =
    div
        [ class "bg-white z-20 pt-20" ]
        [ layoutHeader config
        , mobileMenu config
        , node
            "main"
            [ class "max-w-7xl mx-auto py-8 sm:py-12"
            , class "bg-white"
            ]
            [ div [] body ]
        , layoutFooter
        ]


layoutHeader : { a | onOpenMobileMenu : msg } -> Html.Styled.Html msg
layoutHeader config =
    header
        []
        [ div
            [ class "bg-white border-b fixed top-0 inset-x-0 z-50" ]
            [ div
                [ class "max-w-7xl mx-auto px-4 py-2 sm:px-6 md:space-x-10"
                , class "flex justify-between items-center md:justify-start"
                ]
                [ div
                    [ class "flex justify-start lg:w-0 lg:flex-1" ]
                    [ a
                        [ class "font-semibold"
                        , class "rounded"
                        , class "px-4 py-2 my-2 bg-gray-50"
                        , href "/"
                        ]
                        [ text "Elm France"
                        ]
                    ]
                , div
                    [ class "md:hidden" ]
                    [ button
                        [ onClick config.onOpenMobileMenu
                        , type_ "button"
                        , class "text-gray-400 hover:text-gray-500"
                        , class "inline-flex items-center justify-center"
                        , class "bg-white rounded-md p-2 hover:bg-gray-100"
                        , attribute "aria-expanded" "false"
                        ]
                        [ span
                            [ class "sr-only" ]
                            [ text "Open menu" ]
                        , Icons.menu
                        ]
                    ]
                , div
                    [ class "hidden md:flex items-center justify-end" ]
                    [ a
                        [ href "/pourquoi-elm"
                        , class "whitespace-nowrap text-base font-medium text-gray-500 hover:text-gray-900"
                        ]
                        [ text "Pourquoi Elm ?" ]
                    ]
                ]
            ]
        ]


mobileMenu : { a | mobileMenu : State, onCloseMobileMenu : msg } -> Html.Styled.Html msg
mobileMenu config =
    div
        [ if config.mobileMenu == Machine.Menu.Opened then
            class "duration-200 ease-out opacity-100 scale-100"

          else
            class "pointer-events-none duration-100 ease-out opacity-0 scale-95"
        , class
            "fixed z-50 top-0 inset-x-0 p-2 transition transform origin-top-right md:hidden"
        ]
        [ div
            [ class "rounded-lg shadow-lg ring-1 ring-black ring-opacity-5 bg-white" ]
            [ div
                [ class "p-2" ]
                [ div
                    [ class "flex items-center justify-end" ]
                    [ div
                        []
                        [ button
                            [ onClick config.onCloseMobileMenu
                            , type_ "button"
                            , class "text-gray-400 hover:text-gray-500 "
                            , class "bg-white hover:bg-gray-100"
                            , class "rounded-md p-2 inline-flex items-center justify-center"
                            ]
                            [ span
                                [ class "sr-only" ]
                                [ text "Close menu" ]
                            , Icons.close
                            ]
                        ]
                    ]
                ]
            , div
                [ class "py-6 px-5" ]
                [ div
                    []
                    [ a
                        [ href "/pourquoi-elm"
                        , class "text-base font-medium hover:bg-gray-100"
                        , class "px-4 py-2 border rounded-md shadow-sm"
                        , class "w-full flex items-center justify-center"
                        ]
                        [ text "Pourquoi Elm ?" ]
                    ]
                ]
            ]
        ]


layoutFooter : Html.Styled.Html msg
layoutFooter =
    footer
        [ class "bg-white"
        , attribute "aria-labelledby" "footer-heading"
        ]
        [ div
            [ class "max-w-7xl border-t border-gray-200 pt-8 mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8"
            ]
            [ div
                [ class "md:grid md:grid-cols-5 md:gap-8 space-y-12 md:space-y-0"
                ]
                [ footerItems "Communauté"
                    [ { label = "Discord"
                      , url = "https://discord.gg/ZRvrcu7R3U"
                      }
                    , { label = "Twitter"
                      , url = "https://twitter.com/ElmFrance"
                      }
                    ]
                , footerItems "Sources"
                    [ { label = "Guide Elm en Français"
                      , url = "https://github.com/elm-france/guide.elm-lang.org"
                      }
                    , { label = "Elm-france.fr"
                      , url = "https://github.com/elm-france/elm-france.fr"
                      }
                    ]
                , footerItems "Ressources"
                    [ { label = "Pourquoi Elm ?"
                      , url = "/pourquoi-elm"
                      }
                    ]
                ]
            ]
        ]


footerItems : String -> List { url : String, label : String } -> Html.Styled.Html msg
footerItems title items =
    div []
        [ h3
            [ class "text-sm font-semibold text-gray-400 tracking-wider uppercase" ]
            [ text title ]
        , ul
            [ attribute "role" "list"
            , class "mt-4 space-y-4"
            ]
          <|
            List.map
                (\item ->
                    li []
                        [ a
                            [ href item.url
                            , class "text-base text-gray-500 hover:text-gray-900"
                            ]
                            [ text item.label ]
                        ]
                )
                items
        ]
