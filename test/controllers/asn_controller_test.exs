defmodule Tox.AsnControllerTest do
  use Tox.ConnCase

  alias Tox.Asn
  @valid_attrs %{asn: 42, cachegroup: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, asn_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    asn = Repo.insert! %Asn{}
    conn = get conn, asn_path(conn, :show, asn)
    assert json_response(conn, 200)["data"] == %{"id" => asn.id,
      "asn" => asn.asn,
      "cachegroup" => asn.cachegroup}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, asn_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, asn_path(conn, :create), asn: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Asn, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, asn_path(conn, :create), asn: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    asn = Repo.insert! %Asn{}
    conn = put conn, asn_path(conn, :update, asn), asn: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Asn, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    asn = Repo.insert! %Asn{}
    conn = put conn, asn_path(conn, :update, asn), asn: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    asn = Repo.insert! %Asn{}
    conn = delete conn, asn_path(conn, :delete, asn)
    assert response(conn, 204)
    refute Repo.get(Asn, asn.id)
  end
end
