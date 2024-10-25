example <- readLines(here::here("example.md"))

file_name <- grep("###", example, value = TRUE) |>
  stringr::str_remove_all("### | ") |>
  tolower()

flatten <- stringr:::str_flatten(example, collapse = " ")

section <- stringr::str_extract_all(flatten, "(?<=### ).*?(?=###|$)")[[1]]

clean <- stringr::str_replace_all(section, ".*?(\\*\\*Alt text\\*\\*:\\s*)", "\\1")

cleaned_sections <- stringr::str_replace_all(clean, "(\\*\\*Caption\\*\\*:\\s*)", "\n\\1")

for (i in 1:length(cleaned_sections)) {
  name <- paste0("pages/", file_name[i], ".md")

  writeLines(cleaned_sections[i], name)
}
