-- -- Set lualine as statusline
-- return {
--   'nvim-lualine/lualine.nvim',
--   config = function()
--     -- Adapted from: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/onedark.lua
--     local colors = {
--       blue = '#61afef',
--       green = '#98c379',
--       purple = '#c678dd',
--       cyan = '#56b6c2',
--       red1 = '#e06c75',
--       red2 = '#be5046',
--       yellow = '#e5c07b',
--       fg = '#abb2bf',
--       bg = '#282c34',
--       gray1 = '#828997',
--       gray2 = '#2c323c',
--       gray3 = '#3e4452',
--     }
--
--     local onedark_theme = {
--       normal = {
--         a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
--         b = { fg = colors.fg, bg = colors.gray3 },
--         c = { fg = colors.fg, bg = colors.gray2 },
--       },
--       command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
--       insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
--       visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
--       terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
--       replace = { a = { fg = colors.bg, bg = colors.red1, gui = 'bold' } },
--       inactive = {
--         a = { fg = colors.gray1, bg = colors.bg, gui = 'bold' },
--         b = { fg = colors.gray1, bg = colors.bg },
--         c = { fg = colors.gray1, bg = colors.gray2 },
--       },
--     }
--
--     -- Import color theme based on environment variable NVIM_THEME
--     local env_var_nvim_theme = os.getenv 'NVIM_THEME' or 'nord'
--
--     -- Define a table of themes
--     local themes = {
--       onedark = onedark_theme,
--       nord = 'nord',
--     }
--
--     local mode = {
--       'mode',
--       fmt = function(str)
--         -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
--         return ' ' .. str
--       end,
--     }
--
--     local filename = {
--       'filename',
--       file_status = true, -- displays file status (readonly status, modified status)
--       path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
--     }
--
--     local hide_in_width = function()
--       return vim.fn.winwidth(0) > 100
--     end
--
--     local diagnostics = {
--       'diagnostics',
--       sources = { 'nvim_diagnostic' },
--       sections = { 'error', 'warn' },
--       symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
--       colored = false,
--       update_in_insert = false,
--       always_visible = false,
--       cond = hide_in_width,
--     }
--
--     local diff = {
--       'diff',
--       colored = false,
--       symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
--       cond = hide_in_width,
--     }
--
--     require('lualine').setup {
--       options = {
--         icons_enabled = true,
--         theme = themes[env_var_nvim_theme], -- Set theme based on environment variable
--         -- Some useful glyphs:
--         -- https://www.nerdfonts.com/cheat-sheet
--         --        
--         section_separators = { left = '', right = '' },
--         component_separators = { left = '', right = '' },
--         disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
--         always_divide_middle = true,
--       },
--       sections = {
--         lualine_a = { mode },
--         lualine_b = { 'branch' },
--         lualine_c = { filename },
--         lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
--         lualine_y = { 'location' },
--         lualine_z = { 'progress' },
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { { 'filename', path = 1 } },
--         lualine_x = { { 'location', padding = 0 } },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       extensions = { 'fugitive' },
--     }
--   end,
-- }
--


-- Set lualine as statusline
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Define zenbones light colors
    local colors = {
      bg = '#faf3e0',  -- Background (soft off-white)
      fg = '#5c6a72',  -- Foreground (gray-blue)
      accent = '#61afef', -- Accent (soft red/pink)
      highlight = '#96c367', -- Highlight (green)
      muted = '#c8c093', -- Muted (light brown)
      subtle = '#dca561', -- Subtle (yellow/golden)
      text = '#4a4a4a', -- Main text
    }

    -- Zenbones light theme for lualine
    local zenbones_light_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.accent, gui = 'bold' },
        b = { fg = colors.text, bg = colors.muted },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = { a = { fg = colors.bg, bg = colors.highlight, gui = 'bold' } },
      visual = { a = { fg = colors.bg, bg = colors.subtle, gui = 'bold' } },
      replace = { a = { fg = colors.bg, bg = colors.accent, gui = 'bold' } },
      command = { a = { fg = colors.bg, bg = colors.muted, gui = 'bold' } },
      inactive = {
        a = { fg = colors.muted, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.muted, bg = colors.bg },
        c = { fg = colors.muted, bg = colors.bg },
      },
    }

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0,
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn', 'info', 'hint' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = true,
    }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = '柳', removed = ' ' },
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = zenbones_light_theme,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { filename },
        lualine_x = { diagnostics, 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}

