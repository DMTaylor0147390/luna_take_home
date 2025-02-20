defmodule LunaTakeHomeWeb.PageController do
  use LunaTakeHomeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def url_submission(conn, _params) do
    extra = %{foo: "bar", default_url: "google.com"}
    render(conn, "url_submission_page.html", extra)
  end
end
