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
    one_liner = true, --false results in a bug regarding the command buffer
    default_commit_message = "unnamed commit" --overrides default_message in ~/.gpush/gconfig.sh
}
```
    
## Commands
| Command      | Usage                                        | Arguments |
|--------------|----------------------------------------------|-----------|
| :Gpush       | Commits & pushes all changes in current repository | commit_message (optional)     |
| :Gw             | Writes & gpushes                                             | commit_message (optional)   |
| :Gwq             | Writes, gpushes, & quits (all)                                             | commit_message (optional)     |


## Example Usage
- :Gpush
- :Gpush message
- :Gpush "bug fix"

## TODO
- language specific configs
- installation for other OSs
- toggle auto-gpush
- specify system cwd vs nvim cwd
- include required storage space, speed, and other plguin stats
- option to change path of .glinks dir
- Gp shortcut
- Branch specification provided by gpush
- smart nomenclature: commits are named as a file name if only one file was edited
- remove the requirement to press enter in response to the gpush message. works for one_liner gpush only
- CI workflow
- ":silent w"


## Known Bugs
- printed output (one_liner = false) bugs the command buffer
- '@' appears in command lne message


## Contributing
Pull requests are welome!
