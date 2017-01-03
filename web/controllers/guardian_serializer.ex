defmodule Tox.GuardianSerializer do
  @behaviour Guardian.Serializer
  alias Tox.Repo
  alias Tox.User
  def for_token(user = %User{}), do: {:ok, "User:#{user.email}"}
  def for_token(_), do: {:error, "Unknown resource type"}
  def from_token("User:" <> email), do: {:ok, Repo.get(User, email)}
  def from_token(_), do: {:error, "Unknown resource type"}
end
