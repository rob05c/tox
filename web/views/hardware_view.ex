defmodule Tox.HardwareView do
  use Tox.Web, :view

  def render("index.json", %{hardwares: hardwares}) do
    %{data: render_many(hardwares, Tox.HardwareView, "hardware.json")}
  end

  def render("show.json", %{hardware: hardware}) do
    %{data: render_one(hardware, Tox.HardwareView, "hardware.json")}
  end

  def render("hardware.json", %{hardware: hardware}) do
    %{id: hardware.id,
      server: hardware.server,
      description: hardware.description,
      value: hardware.value}
  end
end
