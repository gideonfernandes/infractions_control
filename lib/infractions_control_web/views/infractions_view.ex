defmodule InfractionsControlWeb.InfractionsView do
  use InfractionsControlWeb, :view

  alias InfractionsControl.Infraction

  def render("create.json", %{infraction: %Infraction{} = infraction}) do
    %{message: "Infraction created successfully!", infraction: infraction}
  end

  def render("index.json", %{infractions: infractions}) do
    Enum.map(infractions, fn infraction -> render("show.json", infraction: infraction) end)
  end

  def render("show.json", %{infraction: %Infraction{} = infraction}) do
    %{infraction: infraction}
  end

  def render("update.json", %{infraction: %Infraction{} = infraction}) do
    %{message: "Infraction updated successfully!", infraction: infraction}
  end
end
