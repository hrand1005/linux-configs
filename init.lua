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
        -- add your plugins here
        {"rose-pine/neovim", name = "rose-pine"}, {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = {"nvim-lua/plenary.nvim"}
        }
    },
    install = {colorscheme = {"habamax"}},
    checker = {enabled = false}
})

vim.cmd.colorscheme("rose-pine")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files,
               {desc = "Telescope find files"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep,
               {desc = "Telescope live grep"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "Telescope buffers"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags,
               {desc = "Telescope help tags"})
vim.keymap
    .set("n", "<S-h>", ":tabprevious<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<S-l>", ":tabnext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Leader>c", ":bd<CR>", {noremap = true, silent = true})

local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {["<CR>"] = actions.select_tab},
            n = {["<CR>"] = actions.select_tab}
        }
    }
}

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
