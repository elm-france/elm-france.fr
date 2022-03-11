module Page.License exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import DataSource.File
import Head
import Head.Seo as Seo
import Html.Styled exposing (Html, pre, text)
import Html.Styled.Attributes exposing (class)
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


data : DataSource Data
data =
    DataSource.File.rawFile "LICENSE"


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head _ =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Elm-Pages Batteries"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "todo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "LICENSE"
        , locale = Nothing
        , title = "LICENSE"
        }
        |> Seo.website


type alias Data =
    String


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view _ _ payload =
    { title = "LICENSE"
    , body =
        [ pre
            [ class "p-4 bg-gray-50" ]
            [ text payload.data ]
        ]
    }
