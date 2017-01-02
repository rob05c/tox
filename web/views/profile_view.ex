defmodule Tox.ProfileView do
  use Tox.Web, :view

  def render("index.json", %{profiles: profiles}) do
    %{data: render_many(profiles, Tox.ProfileView, "profile.json")}
  end

  def render("show.json", %{profile: profile}) do
    %{data: render_one(profile, Tox.ProfileView, "profile.json")}
  end

  def render("profile.json", %{profile: profile}) do
    %{id: profile.id,
      name: profile.name,
      description: profile.description}
  end
end
