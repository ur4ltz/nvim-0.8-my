require('luapad').setup{
  count_limit = 150000,
  error_indicator = true,
  eval_on_move = true,
  error_highlight = 'WarningMsg',
  context = {
    the_answer = 42,
    shout = function(str) return(string.upper(str) .. '!') end
  },
}

-- vim: ts=2 sw=2 et:
