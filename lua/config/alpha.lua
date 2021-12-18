local alpha = require('alpha')
local startify = require('alpha.themes.startify')

startify.nvim_web_devicons.enabled = true
startify.opts.opts.noautocmd = true

-- startify.section.header.val = {
-- }

alpha.setup(startify.opts)

