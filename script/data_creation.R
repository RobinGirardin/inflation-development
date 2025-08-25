print("Loading libraries...")

library("WDI") # Word Bank Data API library
library("readr")

# Indicators of the 'main' dataset, focused on economical factors
indicators_main <- c(
  FP.CPI.TOTL.ZG = "inflation_pct", # Inflation, consumer prices (annual %)
  GC.DOD.TOTL.GD.ZS = "debt_gdp_pct", # General government gross debt (% of GDP)
  NY.GDP.MKTP.KD.ZG = "gdp_growth_pct", # GDP growth (annual %)
  NY.GDP.MKTP.CD = "gdp_usd", # GDP in USD
  SL.UEM.TOTL.ZS = "unemployment_pct", # Unemployment, total (% of labor force)
  NE.EXP.GNFS.ZS = "exports_gdp_pct", # Exports of goods and services (% of GDP)
  NE.IMP.GNFS.ZS = "imports_gdp_pct", # Imports of goods and services (% of GDP)
  SP.POP.TOTL = "population_total" , # Population, total
  FM.LBL.BMNY.GD.ZS = "broad_money_pct",
  FI.RES.TOTL.CD = "total_reserve_usd",
  NY.GNP.MKTP.PP.CD = "gni_usd", # GNI per capita (current US$)
  PA.NUS.PPP = "altas_conversation_factor" # Altas Conversation Factor
)
 
# indicators for the complementary dataset, focused on education and tertiary informations
indicators_comp <- c(
  SP.URB.TOTL.IN.ZS = "urban_pop_pct",       # Urban population (% of total)
  SP.DYN.LE00.IN    = "life_expectancy",     # Life expectancy at birth, total (years)
  SE.PRM.NENR       = "net_enrol_primary",   # School enrollment, primary (% net)
  SE.SEC.NENR       = "net_enrol_secondary", # School enrollment, secondary (% net)
  SE.TER.ENRR       = "enrol_tertiary_gross",# School enrollment, tertiary (% gross)
  SP.DYN.TFRT.IN    = "fertility_rate",      # Fertility rate, total (births per woman)
  SP.POP.GROW       = "pop_growth_pct"       # Population growth (annual %)
)

print("Extracting data from WorldBank API using wdi::WDI() function. Please wait.")
# Load MAIN dataset
main <- WDI(
  country = "all",
  indicator = names(indicators_main),
  start = 2000,
  end = 2024,
)
print("Data extracted")
# Write file in RDS format if he doesn't exist
if (!file.exists("data/raw/main.rds")) {
  print("Path `data/raw/main.rds` don't exist, file will be created in `data/raw/`.")
  write_rds(main, "data/raw/main.rds")

}

print("Extracting data from WorldBank API using wdi::WDI() function. Please wait.")
# Load COMPLEMENTARY dataset
comp <- WDI(
  country = "all",
  indicator = names(indicators_main),
  start = 2000,
  end = 2024,
)
# Write file in RDS format if he doesn't exist
if (!file.exists("data/raw/comp.rds")) {
  print("Path `data/raw/comp.rds` don't exist, file will be created in `data/raw/`.")
  write_rds(comp, "data/raw/comp.rds")
}
