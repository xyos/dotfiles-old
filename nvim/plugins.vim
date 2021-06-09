call plug#begin('~/.local/shared/nvim/plugged')

  Plug 'junegunn/vim-easy-align' " Provides :Align <key>
  Plug 'godlygeek/tabular' " Align text
  Plug 'plasticboy/vim-markdown' " Markdown stuff
  Plug 'rhysd/clever-f.vim' " f made easier
  Plug 'mbbill/undotree' " Vim undo tree

  Plug 'Raimondi/delimitMate'
  " Tmux
  Plug 'christoomey/vim-tmux-navigator'
  " Git
  Plug 'tpope/vim-fugitive' " Git wrapper
  Plug 'junegunn/gv.vim' " Git commit browser
  Plug 'sodapopcan/vim-twiggy' " Git branch browser

  Plug 'sheerun/vim-polyglot' " syntax all things

  Plug 'tpope/vim-commentary' " press gcc for commentaries
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'

  Plug 'roxma/vim-tmux-clipboard'
  " Formating 
  " JavaScript & Web
  Plug 'mattn/emmet-vim'
  " Elixir
  Plug 'elixir-lang/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  Plug 'myusuf3/numbers.vim'
  " Colors / UI
  Plug 'shaunsingh/nord.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  Plug 'KeitaNakamura/neodark.vim'
  Plug 'dracula/vim'
  " gui
  Plug 'equalsraf/neovim-gui-shim'
  " snippets
  " Neovim
  Plug 'hrsh7th/nvim-compe'
  Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-writer.nvim'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  " Language Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'folke/tokyonight.nvim'
  " Format
  Plug 'mhartington/formatter.nvim'
call plug#end()


filetype plugin indent on
syntax enable


colorscheme tokyonight


" vim-markdown
let g:vim_markdown_folding_style_pythonic = 1
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,

      -- Disabled by default.
      -- Will probably slow down some aspects of the sorter, but can make color highlights.
      -- I will work on this more later.
      use_highlighter = false,
  }
  }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf_writer')
require('bufferline').setup{}
require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    tabnine = true;
  };
}
require('gitsigns').setup()

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()
  -- ... and add manually installed servers
  table.insert(servers, "clangd")
  table.insert(servers, "sourcekit")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end
    if server == "sourcekit" then
      config.filetypes = {"swift", "objective-c", "objective-cpp"}; -- we don't want c and cpp!
    end
    if server == "clangd" then
      config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
    end

    if server == "angular" then
      config.filetypes = {}; -- we don't want objective-c and objective-cpp!
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

local lspconfig = require"lspconfig"



require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    typescript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
  }
})

local cmd = {"ngserver", "--stdio", "--tsProbeLocations", "/Users/xyos/.local/share/nvim/lspinstall/angular/node_modules" , "--ngProbeLocations", "/Users/xyos/.local/share/nvim/lspinstall/angular/node_modules" }

require'lspconfig'.angularls.setup{
  cmd = cmd,
  on_new_config = function(new_config,new_root_dir)
    new_config.cmd = cmd
  end,
}

EOF
