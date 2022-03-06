vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- fuzzy file search/in files search
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- project view
	use 'kyazdani42/nvim-tree.lua'
	-- lsp
	use 'neovim/nvim-lspconfig'
	-- TODO:autocomplete
	use 'hrsh7th/nvim-cmp'
	-- show tabs/spaces
	use 'lukas-reineke/indent-blankline.nvim'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'tpope/vim-fugitive'
	-- themes
	use 'shaunsingh/nord.nvim'
    use 'Mofiqul/vscode.nvim'
	use 'itchyny/lightline.vim'
    -- manaul intervention needed : goto module directory and run `yarn install`
    use { 'iamcco/markdown-preview.nvim' }
end)

-- default options
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3
vim.g.vscode_style = "dark"
vim.g.nord_borders = true
vim.g.mapleader = " "

vim.cmd('colorscheme vscode')
vim.cmd('let g:lightline = {"colorscheme": "wombat"}')
vim.cmd('filetype plugin on')
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])
vim.cmd('set title')

vim.o.clipboard = "unnamedplus"

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

---- kyazdani42/nvim-tree.lua
require('nvim-tree').setup({
  update_focused_file = { enable = true },
  view = {
    width = 35
  }
})

--- indent
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}


-- folder, file and search in files
map('n', '\\', ':NvimTreeToggle<CR>', {silent=true})
map('n', 'ff', ':Telescope find_files<CR>')
map('n', 'fg', ':Telescope live_grep<CR>') -- need ripgrep system package

-- lsp
require'lspconfig'.r_language_server.setup{autostart = false} -- R langauge specific : need languageserver R package
map('n', 'lD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'ld', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'lli', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'lh', ':lua vim.lsp.buf.hover()<CR>')
map('n', 'lR', ':lua vim.lsp.buf.rename()<CR>')
map('n', 'le', ':LspStop<CR>')
map('n', 'ls', ':LspStart<CR>')
map('n', 'li', ':LspInfo<CR>')

--styler
map('n', '<leader>i', ':!Rscript -e "styler::style_file(\'%:p\')"<CR>') -- R langauge specific : neeed styler R packager

-- git
require('gitsigns').setup()
map('n', '<leader>gb', ':Telescope git_branches<CR>')
map('n', '<leader>gd', ':Gdiffsplit<CR>')

-- tabs navigation helper
map('n', '<S>', ":tabedit<CR>")
