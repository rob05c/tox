defmodule Tox.HtmlProfileParameterControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlProfileParameter
  @valid_attrs %{parameter: 42, profile: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_profile_parameter_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing profileparameters"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_profile_parameter_path(conn, :new)
    assert html_response(conn, 200) =~ "New html profile parameter"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_profile_parameter_path(conn, :create), html_profile_parameter: @valid_attrs
    assert redirected_to(conn) == html_profile_parameter_path(conn, :index)
    assert Repo.get_by(HtmlProfileParameter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_profile_parameter_path(conn, :create), html_profile_parameter: @invalid_attrs
    assert html_response(conn, 200) =~ "New html profile parameter"
  end

  test "shows chosen resource", %{conn: conn} do
    html_profile_parameter = Repo.insert! %HtmlProfileParameter{}
    conn = get conn, html_profile_parameter_path(conn, :show, html_profile_parameter)
    assert html_response(conn, 200) =~ "Show html profile parameter"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_profile_parameter_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_profile_parameter = Repo.insert! %HtmlProfileParameter{}
    conn = get conn, html_profile_parameter_path(conn, :edit, html_profile_parameter)
    assert html_response(conn, 200) =~ "Edit html profile parameter"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_profile_parameter = Repo.insert! %HtmlProfileParameter{}
    conn = put conn, html_profile_parameter_path(conn, :update, html_profile_parameter), html_profile_parameter: @valid_attrs
    assert redirected_to(conn) == html_profile_parameter_path(conn, :show, html_profile_parameter)
    assert Repo.get_by(HtmlProfileParameter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_profile_parameter = Repo.insert! %HtmlProfileParameter{}
    conn = put conn, html_profile_parameter_path(conn, :update, html_profile_parameter), html_profile_parameter: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html profile parameter"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_profile_parameter = Repo.insert! %HtmlProfileParameter{}
    conn = delete conn, html_profile_parameter_path(conn, :delete, html_profile_parameter)
    assert redirected_to(conn) == html_profile_parameter_path(conn, :index)
    refute Repo.get(HtmlProfileParameter, html_profile_parameter.id)
  end
end
