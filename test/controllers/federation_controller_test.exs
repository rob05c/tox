defmodule Tox.FederationControllerTest do
  use Tox.ConnCase

  alias Tox.Federation
  @valid_attrs %{cname: "some content", description: "some content", ttl: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, federation_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    federation = Repo.insert! %Federation{}
    conn = get conn, federation_path(conn, :show, federation)
    assert json_response(conn, 200)["data"] == %{"id" => federation.id,
      "cname" => federation.cname,
      "description" => federation.description,
      "ttl" => federation.ttl}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, federation_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, federation_path(conn, :create), federation: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Federation, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, federation_path(conn, :create), federation: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    federation = Repo.insert! %Federation{}
    conn = put conn, federation_path(conn, :update, federation), federation: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Federation, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    federation = Repo.insert! %Federation{}
    conn = put conn, federation_path(conn, :update, federation), federation: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    federation = Repo.insert! %Federation{}
    conn = delete conn, federation_path(conn, :delete, federation)
    assert response(conn, 204)
    refute Repo.get(Federation, federation.id)
  end
end
