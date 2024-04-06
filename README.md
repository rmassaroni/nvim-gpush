Powered by [rmassaroni/gpush](https://github.com/rmassaroni/gpush)!

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
> [!NOTE]
> This installation process should automatically install [rmassaroni/gpush](https://github.com/rmassaroni/gpush). If it fails, consider manually installing with bash <(curl https://raw.githubusercontent.com/rmassaroni/gpush/main/install.sh). This depends on your OS.

## Defaults
```Lua
--more config options are available in '~/.gpush/gconfig'. See https://github.com/rmassaroni/gpush  
{
    auto_gpush_on_write = false,
    one_liner = true,
}
```

## Commands
| Command      | Usage                                        |
|--------------|----------------------------------------------|
| :Gpush       | Commits & pushes all changes in current repository |
|              |                                              |
|              |                                              |


## TODO
- auto-gpush for chosen languages
- installation for other OSs
