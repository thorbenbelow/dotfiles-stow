local module = {}

function module.init()
  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  
  local map = vim.api.nvim_set_keymap
  local defaults = {noremap = true, silent = false}

  -- Save and exit
  map('i', 'jj', '<Esc>', defaults)
  map('n', '<leader>w', ':w<cr>', defaults)
  map('n', '<leader>q', 'ZZ', defaults)

  -- Move lines
  map('n', '<C-j>', ':m .+1<cr>==', defaults)
  map('n', '<C-k>', ':m .-2<cr>==', defaults)
  map('i', '<C-j>', '<Esc>:m .+1<cr>==gi', defaults)
  map('i', '<C-k>', '<Esc>:m .-2<cr>==gi', defaults)
  map('v', '<C-j>', ":m '>+1<cr>gv=gv", defaults)
  map('v', '<C-k>', ":m '<-2<cr>gv=gv", defaults)

  vim.keymap.set('n', '<leader>cd', vim.cmd.Ex)

  -- Telescope
  local telescope_builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
end

return module
