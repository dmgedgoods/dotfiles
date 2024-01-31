return {
    "lervag/vimtex",
    dependencies = {
        "xuhdev/vim-latex-live-preview",
    },
    ft = { "tex" },
    config = function()
        vim.cmd([[
        let maplocalleader = " "
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'
        let g:vimtex_compiler_progname = "nvr"
        let g:vimtex_view_method = "skim"
        let g:vimtex_imaps_enabled = 0
        let g:vimtex_complete_enabled = 0

        call vimtex#init()

        set conceallevel=2
        let g:vimtex_syntax_conceal["math_super_sub"]=0
        highlight Conceal guifg=#d19a66 guibg=NONE

        augroup vimtex_config
            au!
            au User VimtexEventQuit call vimtex#compiler#clean(0)
        augroup END

        " This adds a callback hook that updates Skim after compilation
        augroup vimtex_compilation
        au!
        au User VimtexEventCompileSuccess call UpdateSkim()
        augroup END

        function! UpdateSkim()
            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction

        " autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pvc -pdf %<CR>
        ]])
    end

}
