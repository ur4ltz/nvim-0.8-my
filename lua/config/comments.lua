require('Comment').setup {
  pre_hook = nil,

  post_hook = nil,

  ignore = nil,
}

local comment_ft = require('Comment.ft')
comment_ft.set('lua', {'--%s', '--[[%s--]]'})

