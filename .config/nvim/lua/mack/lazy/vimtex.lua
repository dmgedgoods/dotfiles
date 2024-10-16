return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = ""
        vim.g.vimtex_compiler_method = "latexmk"
        -- Custom function to open Okular
        local function open_with_okular()
            local pdf_path = vim.fn.expand('%:r') .. '.pdf'  -- Get the current file's PDF path
            vim.fn.jobstart({ 'C:/Program Files/WindowsApps/KDEe.V.Okular_23.801.1522.0_x64__7vt06qxq7ptv8/bin/okular', pdf_path }, { detach = true }) -- Run Okular in the background
        end

        -- Keybinding to open Okular
        vim.keymap.set('n', '<leader>vo', open_with_okular, { noremap = true, silent = true })
    end
}
