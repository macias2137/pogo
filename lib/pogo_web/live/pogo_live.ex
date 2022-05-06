defmodule PogoWeb.PogoLive do
  use PogoWeb, :live_view

  alias Pogo.Forecasts
  alias Pogo.Comments
  alias Pogo.Comments.Comment

  def mount(_params, _session, socket) do
    socket = assign(socket, :forecasts, Forecasts.list_forecasts())
    socket = assign(socket, :comments, Comments.list_comments())
    socket = assign(socket, %{changeset: Comment.changeset(%Comment{})})

    {:ok, socket}
  end

  def handle_event("save", %{"comment" => comment_params}, socket) do
    case Comments.create_comment(comment_params) do
      {:ok, comment} ->
        {:noreply, socket
      |> assign(:comments, Comments.list_comments())}
    end
  end
end
