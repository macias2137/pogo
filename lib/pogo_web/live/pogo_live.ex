defmodule PogoWeb.PogoLive do
  use PogoWeb, :live_view
  alias Pogo.Forecasts

  def mount(_params, _session, socket) do
    socket = assign(socket, :forecasts, Forecasts.list_forecasts())
    IO.inspect socket
    {:ok, socket}
  end
end
