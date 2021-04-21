# mix run priv/repo/seeds.exs

require Logger

alias InfractionsControl.Repo
alias InfractionsControl.Countries.Import, as: ImportCountries
alias InfractionsControl.States.Import, as: ImportStates
alias InfractionsControl.Cities.Import, as: ImportCities
alias InfractionsControl.InfractionTypes.Import, as: ImportInfractionTypes
alias InfractionsControl.FinancialBanks.Import, as: ImportFinancialBanks

already_imported_logger = fn entity -> Logger.info("#{entity} is already imported...") end

import_logger = fn entity_name, import_module ->
  Logger.info("Importing #{entity_name}...")
  import_module.call()
  Logger.info("#{entity_name} created successfully!")
end

run_import = fn entity_module, entity_name, import_module ->
  case Repo.exists?(entity_module) do
    true -> already_imported_logger.(entity_name)
    false -> import_logger.(entity_name, import_module)
  end
end

run_import.(InfractionsControl.Country, "Countries", ImportCountries)
run_import.(InfractionsControl.State, "States", ImportStates)
run_import.(InfractionsControl.City, "Cities", ImportCities)
run_import.(InfractionsControl.InfractionType, "Infraction Types", ImportInfractionTypes)
run_import.(InfractionsControl.FinancialBank, "Financial Banks", ImportFinancialBanks)
