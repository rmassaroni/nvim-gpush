local gp = require("nvim-gpush.gpush")
local config = require("nvim-gpush.config")
local update = require("nvim-gpush.gpush_update")


-- Check if gpush is available
--local gpush_installed = vim.fn.system('command -v gpush >/dev/null') == 0
local gpush_installed = vim.fn.isdirectory(vim.fn.expand('$HOME/.gpush')) == 1

if not gpush_installed then
    -- gpush is not available, proceed with installation
    print("Installing gpush...")
    -- Run installation script
    local install_command = "bash <(curl -sSL https://raw.githubusercontent.com/rmassaroni/gpush/install.sh)"
    local install_result = vim.fn.system(install_command)

    if install_result == 0 then
        -- Installation successful, check if gpush is now available
        gpush_installed = vim.fn.system('command -v gpush >/dev/null') == 0
        if gpush_installed then
            print("gpush has been installed successfully.")
        else
            print("Failed to install gpush. Please install it manually.")
        end
    else
        print("Failed to install gpush.")
    end
else
    -- gpush is already available
    --print("gpush is already installed.")
end



local M = {}

function M.load(opts)
    if opts then
        require("nvim-gpush.config").extend(opts)
    end
end

M.setup = config.setup

--M.gpush = gp.gpush
M.gpush = function(commit_message, branch)
    gp.gpush(commit_message, branch)
end
--M.gw = gp.gw
M.gw = function(commit_message, branch)
    gp.gw(commit_message, branch)
end

M.gwq = function(commit_message, branch)
    gp.gwq(commit_message, branch)
end

M.update = function()
    update.update()
end

return M
