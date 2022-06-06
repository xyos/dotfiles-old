--- vim:sw=2 fdm=marker

local api, fn, cmd, opt, u, v = vim.api, vim.fn, vim.cmd, vim.o, vim.uri, vim.v

local map = require("utils").map
require("plugins")
require("plugins-config")

--- {{{ [[ OPTIONS ]]

cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

opt.termguicolors = true
vim.cmd[[colorscheme catppuccin]]

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.opt.listchars = {
  eol = '¬',
  space = ' ',
  nbsp = '␣',
  trail = '·',
  tab = '→ ',
  extends = '›',
  precedes = '‹',
}
vim.opt.shell = '/bin/bash'
vim.opt.showbreak = '↪'
opt.list = true

vim.wo.linebreak = true
vim.wo.breakindent = true

opt.showmode = false
opt.expandtab = true; vim.bo.expandtab = true
opt.shiftwidth = 2; vim.bo.shiftwidth = 2
opt.tabstop = 2; vim.bo.tabstop = 2

opt.inccommand = 'nosplit'

opt.splitright = true
opt.splitbelow = true

opt.mouse = 'a'

opt.laststatus = 3 -- only one status line

--- }}}
--- {{{ [[ MAPPINGS ]]

local silent = { noremap = true, silent = true }
-- Space as leader
map("", "<Space>", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Esc on jj
map("i", "jj", "<Esc>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<A-Up>", ":resize -2<CR>", silent)
map("n", "<A-Down>", ":resize +2<CR>", silent)
map("n", "<A-Left>", ":vertical resize -2<CR>", silent)
map("n", "<A-Right>", ":vertical resize +2<CR>", silent)

-- Disable arrow keys in normal mode
map("n", "<up>", "<NOP>", silent)
map("n", "<down>", "<NOP>", silent)
map("n", "<left>", "<NOP>", silent)
map("n", "<right>", "<NOP>", silent)

-- Yank to clipboard

map("n", "<Leader>y", "\"*y")
map("v", "<Leader>y", "\"*y")

-- Move text up and down
map("n", "<C-k>", "<Esc>:m .-2<CR>==")
map("n", "<C-j>", "<Esc>:m .+1<CR>==")

-- NVimTree
map("n", "<Leader>n", ":Neotree toggle<cr>")

-- Telescope

map("n", "<leader>f", ":Telescope find_files<cr>")
map("n", "<leader>g", ":Telescope live_grep<cr>")
map("n", "<leader>b", ":Telescope buffers<cr>")
map("n", "<leader>h", ":Telescope help_tags<cr>")

map("n", "<leader>xx", ":Trouble<cr>", silent)
map("n", "<leader>xw", ":Trouble workspace_diagnostics<cr>", silent)
map("n", "<leader>xd", ":Trouble document_diagnostics<cr>", silent)
map("n", "<leader>xl", ":Trouble loclist<cr>", silent)
map("n", "<leader>xq", ":Trouble quickfix<cr>", silent)
map("n", "gR", ":Trouble lsp_references<cr>", silent)

-- }}}
