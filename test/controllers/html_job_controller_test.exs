defmodule Tox.HtmlJobControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlJob
  @valid_attrs %{agent: 42, asset_type: "some content", asset_url: "some content", entered_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, job_deliveryservice: 42, job_user: 42, keyword: "some content", object_name: "some content", object_type: "some content", parameters: "some content", start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, status: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_job_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing jobs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_job_path(conn, :new)
    assert html_response(conn, 200) =~ "New html job"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_job_path(conn, :create), html_job: @valid_attrs
    assert redirected_to(conn) == html_job_path(conn, :index)
    assert Repo.get_by(HtmlJob, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_job_path(conn, :create), html_job: @invalid_attrs
    assert html_response(conn, 200) =~ "New html job"
  end

  test "shows chosen resource", %{conn: conn} do
    html_job = Repo.insert! %HtmlJob{}
    conn = get conn, html_job_path(conn, :show, html_job)
    assert html_response(conn, 200) =~ "Show html job"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_job_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_job = Repo.insert! %HtmlJob{}
    conn = get conn, html_job_path(conn, :edit, html_job)
    assert html_response(conn, 200) =~ "Edit html job"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_job = Repo.insert! %HtmlJob{}
    conn = put conn, html_job_path(conn, :update, html_job), html_job: @valid_attrs
    assert redirected_to(conn) == html_job_path(conn, :show, html_job)
    assert Repo.get_by(HtmlJob, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_job = Repo.insert! %HtmlJob{}
    conn = put conn, html_job_path(conn, :update, html_job), html_job: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html job"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_job = Repo.insert! %HtmlJob{}
    conn = delete conn, html_job_path(conn, :delete, html_job)
    assert redirected_to(conn) == html_job_path(conn, :index)
    refute Repo.get(HtmlJob, html_job.id)
  end
end
