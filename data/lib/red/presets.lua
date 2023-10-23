return {
  {"%.[cChH]$", { ts = 8, spaces_tab = false, trim_spaces = true, syntax = "c" } },
  {"%.cpp$", { ts = 8, spaces_tab = false, trim_spaces = true, syntax = "c" } },
  {"%.lua$", { ts = 2, spaces_tab = true, trim_spaces = true, syntax = "lua" } },
  {"%.go$", { ts = 8, spaces_tab = false, trim_spaces = true } },
  {"%.py$", { ts = 4, spaces_tab = true, trim_spaces = true } },
  {"%.md$", { ts = 2, spaces_tab = true, trim_spaces = true, syntax = "markdown" } },
  {"%.diff$", { ts = 8, spaces_tab = false, trim_spaces = false, syntax = "diff" } },
}
