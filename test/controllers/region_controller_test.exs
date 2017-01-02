defmodule Tox.RegionControllerTest do
  use Tox.ConnCase

  alias Tox.Region
  @valid_attrs %{division: 42, name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, region_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    region = Repo.insert! %Region{}
    conn = get conn, region_path(conn, :show, region)
    assert json_response(conn, 200)["data"] == %{"id" => region.id,
      "name" => region.name,
      "division" => region.division}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, region_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, region_path(conn, :create), region: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Region, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, region_path(conn, :create), region: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    region = Repo.insert! %Region{}
    conn = put conn, region_path(conn, :update, region), region: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Region, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    region = Repo.insert! %Region{}
    conn = put conn, region_path(conn, :update, region), region: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    region = Repo.insert! %Region{}
    conn = delete conn, region_path(conn, :delete, region)
    assert response(conn, 204)
    refute Repo.get(Region, region.id)
  end
end
