module Page.Index exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html.Styled exposing (Html, a, div, h1, h2, img, p, text)
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
            { title = "Un langage exquis pour des web apps fiables."
            , description =
                [ p [] [ text "Elm est un langage facile à apprendre et avec des messages d’erreur conviviaux." ]
                , p [ class "mt-4" ] [ text "En production, vos web apps sont performantes et ne génèrent aucune erreur d'exécution." ]
                ]
            , image = img [ src "/img/elm-example.png" ] []
            }
        , div
            [ class "py-16 pl-8 pr-2 space-y-10 md:space-y-0 md:grid md:grid-cols-2 md:gap-x-8 md:gap-y-12" ]
          <|
            List.map feature descriptions
        ]
    }


descriptions =
    [ { title = "Oubliez les erreurs JavaScript"
      , description = "Elm utilise l’inférence de type pour détecter les corner cases et donner des indications précieuses. NoRedInk est passée à Elm il y a 7 ans et 300k+ lignes plus tard, ils n’ont toujours pas eu à déplorer la moindre erreur d'exécution."
      }
    , { title = "Des feedbacks rapides et utiles"
      , description = "Profitez des fameux messages d'erreurs de Elm. Même avec des bases de code de centaines de milliers de lignes, la compilation passe comme un éclair."
      }
    , { title = "Des performances incroyables"
      , description = "Elm possède sa propre implémentation du virtual DOM, conçue pour la simplicité et la rapidité. Toutes les valeurs sont immuables et les rapports de performance montrent que cela aide à générer un code Javascript particulièrement rapide."
      }
    , { title = "Un versionnement sémantique automatique"
      , description = "Elm détecte tout seul les changements d’API grâce à son système de types. Cette information est utilisée pour garantir que chaque paquet Elm respecte le versionnement sémantique de manière rigoureuse. Vous n’aurez pas de surprises en publiant des versions mineures."
      }
    , { title = "Des applications ultra-légères"
      , description = "La petite taille des fichiers Javascript générés mène à des chargements de page plus rapides. Elm met en oeuvre de nombreuses optimisations à cet effet : par exemple le code mort est automatiquement supprimé. Compilez simplement avec l’option --optimize et laissez le compilateur faire le reste. Sans installation complexe.\n"
      }
    , { title = "Une interopérabilité avec JavaScript"
      , description = "Elm peut prendre en charge un noeud HTML unique, vous pouvez donc l’essayer sur une petite partie d’un projet existant. Essayez d’abord sur un cas réduit.\n"
      }
    ]


hero :
    { a
        | title : String
        , description : List (Html msg)
        , image : Html msg
    }
    -> Html.Styled.Html msg
hero config =
    div
        [ class "max-w-7xl mx-auto lg:flex items-center px-4 sm:px-6 lg:px-8" ]
        [ div
            [ class "mx-auto max-w-2xl lg:pb-16" ]
            [ div
                [ class "sm:text-center lg:text-left" ]
                [ h1
                    [ class "text-4xl tracking-tight font-bold text-gray-900 sm:text-5xl md:text-5xl" ]
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
        , div
            [ class "grow flex items-center justify-center lg:-mr-20" ]
            [ div [ class "w-auto md:w-[740px]" ] [ config.image ]
            ]
        ]


feature : { a | title : String, description : String } -> Html msg
feature config =
    div
        [ class "max-w-md" ]
        [ h2 [ class "text-2xl font-bold" ] [ text config.title ]
        , p [ class "mt-3 text-base text-gray-500" ] [ text config.description ]
        ]
