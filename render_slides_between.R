# params 

base_run   <- "CCAR 2019"
comp_run   <- "CCAR 2020"
base_scens <- c("B1", "B2", "B3")
comp_scens <- c("B1", "B2", "B3")

# DO NOT CHANGE BELOW -----------------------------------------------------

source(here::here("shared", "code", "libs.R"))

# render function
render_slides_between <- function(base_scenario, comp_scenario){
  
  rmarkdown::render(here::here("macro_var_comp_slides", "template_between.Rmd"), 
                    output_file = tolower(paste0(gsub(" ", "_", base_run), "_", base_scenario,
                                                 "_vs_", 
                                                 gsub(" ", "_", comp_run), "_", comp_scenario,
                                                 ".html")),
                    output_format = "ioslides_presentation",
                    output_dir = here::here("macro_var_comp_slides", "docs_between"),
                    params = list(
                      base_run = base_run,
                      comp_run = comp_run,
                      base_scen = base_scenario,
                      comp_scen = comp_scenario
                    ))
}


# render all
purrr::walk2(base_scens, comp_scens, render_slides_between)

# done
beepr::beep("mario")