pkg <- list(
  name = "mastr",
  title = "R Package for Visualising Data from Marktstammdatenregister (for Berlin)",
  desc = paste(
    "R Package for Visualising Data from Marktstammdatenregister (for Berlin)."
  )
)

kwb.pkgbuild::use_pkg_skeleton("mastr")

kwb.pkgbuild::use_pkg(
  pkg = pkg,
  copyright_holder = list(name = "Michael Rustler", start_year = NULL),
  user = "mrustl"
)

kwb.pkgbuild::create_empty_branch_ghpages("mastr")
