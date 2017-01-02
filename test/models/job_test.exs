defmodule Tox.JobTest do
  use Tox.ModelCase

  alias Tox.Job

  @valid_attrs %{agent: 42, asset_type: "some content", asset_url: "some content", entered_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, job_deliveryservice: 42, job_user: 42, keyword: "some content", object_name: "some content", object_type: "some content", parameters: "some content", start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, status: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Job.changeset(%Job{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Job.changeset(%Job{}, @invalid_attrs)
    refute changeset.valid?
  end
end
