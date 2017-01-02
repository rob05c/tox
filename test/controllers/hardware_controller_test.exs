defmodule Tox.HardwareControllerTest do
  use Tox.ConnCase

  alias Tox.Hardware
  @valid_attrs %{description: "some content", server: 42, value: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hardware_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    hardware = Repo.insert! %Hardware{}
    conn = get conn, hardware_path(conn, :show, hardware)
    assert json_response(conn, 200)["data"] == %{"id" => hardware.id,
      "server" => hardware.server,
      "description" => hardware.description,
      "value" => hardware.value}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hardware_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, hardware_path(conn, :create), hardware: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Hardware, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hardware_path(conn, :create), hardware: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    hardware = Repo.insert! %Hardware{}
    conn = put conn, hardware_path(conn, :update, hardware), hardware: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Hardware, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hardware = Repo.insert! %Hardware{}
    conn = put conn, hardware_path(conn, :update, hardware), hardware: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    hardware = Repo.insert! %Hardware{}
    conn = delete conn, hardware_path(conn, :delete, hardware)
    assert response(conn, 204)
    refute Repo.get(Hardware, hardware.id)
  end
end
