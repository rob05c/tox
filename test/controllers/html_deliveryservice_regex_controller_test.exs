defmodule Tox.HtmlDeliveryserviceRegexControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlDeliveryserviceRegex
  @valid_attrs %{deliveryservice: 42, regex: 42, set_number: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_deliveryservice_regex_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing deliveryserviceregexes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_deliveryservice_regex_path(conn, :new)
    assert html_response(conn, 200) =~ "New html deliveryservice regex"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_deliveryservice_regex_path(conn, :create), html_deliveryservice_regex: @valid_attrs
    assert redirected_to(conn) == html_deliveryservice_regex_path(conn, :index)
    assert Repo.get_by(HtmlDeliveryserviceRegex, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_deliveryservice_regex_path(conn, :create), html_deliveryservice_regex: @invalid_attrs
    assert html_response(conn, 200) =~ "New html deliveryservice regex"
  end

  test "shows chosen resource", %{conn: conn} do
    html_deliveryservice_regex = Repo.insert! %HtmlDeliveryserviceRegex{}
    conn = get conn, html_deliveryservice_regex_path(conn, :show, html_deliveryservice_regex)
    assert html_response(conn, 200) =~ "Show html deliveryservice regex"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_deliveryservice_regex_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_deliveryservice_regex = Repo.insert! %HtmlDeliveryserviceRegex{}
    conn = get conn, html_deliveryservice_regex_path(conn, :edit, html_deliveryservice_regex)
    assert html_response(conn, 200) =~ "Edit html deliveryservice regex"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_deliveryservice_regex = Repo.insert! %HtmlDeliveryserviceRegex{}
    conn = put conn, html_deliveryservice_regex_path(conn, :update, html_deliveryservice_regex), html_deliveryservice_regex: @valid_attrs
    assert redirected_to(conn) == html_deliveryservice_regex_path(conn, :show, html_deliveryservice_regex)
    assert Repo.get_by(HtmlDeliveryserviceRegex, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_deliveryservice_regex = Repo.insert! %HtmlDeliveryserviceRegex{}
    conn = put conn, html_deliveryservice_regex_path(conn, :update, html_deliveryservice_regex), html_deliveryservice_regex: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html deliveryservice regex"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_deliveryservice_regex = Repo.insert! %HtmlDeliveryserviceRegex{}
    conn = delete conn, html_deliveryservice_regex_path(conn, :delete, html_deliveryservice_regex)
    assert redirected_to(conn) == html_deliveryservice_regex_path(conn, :index)
    refute Repo.get(HtmlDeliveryserviceRegex, html_deliveryservice_regex.id)
  end
end
