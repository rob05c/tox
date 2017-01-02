defmodule Tox.ProfileParameterControllerTest do
  use Tox.ConnCase

  alias Tox.ProfileParameter
  @valid_attrs %{parameter: 42, profile: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, profile_parameter_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    profile_parameter = Repo.insert! %ProfileParameter{}
    conn = get conn, profile_parameter_path(conn, :show, profile_parameter)
    assert json_response(conn, 200)["data"] == %{"id" => profile_parameter.id,
      "profile" => profile_parameter.profile,
      "parameter" => profile_parameter.parameter}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, profile_parameter_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, profile_parameter_path(conn, :create), profile_parameter: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ProfileParameter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, profile_parameter_path(conn, :create), profile_parameter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    profile_parameter = Repo.insert! %ProfileParameter{}
    conn = put conn, profile_parameter_path(conn, :update, profile_parameter), profile_parameter: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ProfileParameter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    profile_parameter = Repo.insert! %ProfileParameter{}
    conn = put conn, profile_parameter_path(conn, :update, profile_parameter), profile_parameter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    profile_parameter = Repo.insert! %ProfileParameter{}
    conn = delete conn, profile_parameter_path(conn, :delete, profile_parameter)
    assert response(conn, 204)
    refute Repo.get(ProfileParameter, profile_parameter.id)
  end
end
