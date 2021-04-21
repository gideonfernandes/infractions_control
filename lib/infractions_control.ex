defmodule InfractionsControl do
  @moduledoc """
  InfractionsControl keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias InfractionsControl.Infractions.Create, as: CreateInfraction
  alias InfractionsControl.Infractions.Delete, as: DeleteInfraction
  alias InfractionsControl.Infractions.Index, as: IndexInfractions
  alias InfractionsControl.Infractions.Show, as: ShowInfraction
  alias InfractionsControl.Infractions.Update, as: UpdateInfraction
  alias InfractionsControl.Vehicles.Create, as: CreateVehicle
  alias InfractionsControl.Vehicles.Delete, as: DeleteVehicle
  alias InfractionsControl.Vehicles.Index, as: IndexVehicles
  alias InfractionsControl.Vehicles.Show, as: ShowVehicle
  alias InfractionsControl.Vehicles.Update, as: UpdateVehicle

  defdelegate create_infraction(params), to: CreateInfraction, as: :call
  defdelegate delete_infraction(params), to: DeleteInfraction, as: :call
  defdelegate index_infractions, to: IndexInfractions, as: :call
  defdelegate show_infraction(id), to: ShowInfraction, as: :call
  defdelegate update_infraction(id), to: UpdateInfraction, as: :call

  defdelegate create_vehicle(params), to: CreateVehicle, as: :call
  defdelegate delete_vehicle(params), to: DeleteVehicle, as: :call
  defdelegate index_vehicles, to: IndexVehicles, as: :call
  defdelegate show_vehicle(id), to: ShowVehicle, as: :call
  defdelegate update_vehicle(id), to: UpdateVehicle, as: :call
end
