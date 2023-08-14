-- [[ Setting options ]]
-- See `:help vim.o`

local module = {}

function module.init()
  -- Make line numbers default
  vim.wo.number = true

  -- Enable mouse mode
  vim.o.mouse = 'a'

  -- Save undo history
  vim.o.undofile = true

  -- Case insensitive searching UNLESS /C or capital in search
  vim.o.ignorecase = true
  vim.o.smartcase = true

  -- Set colorscheme
  vim.o.termguicolors = true
  vim.cmd [[colorscheme onedark]]

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = 'menuone,noselect'
end

return module
