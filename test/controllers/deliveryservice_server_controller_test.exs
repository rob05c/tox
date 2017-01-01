defmodule Tox.DeliveryserviceServerControllerTest do
  use Tox.ConnCase

  alias Tox.DeliveryserviceServer
  @valid_attrs %{deliveryservice: 42, server: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, deliveryservice_server_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    deliveryservice_server = Repo.insert! %DeliveryserviceServer{}
    conn = get conn, deliveryservice_server_path(conn, :show, deliveryservice_server)
    assert json_response(conn, 200)["data"] == %{"id" => deliveryservice_server.id,
      "deliveryservice" => deliveryservice_server.deliveryservice,
      "server" => deliveryservice_server.server}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, deliveryservice_server_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, deliveryservice_server_path(conn, :create), deliveryservice_server: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(DeliveryserviceServer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, deliveryservice_server_path(conn, :create), deliveryservice_server: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    deliveryservice_server = Repo.insert! %DeliveryserviceServer{}
    conn = put conn, deliveryservice_server_path(conn, :update, deliveryservice_server), deliveryservice_server: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(DeliveryserviceServer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    deliveryservice_server = Repo.insert! %DeliveryserviceServer{}
    conn = put conn, deliveryservice_server_path(conn, :update, deliveryservice_server), deliveryservice_server: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    deliveryservice_server = Repo.insert! %DeliveryserviceServer{}
    conn = delete conn, deliveryservice_server_path(conn, :delete, deliveryservice_server)
    assert response(conn, 204)
    refute Repo.get(DeliveryserviceServer, deliveryservice_server.id)
  end
end
