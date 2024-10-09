local opt = vim.opt_local

opt.spell = true
opt.wrap = true

local cmp = require "cmp"
local sources = cmp.get_config().sources

-- TODO: confirm these aren't aleady in the list of sources to avoid duplicate suggestions.
table.insert(sources, { name = "buffer" })
table.insert(sources, { name = "path" })

cmp.setup.buffer { sources = sources }
