library(readr)
library(dplyr)
stromerzeuger_pv_berlin <- read_delim("stromerzeuger_pv_berlin.csv", 
                                      ";", escape_double = FALSE, col_types = cols(`Inbetriebnahmedatum der Einheit` = col_date(format = "%d.%m.%Y"), 
                                                                                   `Registrierungsdatum der Einheit` = col_date(format = "%d.%m.%Y"), 
                                                                                   Postleitzahl = col_integer(), `Letzte Aktualisierung` = col_date(format = "%d.%m.%Y")), 
                                      locale = locale(date_names = "de", grouping_mark = "."), 
                                      trim_ws = TRUE) %>% 
  janitor::clean_names() %>% 
  dplyr::mutate(year = lubridate::year(inbetriebnahmedatum_der_einheit))


stromerzeuger_pv_berlin %>% 
  dplyr::count(year) %>% 
  ggplot2::ggplot(ggplot2::aes(x = year, y = n)) + 
  ggplot2::geom_line()


stromerzeuger_pv_berlin %>% 
  dplyr::arrange(bruttoleistung_der_einheit) %>% 
  ggplot2::ggplot(ggplot2::aes(x = year, y = n)) + 
  ggplot2::geom_line()

probs <- seq(0,1,0.005)
quantile(stromerzeuger_pv_berlin$bruttoleistung_der_einheit,probs = probs)
