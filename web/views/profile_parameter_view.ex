defmodule Tox.ProfileParameterView do
  use Tox.Web, :view

  def render("index.json", %{profileparameters: profileparameters}) do
    %{data: render_many(profileparameters, Tox.ProfileParameterView, "profile_parameter.json")}
  end

  def render("show.json", %{profile_parameter: profile_parameter}) do
    %{data: render_one(profile_parameter, Tox.ProfileParameterView, "profile_parameter.json")}
  end

  def render("profile_parameter.json", %{profile_parameter: profile_parameter}) do
    %{id: profile_parameter.id,
      profile: profile_parameter.profile,
      parameter: profile_parameter.parameter}
  end
end
