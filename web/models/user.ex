defmodule Tox.User do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :email}
  schema "users" do
    field :email, :string, primary_key: true
    field :password, :string, virtual: true
    field :password_hash, :string
    field :role, :string
    field :tenant, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(email), [])
    |> validate_format(:email, ~r/@/)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(put_role(params), ~w(password role tenant), [])
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  defp put_role(params) do
    roles = %{
      "1" => "super_admin",
      "2" => "ops_admin",
      "3" => "ops_readonly",
      "4" => "tenant_admin",
      "5" => "tenant_readonly"
    }
    case params["role"] do
      [role | _]  ->
        %{params | "role" => roles[role]}
      _ ->
        params
    end
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash,
          Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
