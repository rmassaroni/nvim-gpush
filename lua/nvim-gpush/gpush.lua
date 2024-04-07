local config = require("nvim-gpush.config")

local M = {}

function M.gpush(commit_message)
    local script_path = os.getenv("HOME") .. "/.gpush/gpush.sh"

    local cmd = "bash -c 'source " .. script_path .. " && gpush \"" .. config.options.default_commit_message .. "\"'"
    if config.options.one_liner == true then
        cmd = "bash -c 'source " .. script_path .. " && gpush -q \"" .. config.options.default_commit_message .. "\"'"
    end

    if commit_message ~= "" then
        cmd = "bash -c 'source " .. script_path .. " && gpush " .. commit_message .. "'"
        if config.options.one_liner == true then
            cmd = "bash -c 'source " .. script_path .. " && gpush -q " .. commit_message .. "'"
        end
    end

    local handle = io.popen(cmd)
    local result = handle:read("*a")
    --local result = handle:lines()
    local exit_code = {handle:close()}

    if exit_code[1] == true then
        --print("success")
        --print("result" .. result)
        result = result:gsub("%z", "")
        vim.api.nvim_command('echom "' .. result .. '"')
    else
        print("fail")
        if exit_code[3] then
            print("Exit code:", exit_code[3])
        end
        print("Output:", result)
    end
end

function M.gw(commit_message)
    vim.api.nvim_command('w')
    M.gpush(commit_message)
end

function M.gwq(commit_message)
    M.gw(commit_message)
    vim.api.nvim_command('qa')
end

return M
