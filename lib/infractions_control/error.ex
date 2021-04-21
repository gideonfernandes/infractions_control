defmodule InfractionsControl.Error do
  @moduledoc """
  This module defines & represents the default error struct
  """

  defstruct [:status, :result]

  def build(%{status: status, result: result}) do
    %__MODULE__{status: status, result: result}
  end

  def build_uuid_format_error, do: build(%{status: :bad_request, result: "Invalid UUID format!"})
  def build_went_wrong_error, do: build(%{status: :bad_request, result: "Something went wrong"})

  def build_infraction_not_found do
    build(%{status: :bad_request, result: "Infraction not found..."})
  end

  def build_vehicle_not_found, do: build(%{status: :bad_request, result: "Vehicle not found..."})
end
