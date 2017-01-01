defmodule Tox.DeliveryserviceRegexControllerTest do
  use Tox.ConnCase

  alias Tox.DeliveryserviceRegex
  @valid_attrs %{deliveryservice: 42, regex: 42, set_number: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, deliveryservice_regex_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    deliveryservice_regex = Repo.insert! %DeliveryserviceRegex{}
    conn = get conn, deliveryservice_regex_path(conn, :show, deliveryservice_regex)
    assert json_response(conn, 200)["data"] == %{"id" => deliveryservice_regex.id,
      "deliveryservice" => deliveryservice_regex.deliveryservice,
      "regex" => deliveryservice_regex.regex,
      "set_number" => deliveryservice_regex.set_number}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, deliveryservice_regex_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, deliveryservice_regex_path(conn, :create), deliveryservice_regex: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(DeliveryserviceRegex, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, deliveryservice_regex_path(conn, :create), deliveryservice_regex: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    deliveryservice_regex = Repo.insert! %DeliveryserviceRegex{}
    conn = put conn, deliveryservice_regex_path(conn, :update, deliveryservice_regex), deliveryservice_regex: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(DeliveryserviceRegex, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    deliveryservice_regex = Repo.insert! %DeliveryserviceRegex{}
    conn = put conn, deliveryservice_regex_path(conn, :update, deliveryservice_regex), deliveryservice_regex: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    deliveryservice_regex = Repo.insert! %DeliveryserviceRegex{}
    conn = delete conn, deliveryservice_regex_path(conn, :delete, deliveryservice_regex)
    assert response(conn, 204)
    refute Repo.get(DeliveryserviceRegex, deliveryservice_regex.id)
  end
end
