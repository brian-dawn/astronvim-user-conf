


return {

    colorscheme = "astrolight",
    plugins = {

        {
          "nvim-telescope/telescope.nvim",
          -- the first parameter is the plugin specification
          -- the second is the table of options as set up in Lazy with the `opts` key
          config = function(plugin, opts)


            -- Disable the default mappings by ignoring opts...
            telescope_config.defaults.mappings = nil

            
            require("plugins.configs.telescope")(plugin, opts)
        
            -- require telescope and load extensions as necessary
            local telescope = require "telescope"
          end,
        }

    },
    polish = function()
  
        -- This function just runs last so put whatever you want in here.
        --
        --
        --
      -- reset  
        -- reset Terminal Navigation
        local maps = require("astronvim.utils").empty_map_table()
        vim.api.nvim_del_keymap('t', '<C-h>')
        vim.api.nvim_del_keymap('t', '<C-j>')
        vim.api.nvim_del_keymap('t', '<C-k>')
        vim.api.nvim_del_keymap('t', '<C-l>')


      -- neovide
      if vim.g.neovide then
        -- Enable copy paste on macos with cmd
        vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
        vim.keymap.set('v', '<D-c>', '"+y') -- Copy
        vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
        vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
        vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
        vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
      
        -- TODO: can be moved to the g section.
        vim.g.neovide_input_macos_alt_is_meta = true
        vim.g.neovide_cursor_trail_size = 0.0
        vim.g.neovide_scroll_animation_length = 0.005
      
        vim.g.neovide_cursor_animate_in_insert_mode = true
      end
  
    end,
}
