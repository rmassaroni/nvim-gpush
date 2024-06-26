if exists("g:loaded_nvim_gpush")
    finish
endif
let g:loaded_nvim_gpush = 1

""function! Gpush(commit_message)
""    let lua_cmd = 'lua require("nvim-gpush").gpush("' . a:commit_message . '")'
""    execute lua_cmd
""endfunction
" command! -nargs=0 Gpush lua require("nvim-gpush").gpush()
""command! -nargs=* Gpush call Gpush(<q-args>)
command! -nargs=* Gpush lua require("nvim-gpush").gpush(<q-args>)
command! -nargs=* Gp lua require("nvim-gpush").gpshort(<q-args>)


""command! -nargs=0 Gw lua require("nvim-gpush").gw()
command! -nargs=* Gw lua require("nvim-gpush").gw(<q-args>)

command! -nargs=* Gwq lua require("nvim-gpush").gwq(<q-args>)

command! -nargs=0 Gupdate lua require("nvim-gpush").update()
