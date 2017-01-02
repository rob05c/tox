defmodule Tox.PhysicalLocationControllerTest do
  use Tox.ConnCase

  alias Tox.PhysicalLocation
  @valid_attrs %{address: "some content", city: "some content", comments: "some content", email: "some content", name: "some content", phone: "some content", poc: "some content", region: 42, short_name: "some content", state: "some content", zip: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, physical_location_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    physical_location = Repo.insert! %PhysicalLocation{}
    conn = get conn, physical_location_path(conn, :show, physical_location)
    assert json_response(conn, 200)["data"] == %{"id" => physical_location.id,
      "name" => physical_location.name,
      "short_name" => physical_location.short_name,
      "address" => physical_location.address,
      "city" => physical_location.city,
      "state" => physical_location.state,
      "zip" => physical_location.zip,
      "poc" => physical_location.poc,
      "phone" => physical_location.phone,
      "email" => physical_location.email,
      "comments" => physical_location.comments,
      "region" => physical_location.region}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, physical_location_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, physical_location_path(conn, :create), physical_location: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(PhysicalLocation, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, physical_location_path(conn, :create), physical_location: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    physical_location = Repo.insert! %PhysicalLocation{}
    conn = put conn, physical_location_path(conn, :update, physical_location), physical_location: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(PhysicalLocation, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    physical_location = Repo.insert! %PhysicalLocation{}
    conn = put conn, physical_location_path(conn, :update, physical_location), physical_location: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    physical_location = Repo.insert! %PhysicalLocation{}
    conn = delete conn, physical_location_path(conn, :delete, physical_location)
    assert response(conn, 204)
    refute Repo.get(PhysicalLocation, physical_location.id)
  end
end
