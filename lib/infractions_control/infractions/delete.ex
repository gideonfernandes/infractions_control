defmodule InfractionsControl.Infractions.Delete do
  @moduledoc """
  This module is responsible for deletes an specific infraction
  """

  alias InfractionsControl.{Error, Infraction, Repo}

  def call(id) do
    with %Infraction{} = infraction <- Repo.get(Infraction, id),
         {:ok, %Infraction{} = deleted_infraction} <- Repo.delete(infraction) do
      {:ok, deleted_infraction}
    else
      nil -> {:error, Error.build_infraction_not_found()}
      {:error, changeset} -> {:error, %Error{status: :bad_request, result: changeset}}
    end
  end
end
