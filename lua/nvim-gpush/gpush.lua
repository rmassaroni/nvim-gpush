local config = require("nvim-gpush.config")

local M = {}

function M.gpush()
    local script_path = os.getenv("HOME") .. "/.gpush/gpush.sh"

    local cmd = "bash -c 'source " .. script_path .. " && gpush'"
    if config.options.one_liner == true then
        cmd = "bash -c 'source " .. script_path .. " && gpush -q'"
    end

    local handle = io.popen(cmd)
    local result = handle:read("*a")
    local exit_code = {handle:close()}

    print("One-liner: ", config.options.one_liner)


    if exit_code[1] == true then
        --print("success")
        --print("output:", result)
        print(result)
    else
        print("fail")
        if exit_code[3] then
            print("Exit code:", exit_code[3])
        end
        print("Output:", result)
    end
end

return M
