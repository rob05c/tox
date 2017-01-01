defmodule Tox.DivisionControllerTest do
  use Tox.ConnCase

  alias Tox.Division
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, division_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    division = Repo.insert! %Division{}
    conn = get conn, division_path(conn, :show, division)
    assert json_response(conn, 200)["data"] == %{"id" => division.id,
      "name" => division.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, division_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, division_path(conn, :create), division: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Division, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, division_path(conn, :create), division: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    division = Repo.insert! %Division{}
    conn = put conn, division_path(conn, :update, division), division: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Division, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    division = Repo.insert! %Division{}
    conn = put conn, division_path(conn, :update, division), division: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    division = Repo.insert! %Division{}
    conn = delete conn, division_path(conn, :delete, division)
    assert response(conn, 204)
    refute Repo.get(Division, division.id)
  end
end
