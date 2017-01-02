defmodule Tox.HtmlPhysicalLocationControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlPhysicalLocation
  @valid_attrs %{address: "some content", city: "some content", comments: "some content", email: "some content", name: "some content", phone: "some content", poc: "some content", region: 42, short_name: "some content", state: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_physical_location_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing physicallocations"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_physical_location_path(conn, :new)
    assert html_response(conn, 200) =~ "New html physical location"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_physical_location_path(conn, :create), html_physical_location: @valid_attrs
    assert redirected_to(conn) == html_physical_location_path(conn, :index)
    assert Repo.get_by(HtmlPhysicalLocation, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_physical_location_path(conn, :create), html_physical_location: @invalid_attrs
    assert html_response(conn, 200) =~ "New html physical location"
  end

  test "shows chosen resource", %{conn: conn} do
    html_physical_location = Repo.insert! %HtmlPhysicalLocation{}
    conn = get conn, html_physical_location_path(conn, :show, html_physical_location)
    assert html_response(conn, 200) =~ "Show html physical location"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_physical_location_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_physical_location = Repo.insert! %HtmlPhysicalLocation{}
    conn = get conn, html_physical_location_path(conn, :edit, html_physical_location)
    assert html_response(conn, 200) =~ "Edit html physical location"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_physical_location = Repo.insert! %HtmlPhysicalLocation{}
    conn = put conn, html_physical_location_path(conn, :update, html_physical_location), html_physical_location: @valid_attrs
    assert redirected_to(conn) == html_physical_location_path(conn, :show, html_physical_location)
    assert Repo.get_by(HtmlPhysicalLocation, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_physical_location = Repo.insert! %HtmlPhysicalLocation{}
    conn = put conn, html_physical_location_path(conn, :update, html_physical_location), html_physical_location: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html physical location"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_physical_location = Repo.insert! %HtmlPhysicalLocation{}
    conn = delete conn, html_physical_location_path(conn, :delete, html_physical_location)
    assert redirected_to(conn) == html_physical_location_path(conn, :index)
    refute Repo.get(HtmlPhysicalLocation, html_physical_location.id)
  end
end
