if exists("g:loaded_nvim_gpush")
    finish
endif
let g:loaded_nvim_gpush = 1


command! -nargs=0 gpush lua require("nvim-gpush").gpush()
