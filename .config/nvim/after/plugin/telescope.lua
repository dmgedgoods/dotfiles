local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set("n", "<Leader>fhh", function()
    require("telescope.builtin").grep_string(require("telescope.themes").get_dropdown({
        prompt_title = "Help",
        search = "",
        search_dirs = vim.api.nvim_get_runtime_file("doc/*.txt", true),
        only_sort_text = true,
        disable_coordinates = true,
        path_display = "hidden",
        layout_config = {
            anchor = "S",
            prompt_position = "bottom",
            height = 0.35,
            width = 0.9,
        },
    }))
end)
