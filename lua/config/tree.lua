vim.g.nvim_tree_icons = {
  default      = "",
  symlink      = "",
  git= {
    unstaged   = "",
    staged     = "✓",
    unmerged   = "",
    renamed    = "➜",
    deleted    = "✗",
    untracked  = "★",
    ignored    = "◌",
  },
  folder = {
    default    = "",
    open       = "",
    empty      = "",
    empty_open = "",
    symlink    = "",
  },
}

require('nvim-tree').setup{
  diagnostics = {
    enable = true,
    icons = {
      hint       = "",
      info       = "",
      warning    = "",
      error      = "",
    },
  },
  view = {
    width = 65,
    side = 'left',
  },
}
-- vim: ts=2 sw=2 et:
