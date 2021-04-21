defmodule InfractionsControl.Infractions.Update do
  @moduledoc """
  This module is responsible to updates an infraction
  """

  alias InfractionsControl.{Error, Infraction, Repo}

  def call(%{"id" => id} = attrs) do
    with %Infraction{} = infraction <- Repo.get(Infraction, id),
         {:ok, %Infraction{} = updated_infraction} <- update_changeset(infraction, attrs) do
      {:ok, Repo.preload(updated_infraction, [:city, :infraction_type])}
    else
      nil -> {:error, Error.build_infraction_not_found()}
      {:error, changeset} -> {:error, %Error{status: :bad_request, result: changeset}}
    end
  end

  defp update_changeset(infraction, attrs) do
    Infraction.changeset(infraction, attrs)
    |> Repo.update()
  end
end
