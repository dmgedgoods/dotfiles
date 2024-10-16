return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    -- You can add any options or leave empty for defaults.
  },
  config = function()
    local api = require('remote-sshfs.api')
    local builtin = require("telescope.builtin")
    local connections = require("remote-sshfs.connections")

    -- Key mappings for remote-sshfs functionality
    vim.keymap.set('n', '<leader>rc', api.connect, {})
    vim.keymap.set('n', '<leader>rd', api.disconnect, {})
    vim.keymap.set('n', '<leader>re', api.edit, {})

    -- Override telescope find_files and live_grep based on connection status
    vim.keymap.set("n", "<leader>ff", function()
      if connections.is_connected() then
        api.find_files()
      else
        builtin.find_files()
      end
    end, {})

    vim.keymap.set("n", "<leader>fg", function()
      if connections.is_connected() then
        api.live_grep()
      else
        builtin.live_grep()
      end
    end, {})
  end
}

