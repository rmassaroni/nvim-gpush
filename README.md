## Installation
```Lua
--lazy.nvim
{
    "rmassaroni/nvim-gpush",
    lazy = false,
    config = function ()
        require("nvim-gpush").setup({
            --insert config options
        })
    end
}
```

## Defaults
```Lua
---more config options are available in '~/.gpush/gconfig'.  See https://github.com/rmassaroni/gpush  
{
    auto_gpush_on_write = false,
    one_liner = true,
}
