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
> Depending on your OS, this installation process should automatically install [rmassaroni/gpush](https://github.com/rmassaroni/gpush). If it fails, consider manually installing with "bash <(curl https://raw.githubusercontent.com/rmassaroni/gpush/main/install.sh)" on Unix systems.

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
| :Gw             | Writes and gpushes                                             |
|              |                                              |


## TODO
- auto-gpush for chosen languages
- installation for other OSs
- toggle auto-gpush
- gpush tag capability
- specify system cwd vs nvim cwd
- include required storage space
