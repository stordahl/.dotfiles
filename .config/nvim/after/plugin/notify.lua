local notify = require('notify')

notify.setup({
    stages = 'fade',
    timeout = 150,
    level = 'DEBUG',
    on_open = function(win) vim.api.nvim_win_set_config(win, { focusable = false }) end
})

