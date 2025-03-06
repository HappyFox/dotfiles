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
        { "nvim-tree/nvim-web-devicons", opts = {} },
        {
          "folke/trouble.nvim",
          opts = {}, -- for default options, refer to the configuration section for custom setup.
          cmd = "Trouble",
          keys = {
            {
              "<leader>xx",
              "<cmd>Trouble diagnostics toggle<cr>",
              desc = "Diagnostics (Trouble)",
            },
            {
              "<leader>xX",
              "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
              desc = "Buffer Diagnostics (Trouble)",
            },
            {
              "<leader>cs",
              "<cmd>Trouble symbols toggle focus=false<cr>",
              desc = "Symbols (Trouble)",
            },
            {
              "<leader>cl",
              "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
              desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
              "<leader>xL",
              "<cmd>Trouble loclist toggle<cr>",
              desc = "Location List (Trouble)",
            },
            {
              "<leader>xQ",
              "<cmd>Trouble qflist toggle<cr>",
              desc = "Quickfix List (Trouble)",
            },
          },
        },
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
    {
            "nvimtools/none-ls.nvim",
            dependancies = {"mason-tool-installer.nvim"},
            config = function ()
                null_ls = require("null-ls")
                null_ls.setup({
                  sources = {
                    null_ls.builtins.diagnostics.pylint,
                    null_ls.builtins.diagnostics.mypy,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                  }
                })
             end

    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
                require("mason").setup()
        end,
    {
         "williamboman/mason-lspconfig.nvim",
         dependancies = { "mason.nvim", "nvim-lspconfig.nvim" }, 
         config = function()
                require("mason").setup()
                require("mason-lspconfig").setup()
                require("mason-lspconfig").setup_handlers {
			function (server_name)
			    require("lspconfig")[server_name].setup {}
			end,
	        }
        end,
        },
        automatic_installation=true,
        
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies= { "mason.nvim", "mason-lspconfig.nvim" },
        config = function()
                require("mason-tool-installer").setup {
                        ensure_installed={"mypy", "pylint", "black", "isort"},
                                }
        end,
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
    'wfxr/minimap.vim',
    'haystackandroid/rusticated', 
    'sainnhe/edge',
    { "catppuccin/nvim", name = "latte", priority = 1000 },   
    {"mcchrish/zenbones.nvim", dependencies = {"rktjmp/lush.nvim",}},
    {
        "yorik1984/newpaper.nvim",
        priority = 1000,
        config = true,
    },    
    'sainnhe/everforest',
})


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1

font_size = 11
font = "FantasqueSansM Nerd Font Mono:h%s"


function to_font_str()
        return string.format(font, font_size)
end

function inc_font()
        font_size = font_size + 1 
        vim.o.guifont = to_font_str()
end

function dec_font()
        font_size = font_size - 1 
        vim.o.guifont = to_font_str()
end

vim.o.guifont = to_font_str()


vim.keymap.set('n', '<C-=>', inc_font, {})
vim.keymap.set('n', '<C-->', dec_font, {})

vim.keymap.set('n', '<leader>m', function ()
vim.cmd("cd %:p:h")
end, {})

require("toggleterm").setup{
        open_mapping = [[<c-\>]],
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end


-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


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
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})



vim.keymap.set('n', '<leader>d', function()
    vim.opt.bg = 'dark'
end, {})
vim.keymap.set('n', '<leader>l', function()
    vim.opt.bg = 'light'
end, {})


vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format {async=false}]]

local builtin = require('telescope.builtin')

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
vim.wo.relativenumber = true


vim.cmd[[colorscheme tokyonight]]
