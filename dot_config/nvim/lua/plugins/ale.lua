-- Ale"s default floating window is ugly

vim.g.ale_hover_to_floating_preview = 1


vim.g.ale_completion_enabled         = 1
vim.g.ale_completion_delay           = 300
vim.g.ale_completion_max_suggestions = 50

-- linting
vim.g.ale_lint_on_save               = 1
vim.g.ale_lint_on_text_changed       = 'always'
vim.g.ale_lint_delay                 = 900

-- fixing
vim.g.ale_fix_on_save                = 1

-- messages
vim.g.ale_echo_msg_error_str         = 'E'
vim.g.ale_echo_msg_warning_str       = 'W'
vim.g.ale_echo_msg_info_str          = 'I'
vim.g.ale_echo_msg_format            = '[%severity%:%code%](%linter%): %s'
vim.g.ale_set_highlights             = 1
vim.g.ale_virtualtext_cursor         = 0
vim.g.ale_virtualtext_delay          = 1

-- symbols
vim.g.ale_sign_error                 = '×'
vim.g.ale_sign_warning               = '▸'

-- hover
vim.g.ale_hover_cursor               = 1
vim.g.ale_hover_to_preview           = 1
vim.g.ale_set_balloons               = 0
vim.g.ale_hover_to_floating_preview  = 1
vim.g.ale_detail_to_floating_preview = 1
vim.g.ale_floating_preview           = 1
vim.g.ale_floating_window_border     = {"│", "─", "╭", "╮", "╯", "╰", "│", "─"}
