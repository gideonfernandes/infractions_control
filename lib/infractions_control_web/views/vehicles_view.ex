defmodule InfractionsControlWeb.VehiclesView do
  use InfractionsControlWeb, :view

  alias InfractionsControl.Vehicle

  def render("create.json", %{vehicle: %Vehicle{} = vehicle}) do
    %{message: "Vehicle created successfully!", vehicle: vehicle}
  end

  def render("index.json", %{vehicles: vehicles}) do
    Enum.map(vehicles, fn vehicle -> render("show.json", vehicle: vehicle) end)
  end

  def render("show.json", %{vehicle: %Vehicle{} = vehicle}), do: %{vehicle: vehicle}

  def render("update.json", %{vehicle: %Vehicle{} = vehicle}) do
    %{message: "Vehicle updated successfully!", vehicle: vehicle}
  end
end
