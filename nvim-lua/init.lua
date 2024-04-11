local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {"lua", "vim", "vimdoc", "python"},
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
          })
      end
    },
    "nvimtools/none-ls.nvim",
    "neovim/nvim-lspconfig",
    { 
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
            "stevearc/resession.nvim"       -- Optional, for persistent history
        },
        config = true,
    },

    {
        'lewis6991/gitsigns.nvim', 
        config=true,
    },
    {
        'sindrets/diffview.nvim',
        config=true,
    },
    {
        "NeogitOrg/neogit",
         dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
         },
         config = true
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},


    --'dense-analysis/ale'
    --'vim-airline/vim-airline'
    --'vim-airline/vim-airline-themes'
    'iCyMind/NeoSolarized',
    'folke/tokyonight.nvim',
    'gerardbm/vim-atomic',
})

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
--        pylint = {
--            enabled = true,
--          --executable="pylint", 
--            args = {' -j 8 --init-hook="import sys, threading; threading.stack_size(67108864);  sys.setrecursionlimit(10000)"'},
--        },
--        black = {
--            enabled = true,
--        },
        ruff = {
            enabled=true,
            extendSelect={"ALL"},
            format={"ALL"},
            formatEnabled=true,
        },
        mypy = {
            enabled=true,
        },
      }
    }
  }
}

--require('lspconfig').ruff_lsp.setup {
--  init_options = {
--    settings = {
--      -- Any extra CLI arguments for `ruff` go here.
--      args = {
--        "--select", "PL",
--        "--select", "C90",
--        "--select", "I",
--        "--select", "N",
--        "--select", "U",
--        "--select", "D",
--        "--select", "UP",
--        "--select", "ERA",
--        "--select", "RUF",
--        "--select", "ANN",
--        "--select", "ASYNC",
--        "--select", "BLE",
--        "--select", "B",
--        "--select", "A",
--        "--select", "COM",
--        "--select", "C4",
--        "--select", "PIE",
--        "--select", "PYI",
--        "--select", "Q",
--        "--select", "RSE",
--        "--select", "RET",
--        "--select", "SLF",
--        "--select", "SLOT",
--        "--select", "SIM",
--        "--select", "INT",
--        "--select", "ARG",
--        "--select", "PTH",
--        "--select", "TD",
--        "--select", "FIX",
--        
--      },
--    }
--  }
--}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local builtin = require('telescope.builtin')

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format {async=true}]]

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n','<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>s', vim.cmd.lopen, {}) 
vim.keymap.set('n', '<leader>S', vim.cmd.lclose, {}) 

vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "<C-d>", "<C-d>zz");

vim.o.scrolloff = 8;



-- Global options
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.syntax = 'on'
vim.o.ruler = true
vim.o.hidden = true
vim.o.fcs = 'eob: '
vim.o.laststatus = 2
vim.o.showtabline = 0
vim.o.smarttab = true
vim.o.undofile = true
vim.o.hlsearch = true
vim.o.updatetime = 250
vim.o.expandtab = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.breakindent = true
vim.o.termguicolors = true
vim.o.guifont = "FantasqueSansM Nerd Font Mono:h11"

-- Buffer options
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.bo.autoindent = true

-- Window options
vim.wo.wrap = false
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.signcolumn = 'yes'
--vim.wo.relativenumber = true


vim.cmd[[colorscheme tokyonight-night]]
