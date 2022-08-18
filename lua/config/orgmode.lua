-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require('orgmode').setup {
  org_agenda_file = {'~/org/**/*'},
  org_default_notes_file = '~/org/refile.org',
  mappings = {
    global = {
      org_agenda = {'gA', '<Leader>oa'},
      org_capture = {'gC', '<Leader>oc'},
    },
  },
}
