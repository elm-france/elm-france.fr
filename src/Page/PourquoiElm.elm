module Page.PourquoiElm exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import DataSource.File
import Head
import Head.Seo as Seo
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (class)
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)
import View.Markdown


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


type alias Data =
    Html Msg


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


data : DataSource Data
data =
    DataSource.File.rawFile "content/PourquoiElm.md"
        |> DataSource.map View.Markdown.toHtml


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
        , description = "Pourquoi Elm ?"
        , locale = Nothing
        , title = "Pourquoi Elm ?"
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view _ _ payload =
    { title = "Pourquoi Elm ?"
    , body = [ div [ class "px-6" ] [ payload.data ] ]
    }
