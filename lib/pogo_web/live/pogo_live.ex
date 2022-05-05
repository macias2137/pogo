defmodule PogoWeb.PogoLive do
  use PogoWeb, :live_view
  alias Pogo.Forecasts
  alias Pogo.Comments

  def mount(_params, _session, socket) do
    socket = assign(socket, :forecasts, Forecasts.list_forecasts())
    socket = assign(socket, :comments, Comments.list_comments())

    {:ok, socket}
  end
end
