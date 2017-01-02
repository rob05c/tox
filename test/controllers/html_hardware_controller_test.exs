defmodule Tox.HtmlHardwareControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlHardware
  @valid_attrs %{description: "some content", server: 42, value: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_hardware_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing hardwares"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_hardware_path(conn, :new)
    assert html_response(conn, 200) =~ "New html hardware"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_hardware_path(conn, :create), html_hardware: @valid_attrs
    assert redirected_to(conn) == html_hardware_path(conn, :index)
    assert Repo.get_by(HtmlHardware, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_hardware_path(conn, :create), html_hardware: @invalid_attrs
    assert html_response(conn, 200) =~ "New html hardware"
  end

  test "shows chosen resource", %{conn: conn} do
    html_hardware = Repo.insert! %HtmlHardware{}
    conn = get conn, html_hardware_path(conn, :show, html_hardware)
    assert html_response(conn, 200) =~ "Show html hardware"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_hardware_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_hardware = Repo.insert! %HtmlHardware{}
    conn = get conn, html_hardware_path(conn, :edit, html_hardware)
    assert html_response(conn, 200) =~ "Edit html hardware"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_hardware = Repo.insert! %HtmlHardware{}
    conn = put conn, html_hardware_path(conn, :update, html_hardware), html_hardware: @valid_attrs
    assert redirected_to(conn) == html_hardware_path(conn, :show, html_hardware)
    assert Repo.get_by(HtmlHardware, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_hardware = Repo.insert! %HtmlHardware{}
    conn = put conn, html_hardware_path(conn, :update, html_hardware), html_hardware: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html hardware"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_hardware = Repo.insert! %HtmlHardware{}
    conn = delete conn, html_hardware_path(conn, :delete, html_hardware)
    assert redirected_to(conn) == html_hardware_path(conn, :index)
    refute Repo.get(HtmlHardware, html_hardware.id)
  end
end
