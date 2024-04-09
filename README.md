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
    one_liner = true, --false results in a visual bug regarding the command buffer
    default_commit_message = "unnamed commit" --overrides default_message in ~/.gpush/gconfig.sh
    default_branch = "main" --not yet functional
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
- installation for other OSs.  Will release v1.0.0 with this.
- finish auto_gpush. make it toggleable.
- specify system cwd vs nvim cwd. cwd argument
- include required storage space, speed, and other plguin stats
- option to change and specify path of .gpush dir. in config.
- Gp shortcut. Keymaps
- Branch specification provided by gpush. Other gpush features.
- smart nomenclature: commits are named as a file name if only one file was edited
- remove the requirement to press enter in response to the gpush message. works for one_liner gpush only
- CI workflow
- ":silent w", ":silent q"
- Gwq should print a line to terminal after quitting.
- write all? options
- support for other plugin managers
- script to find if there is a new release of gpush available for download
- config option to auto_update gpush
- mention required version of gpush. the latest is not always required


## Known Bugs
- printed output (one_liner = false) bugs the command buffer
- '@' appears in command line message
- Gupdate command always fails


## Contributing
Pull requests are welome!
