defmodule Tox.PhysicalLocationView do
  use Tox.Web, :view

  def render("index.json", %{physicallocations: physicallocations}) do
    %{data: render_many(physicallocations, Tox.PhysicalLocationView, "physical_location.json")}
  end

  def render("show.json", %{physical_location: physical_location}) do
    %{data: render_one(physical_location, Tox.PhysicalLocationView, "physical_location.json")}
  end

  def render("physical_location.json", %{physical_location: physical_location}) do
    %{name: physical_location.name,
      short_name: physical_location.short_name,
      address: physical_location.address,
      city: physical_location.city,
      state: physical_location.state,
      zip: physical_location.zip,
      poc: physical_location.poc,
      phone: physical_location.phone,
      email: physical_location.email,
      comments: physical_location.comments,
      region: physical_location.region}
  end
end
