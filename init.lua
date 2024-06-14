---------------------------------------------------------------------------------
--  _   _             _    _____ _ ____ ____  
-- | \ | | ___   __ _| |__|___  / | ___| ___| 
-- |  \| |/ _ \ / _` | '_ \  / /| |___ \___ \ 
-- | |\  | (_) | (_| | | | |/ / | |___) |__) |
-- |_| \_|\___/ \__,_|_| |_/_/  |_|____/____/ 
--
---------------------------------------------------------------------------------
--
-- https://www.youtube.com/channel/UCqGyzqfltwGBneZOUEz7ayg
--
---------------------------------------------------------------------------------
--
-- https://github.com/Noah7155
--
---------------------------------------------------------------------------------

-- PLUGINS --

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'Noah7155/cadmium.nvim'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'

  use 'itchyny/lightline.vim'
  use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })

  use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v3.x',
  	requires = {
  	  {'williamboman/mason.nvim'},
  	  {'williamboman/mason-lspconfig.nvim'},
  	  {'neovim/nvim-lspconfig'},
  	  {'hrsh7th/nvim-cmp'},
  	  {'hrsh7th/cmp-nvim-lsp'},
  	  {'L3MON4D3/LuaSnip'},
  	}
}
end)

-- OPTIONS --

vim.wo.relativenumber = true
vim.g.lightline = {
	colorscheme = 'wombat'
}

-- KEYBINDS --

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- HIGHLIGHTING --

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "python", "javascript" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}

-- LSP --

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.default_keymaps({})
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

require('lspconfig').rust_analyzer.setup({})
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<TAB>'] = cmp.mapping.confirm({select = false}),
    ['<C-q>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

vim.cmd [[colorscheme cadmium]]
