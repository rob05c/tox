defmodule Tox.JobView do
  use Tox.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, Tox.JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, Tox.JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      agent: job.agent,
      object_type: job.object_type,
      object_name: job.object_name,
      keyword: job.keyword,
      parameters: job.parameters,
      asset_url: job.asset_url,
      asset_type: job.asset_type,
      status: job.status,
      start_time: job.start_time,
      entered_time: job.entered_time,
      job_user: job.job_user,
      job_deliveryservice: job.job_deliveryservice}
  end
end
