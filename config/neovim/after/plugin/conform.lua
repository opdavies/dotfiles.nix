local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    rst = { "rstfmt" },
  },
}

conform.formatters.rstfmt = {
  command = "rstfmt";
}
