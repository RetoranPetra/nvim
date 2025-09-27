require("defaults")
require("preferences")
--require("retoran.core.keymaps")
require("fileTypeOverride")

-- Plugin folder MUST be called plugins, can't have unique name.
require("lz.n").load("plugins")
require("lzn-auto-require").enable()
