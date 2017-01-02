defmodule Tox.HtmlProfileControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlProfile
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_profile_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing profiles"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_profile_path(conn, :new)
    assert html_response(conn, 200) =~ "New html profile"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_profile_path(conn, :create), html_profile: @valid_attrs
    assert redirected_to(conn) == html_profile_path(conn, :index)
    assert Repo.get_by(HtmlProfile, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_profile_path(conn, :create), html_profile: @invalid_attrs
    assert html_response(conn, 200) =~ "New html profile"
  end

  test "shows chosen resource", %{conn: conn} do
    html_profile = Repo.insert! %HtmlProfile{}
    conn = get conn, html_profile_path(conn, :show, html_profile)
    assert html_response(conn, 200) =~ "Show html profile"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_profile_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_profile = Repo.insert! %HtmlProfile{}
    conn = get conn, html_profile_path(conn, :edit, html_profile)
    assert html_response(conn, 200) =~ "Edit html profile"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_profile = Repo.insert! %HtmlProfile{}
    conn = put conn, html_profile_path(conn, :update, html_profile), html_profile: @valid_attrs
    assert redirected_to(conn) == html_profile_path(conn, :show, html_profile)
    assert Repo.get_by(HtmlProfile, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_profile = Repo.insert! %HtmlProfile{}
    conn = put conn, html_profile_path(conn, :update, html_profile), html_profile: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html profile"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_profile = Repo.insert! %HtmlProfile{}
    conn = delete conn, html_profile_path(conn, :delete, html_profile)
    assert redirected_to(conn) == html_profile_path(conn, :index)
    refute Repo.get(HtmlProfile, html_profile.id)
  end
end
