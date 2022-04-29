defmodule PogoWeb.PageController do
  use PogoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
