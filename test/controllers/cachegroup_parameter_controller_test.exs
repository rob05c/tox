defmodule Tox.CachegroupParameterControllerTest do
  use Tox.ConnCase

  alias Tox.CachegroupParameter
  @valid_attrs %{cachegroup: 42, parameter: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cachegroup_parameter_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    cachegroup_parameter = Repo.insert! %CachegroupParameter{}
    conn = get conn, cachegroup_parameter_path(conn, :show, cachegroup_parameter)
    assert json_response(conn, 200)["data"] == %{"id" => cachegroup_parameter.id,
      "cachegroup" => cachegroup_parameter.cachegroup,
      "parameter" => cachegroup_parameter.parameter}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, cachegroup_parameter_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, cachegroup_parameter_path(conn, :create), cachegroup_parameter: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(CachegroupParameter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cachegroup_parameter_path(conn, :create), cachegroup_parameter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    cachegroup_parameter = Repo.insert! %CachegroupParameter{}
    conn = put conn, cachegroup_parameter_path(conn, :update, cachegroup_parameter), cachegroup_parameter: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(CachegroupParameter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    cachegroup_parameter = Repo.insert! %CachegroupParameter{}
    conn = put conn, cachegroup_parameter_path(conn, :update, cachegroup_parameter), cachegroup_parameter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    cachegroup_parameter = Repo.insert! %CachegroupParameter{}
    conn = delete conn, cachegroup_parameter_path(conn, :delete, cachegroup_parameter)
    assert response(conn, 204)
    refute Repo.get(CachegroupParameter, cachegroup_parameter.id)
  end
end
