local config = require("nvim-gpush.config")

local M = {}

function M.update()
    print("Updating gpush")
    local install_command = "bash <(curl -sSL https://raw.githubusercontent.com/rmassaroni/gpush/install.sh)"
    local install_result = vim.fn.system(install_command)

    if install_result == 0 then
        -- Installation successful, check if gpush is now available
        local gpush_updated = vim.fn.system('command -v gpush >/dev/null') == 0
        if gpush_updated then
            print("gpush has been installed successfully.")
        else
            print("Failed to install gpush. Please install it manually.")
        end
    else
        print("Failed to install gpush.")
    end

end


return M
