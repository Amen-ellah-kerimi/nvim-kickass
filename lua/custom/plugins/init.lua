-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'morhetz/gruvbox',
    lazy = false, -- load immediately
  },
  -- Syntax Highlighting for Prisma
  {
    'prisma/vim-prisma',
    ft = { 'prisma' }, -- lazy load only for prisma files
  },
  {
    'github/copilot.vim',
    config = function()
      -- optional: disable Copilot on some filetypes
      vim.g.copilot_filetypes = {
        ['*'] = true,
        markdown = false,
      }

      -- optional: keymaps for Copilot
      vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-K>', 'copilot#Next()', { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Previous()', { expr = true, silent = true })
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        keywords = {
          FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
          TODO = { icon = ' ', color = 'info' },
          HACK = { icon = ' ', color = 'warning' },
          WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
          PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
          NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        },
      }
      -- Telescope extension
      pcall(require('telescope').load_extension, 'todo-comments')
      -- Keymaps
      vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>', { desc = '[S]earch [T]ODOs' })
    end,
  },
}
