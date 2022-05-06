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
  end
end
