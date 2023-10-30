defmodule PhxNew16Web.PageController do
  use PhxNew16Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
