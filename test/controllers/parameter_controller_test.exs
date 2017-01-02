defmodule Tox.ParameterControllerTest do
  use Tox.ConnCase

  alias Tox.Parameter
  @valid_attrs %{config_file: "some content", name: "some content", secure: true, value: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, parameter_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    parameter = Repo.insert! %Parameter{}
    conn = get conn, parameter_path(conn, :show, parameter)
    assert json_response(conn, 200)["data"] == %{"id" => parameter.id,
      "name" => parameter.name,
      "config_file" => parameter.config_file,
      "value" => parameter.value,
      "secure" => parameter.secure}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, parameter_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, parameter_path(conn, :create), parameter: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Parameter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, parameter_path(conn, :create), parameter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    parameter = Repo.insert! %Parameter{}
    conn = put conn, parameter_path(conn, :update, parameter), parameter: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Parameter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    parameter = Repo.insert! %Parameter{}
    conn = put conn, parameter_path(conn, :update, parameter), parameter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    parameter = Repo.insert! %Parameter{}
    conn = delete conn, parameter_path(conn, :delete, parameter)
    assert response(conn, 204)
    refute Repo.get(Parameter, parameter.id)
  end
end
