defmodule Tox.CachegroupControllerTest do
  use Tox.ConnCase

  alias Tox.Cachegroup
  @valid_attrs %{latitude: "120.5", longitude: "120.5", name: "some content", parent_cachegroup_id: 42, secondary_parent_cachegroup_id: 42, short_name: "some content", type: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cachegroup_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    cachegroup = Repo.insert! %Cachegroup{}
    conn = get conn, cachegroup_path(conn, :show, cachegroup)
    assert json_response(conn, 200)["data"] == %{"id" => cachegroup.id,
      "name" => cachegroup.name,
      "short_name" => cachegroup.short_name,
      "latitude" => cachegroup.latitude,
      "longitude" => cachegroup.longitude,
      "parent_cachegroup_id" => cachegroup.parent_cachegroup_id,
      "secondary_parent_cachegroup_id" => cachegroup.secondary_parent_cachegroup_id,
      "type" => cachegroup.type}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, cachegroup_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, cachegroup_path(conn, :create), cachegroup: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Cachegroup, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cachegroup_path(conn, :create), cachegroup: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    cachegroup = Repo.insert! %Cachegroup{}
    conn = put conn, cachegroup_path(conn, :update, cachegroup), cachegroup: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Cachegroup, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    cachegroup = Repo.insert! %Cachegroup{}
    conn = put conn, cachegroup_path(conn, :update, cachegroup), cachegroup: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    cachegroup = Repo.insert! %Cachegroup{}
    conn = delete conn, cachegroup_path(conn, :delete, cachegroup)
    assert response(conn, 204)
    refute Repo.get(Cachegroup, cachegroup.id)
  end
end
