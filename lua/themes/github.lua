require('github-theme').setup({
  theme_style    = 'dark',
  comment_style  = 'italic',
  function_style = 'italic',
  sidebars = {'qf', 'terminal', 'packer'},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = 'orange', error = '#ff0000'},

  overrides = function()
    return {
      DiagnosticHint = {link = 'LspDiagnosticsDefaultHint'},
      Visual = {style = 'inverse'},
      Search = {style = 'inverse'},
    }
  end,
  dev = true,
})
