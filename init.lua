vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.splitright = true

vim.opt.filetype.indent = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.scrolloff = 10

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.history=1000

vim.opt.updatetime = 50


vim.keymap.set("n", "<C-h>", "<C-w>h", {noremap = true, silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {noremap = true, silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {noremap = true, silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {noremap = true, silent = true})

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>",
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>",
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>",
               {noremap = true, silent = true})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo,
        lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
            {"\nPress any key to exit..."}
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "ellisonleao/gruvbox.nvim", name = "gruvbox" },
        { "folke/tokyonight.nvim", name = "tokyonight" },
        { "catppuccin/nvim", name = "catppuccin" },
        { "rose-pine/neovim", name = "rose-pine"},
        { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon" },
        { "bluz71/vim-moonfly-colors", name = "moonfly" },
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = {"nvim-lua/plenary.nvim"}
        },
        {
            -- cscope -> used for linux kernel
          "dhananjaylatkar/cscope_maps.nvim",
          dependencies = {
            "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
            "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
            "echasnovski/mini.pick", -- optional [for picker="mini-pick"]
            "folke/snacks.nvim", -- optional [for picker="snacks"]
          },
          opts = {
            -- USE EMPTY FOR DEFAULT OPTIONS
            -- DEFAULTS ARE LISTED BELOW
          },
        },
        -- LSP SUPPORT #1, plus rust specific support
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
            },
        }
    },
    install = {colorscheme = {"habamax"}},
    checker = {enabled = false}
})

vim.cmd.colorscheme("moonfly")
-- vim.cmd.colorscheme("vim")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files,
               {desc = "Telescope find files"})
vim.keymap.set("n", "<leader>fw", builtin.live_grep,
               {desc = "Telescope live grep"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "Telescope buffers"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags,
               {desc = "Telescope help tags"})
vim.keymap
    .set("n", "<S-h>", ":tabprevious<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<S-l>", ":tabnext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Leader>c", ":bd<CR>", {noremap = true, silent = true})

-- local actions = require("telescope.actions")
-- require("telescope").setup {
--     defaults = {
--         mappings = {
--             i = {["<CR>"] = actions.select_tab},
--             n = {["<CR>"] = actions.select_tab}
--         }
--     }
-- }

-- Don't use this for now
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>sg", ":Cs f g ", { desc = "Cscope: Find global symbol" })

-- LSP SUPPORT #2
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer" },
})

-- RUST SPECIFIC LSP SUPPORT #2
-- In your lazy.nvim setup, only install nvim-lspconfig and mason plugins
--
-- require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer" },
})

-- Rust LSP setup with correct on_attach keymaps:
vim.lsp.config["rust-analyzer"] = {
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap=true, silent=true })
  end,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = true,
      diagnostics = {
        disabled = { "unlinked-file" },
      },
    },
  },
}

-- Terminal Shortcuts
vim.keymap.set("n", "<leader>th", ":split | terminal<CR>", { noremap = true, silent = true, desc = "Open terminal horizontal split"});
vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<CR>", { noremap = true, silent = true, desc = "Open terminal vertical split"});
vim.keymap.set("n", "<leader>tt", ":tabnew | terminal<CR>", { noremap = true, silent = true, desc = "Open terminal in new tab"});
-- Escape from terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode"});
-- Navigate in/out of terminal
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", {noremap = true, silent = true})
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", {noremap = true, silent = true})
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", {noremap = true, silent = true})
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", {noremap = true, silent = true})
