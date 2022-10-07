return require('packer').startup(function()
  --  Packer
  use 'wbthomason/packer.nvim'

  -- Utilities

  use 'tpope/vim-commentary' -- comment utilities
  use 'tpope/vim-sleuth' -- detect ident
  use 'tpope/vim-repeat' -- add . support to multiple commands
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use 'mattn/emmet-vim' -- emmet support
  use 'mg979/vim-visual-multi' -- visual multi-select
  use 'lukas-reineke/indent-blankline.nvim' -- indent with blank line
  use 'andymass/vim-matchup' -- matcher for %

  -- pin Hop to follow the v2 major release; this will allow all releases of the form v2.*.*
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup {}
    end
  }

  -- UI
  use 'p00f/nvim-ts-rainbow'
  use 'lukas-reineke/indent-blankline.nvim'
  -- use { "anuvyklack/windows.nvim",
  --  requires = {
  --     "anuvyklack/middleclass",
  --     "anuvyklack/animation.nvim"
  --  },
  --  config = function()
  --     vim.o.winwidth = 10
  --     vim.o.winminwidth = 10
  --     vim.o.equalalways = false
  --     require('windows').setup()
  --  end
-- }

  -- Telescope
 
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-fzf-writer.nvim'

  -- Highlight

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-tree-docs'
  use {
    'NvChad/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }
  -- Language server
  use 'neovim/nvim-lspconfig'
  use { 'jose-elias-alvarez/null-ls.nvim', branch = 'main' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils', branch = 'main' }
  use 'williamboman/nvim-lsp-installer'
  use {
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup() end
  }
  -- Trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup { } end
  }
  -- Autocomplete
  use 'github/copilot.vim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- Formatting
  use 'mhartington/formatter.nvim'
  -- StatusLine
  use { 'nvim-lualine/lualine.nvim' }
  -- Git
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('neogit').setup() end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- colorschemes
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  -- File Tree
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the "open_window_picker" command
        's1n7ax/nvim-window-picker',
        tag = "1.*",
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal' },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    }
  }

end)
