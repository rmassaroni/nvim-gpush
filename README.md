# Stop Being Slow!
Closing Vim to commit and push is decreasing your efficiency! nvim-gpush is the perfect tool for you! Powered by [rmassaroni/gpush](https://github.com/rmassaroni/gpush)!

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
    auto_gpush_on_write = false, --not yet functional. use :Gw instead
    one_liner = true,
    default_commit_message = "unnamed commit" --overrides default_message in ~/.gpush/gconfig.sh
}
```

## Commands
| Command      | Usage                                        | Arguments |
|--------------|----------------------------------------------|-----------|
| :Gpush       | Commits & pushes all changes in current repository | commit_message (optional)     |
| :Gw             | Writes & gpushes                                             | commit_message (optional)   |
| :Gwq             | Writes, gpushes, and quits (all)                                             | commit_message (optional)     |


## TODO
- auto-gpush for chosen languages
- installation for other OSs
- toggle auto-gpush
- specify system cwd vs nvim cwd
- include required storage space


## Known bugs
- 
