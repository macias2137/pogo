defmodule Pogo.Comments do
  alias Pogo.Comments.Comment
  alias Pogo.Repo

  def list_comments do
    Repo.all(Comment)
  end

  def create_comment(params \\ %{}) do
    %Comment{}
    |> Comment.changeset(params)
    |> Repo.insert
    |> broadcast(:comment_created)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Pogo.PubSub, "comments")
  end

  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, comment}, event) do
    Phoenix.PubSub.broadcast(Pogo.PubSub, "comments", {event, comment})
    {:ok, comment}
  end
end
