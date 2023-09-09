local module = {}

function module.init(is_bootstrap)
    return function(use)
        -- Package manager
        use 'wbthomason/packer.nvim'

        pcall(require, "plug.lsp")
        pcall(require, "plug.treesitter")
        pcall(require, "plug.which-key")

        -- Git related plugins
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'lewis6991/gitsigns.nvim'

        use 'navarasu/onedark.nvim' -- Theme inspired by Atom
        use 'nvim-lualine/lualine.nvim' -- Fancier statusline
        use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
        use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
        use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

        pcall(require, 'plug.fzf')
        pcall(require, 'plug.autopairs')

        pcall(require, 'plug.lsp')

        -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
        local has_plugins, plugins = pcall(require, 'custom.plugins')
        if has_plugins then
            plugins(use)
        end

        if is_bootstrap then
            require('packer').sync()
        end
    end
end

return module
