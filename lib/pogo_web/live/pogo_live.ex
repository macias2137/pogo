defmodule PogoWeb.PogoLive do
  use PogoWeb, :live_view

  alias Pogo.Forecasts
  alias Pogo.Comments
  alias Pogo.Comments.Comment

  def mount(_params, _session, socket) do
    if connected?(socket), do: Comments.subscribe()
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

  @impl true
  def handle_info({:comment_created, comment}, socket) do
    {:noreply, update(socket, :comments, fn comments -> [comment | comments] end)}
    IO.inspect(:comments)
  end

end
