-- [[ Setting options ]]
-- See `:h vim.o`
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.colorcolumn = "100"
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- Cahe / Log file 
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.cache/nvim/undo")
vim.opt.backupdir = vim.fn.expand("$HOME/.cache/nvim/backup")
vim.opt.viewdir = vim.fn.expand("$HOME/.cache/nvim/view")

-- vim.o.signcolumn = 'yes'
-- vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
-- vim.o.sidescrolloff = 10
vim.o.confirm = true

vim.opt.termguicolors = true
vim.o.showmatch = true
vim.o.winborder = "rounded"
-- vim.opt.completeopt = "menuone,noinsert,noselect"
-- vim.opt.pumheight = 10
-- vim.opt.pumblend = 10



