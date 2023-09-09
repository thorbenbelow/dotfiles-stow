-- Fuzzy Finder (files, lsp, etc)
use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {'nvim-lua/plenary.nvim'}
}

-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
}

