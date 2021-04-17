# mix run priv/repo/seeds.exs

require Logger

alias InfractionsControl.Repo
alias InfractionsControl.Countries.Import, as: ImportCountries
alias InfractionsControl.States.Import, as: ImportStates
alias InfractionsControl.Cities.Import, as: ImportCities
alias InfractionsControl.InfractionTypes.Import, as: ImportInfractionTypes
alias InfractionsControl.FinancialBanks.Import, as: ImportFinancialBanks

case Repo.exists?(InfractionsControl.Country) do
  true ->
    Logger.info("Countries is already imported...")

  false ->
    Logger.info("Importing countries...")
    ImportCountries.call()
    Logger.info("Countries created successfully!")
end

case Repo.exists?(InfractionsControl.State) do
  true ->
    Logger.info("States is already imported...")

  false ->
    Logger.info("Importing states...")
    ImportStates.call()
    Logger.info("States created successfully!")
end

case Repo.exists?(InfractionsControl.City) do
  true ->
    Logger.info("Cities is already imported...")

  false ->
    Logger.info("Importing cities...")
    ImportCities.call()
    Logger.info("Cities created successfully!")
end

case Repo.exists?(InfractionsControl.InfractionType) do
  true ->
    Logger.info("Infraction types is already imported...")

  false ->
    Logger.info("Importing infraction types...")
    ImportInfractionTypes.call()
    Logger.info("Infraction types created successfully!")
end

case Repo.exists?(InfractionsControl.FinancialBank) do
  true ->
    Logger.info("Financial banks is already imported...")

  false ->
    Logger.info("Importing financial banks...")
    ImportFinancialBanks.call()
    Logger.info("Financial banks created successfully!")
end
