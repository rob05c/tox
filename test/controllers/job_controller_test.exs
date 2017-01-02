defmodule Tox.JobControllerTest do
  use Tox.ConnCase

  alias Tox.Job
  @valid_attrs %{agent: 42, asset_type: "some content", asset_url: "some content", entered_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, job_deliveryservice: 42, job_user: 42, keyword: "some content", object_name: "some content", object_type: "some content", parameters: "some content", start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, status: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, job_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    job = Repo.insert! %Job{}
    conn = get conn, job_path(conn, :show, job)
    assert json_response(conn, 200)["data"] == %{"id" => job.id,
      "agent" => job.agent,
      "object_type" => job.object_type,
      "object_name" => job.object_name,
      "keyword" => job.keyword,
      "parameters" => job.parameters,
      "asset_url" => job.asset_url,
      "asset_type" => job.asset_type,
      "status" => job.status,
      "start_time" => job.start_time,
      "entered_time" => job.entered_time,
      "job_user" => job.job_user,
      "job_deliveryservice" => job.job_deliveryservice}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, job_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, job_path(conn, :create), job: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Job, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, job_path(conn, :create), job: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    job = Repo.insert! %Job{}
    conn = put conn, job_path(conn, :update, job), job: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Job, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    job = Repo.insert! %Job{}
    conn = put conn, job_path(conn, :update, job), job: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    job = Repo.insert! %Job{}
    conn = delete conn, job_path(conn, :delete, job)
    assert response(conn, 204)
    refute Repo.get(Job, job.id)
  end
end
