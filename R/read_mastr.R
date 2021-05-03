#' read_mastr
#'
#' @param csv_file defaut: system.file("extdata/stromerzeuger_pv_berlin.csv",
#' package = "mastr")
#' @return imported mastr data
#' @export
#' @importFrom readr read_delim locale cols col_integer col_date
#' @importFrom janitor clean_names
#' @importFrom dplyr mutate
#' @importFrom rlang .data
#' @importFrom lubridate year
read_mastr <- function(csv_file = system.file("extdata/stromerzeuger_pv_berlin.csv",
                                              package = "mastr")) {
  stromerzeuger_pv_berlin <- readr::read_delim(csv_file,
                                               ";", escape_double = FALSE,
                                               col_types = readr::cols(`Inbetriebnahmedatum der Einheit` = readr::col_date(format = "%d.%m.%Y"),
                                                                      `Registrierungsdatum der Einheit` = readr::col_date(format = "%d.%m.%Y"),
                                                                       Postleitzahl = readr::col_integer(),
                                                                      `Letzte Aktualisierung` = readr::col_date(format = "%d.%m.%Y")),
                                               locale = readr::locale(date_names = "de", grouping_mark = "."),
                                               trim_ws = TRUE) %>%
    janitor::clean_names() %>%
    dplyr::mutate(year = lubridate::year(.data$inbetriebnahmedatum_der_einheit))
}
