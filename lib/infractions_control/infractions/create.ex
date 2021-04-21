defmodule InfractionsControl.Infractions.Create do
  @moduledoc """
  This module is responsible for creates a new infraction
  """

  alias InfractionsControl.{Error, Infraction, Repo}

  def call(params) do
    params
    |> Infraction.changeset()
    |> Repo.insert()
    |> handle_insert_response()
  end

  def handle_insert_response({:ok, %Infraction{} = infraction}) do
    {:ok, Repo.preload(infraction, [:city, :infraction_type])}
  end

  def handle_insert_response({:error, changeset}),
    do: {:error, %Error{status: :bad_request, result: changeset}}
end
