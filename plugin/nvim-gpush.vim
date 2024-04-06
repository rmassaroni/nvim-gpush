if exists("g:loaded_nvim_gpush")
    finish
endif
let g:loaded_nvim_gpush = 1


command! -nargs=0 Gpush lua require("nvim-gpush").gpush()
command! -nargs=0 Gw lua require("nvim-gpush").gw()
