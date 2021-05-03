#' read_mastr
#'
#' @param csv_file defaut: system.file("inst/extdata/stromerzeuger_pv_berlin",
package = "mastr")
#'
#' @return imported mastr data
#' @export
#' @importFrom readr read_delim locale
#' @importFrom janitor clean_names
#' @importFrom dplyr mutate
read_mastr <- function(csv_file = system.file("inst/extdata/stromerzeuger_pv_berlin",
                                              package = "mastr")) {
  stromerzeuger_pv_berlin <- readr::read_delim(csv_file,
                                               ";", escape_double = FALSE, col_types = cols(`Inbetriebnahmedatum der Einheit` = col_date(format = "%d.%m.%Y"),
                                                                                            `Registrierungsdatum der Einheit` = col_date(format = "%d.%m.%Y"),
                                                                                            Postleitzahl = col_integer(), `Letzte Aktualisierung` = col_date(format = "%d.%m.%Y")),
                                               locale = readr::locale(date_names = "de", grouping_mark = "."),
                                               trim_ws = TRUE) %>%
    janitor::clean_names() %>%
    dplyr::mutate(year = lubridate::year("inbetriebnahmedatum_der_einheit"))
}
