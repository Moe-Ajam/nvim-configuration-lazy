return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Main Synced Vault',
        path = '/Users/mahmoudajam/Documents',
      },
    },
    -- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
    -- 'workspaces'. For example:
    -- dir = "~/vaults/work",

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    -- notes_subdir = '00 - Inbox',

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
    },

    -- Optional, for templates (see below).
    -- templates = {
    --   folder = 'templates',
    --   date_format = '%Y-%m-%d',
    --   time_format = '%H:%M:%S',
    -- },

    ui = {
      -- Disable some things below here because I set these manually for all Markdown files using treesitter
      checkboxes = {},
      bullets = {},
    },
  },
  disable_formatter = true,
  config = function()
    vim.opt.conceallevel = 1
  end,
}
