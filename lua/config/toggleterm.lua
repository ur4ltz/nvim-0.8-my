-- vim: ts=2 sw=2 et:

require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  shade_filetypes = {'none'},
  direction = 'vertical',
  start_in_insert = true,
  float_opts = {border = 'curved', winblend = 3},
  size = function(term)
    if term.direction == 'horizontal' then
      return 20
    elseif term.direction == 'vertical' then
      return math.floor(vim.o.columns * 0.40)
    end
  end,
}
