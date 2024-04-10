local config = require("nvim-gpush.config")

local M = {}

function M.gpush(commit_message, branch)
    local script_path = os.getenv("HOME") .. "/.gpush/gpush.sh"
    local tags = ""

    --local branch = "multi-arg-feature"
    if config.options.one_liner == true then
        tags = tags .. " -q"
    end
    if commit_message ~= "" then
        tags = tags .. " " .. commit_message
    else
        tags = tags .. " " .. config.options.default_commit_message
    end
    if branch ~= "" then
        --tags = tags .. " " .. branch
    else
        --tags = tags .. " " .. config.options.default_branch
    end
-- tes

    if config.options.debug_mode == true then
        print(commit_message[0])
        print("commit_message: " .. commit_message)
        print(branch)
        print("tags: " .. tags)
        print("bash -c 'source " .. script_path .. " && gpush " .. tags .. "'")
    end

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

    if config.options.debug_mode == true then
        cmd = "bash -c 'source " .. script_path .. " && gpush " .. tags .. "'"
    end

    local handle = io.popen(cmd)
    local result = handle:read("*a")
    --local result = handle:lines()
    local exit_code = {handle:close()}

    if exit_code[1] == true then
        --print("success")
        --print("result" .. result)
        --result = result:gsub("%z", "")
        vim.api.nvim_command('echom "' .. result .. '"')
    else
        print("fail")
        if exit_code[3] then
            print("Exit code:", exit_code[3])
        end
        print("Output:", result)
    end


    --vim.api.nvim_command('<CR>')
end

function M.gw(commit_message, branch)
    vim.api.nvim_command('w')
    M.gpush(commit_message, branch)
end

function M.gwq(commit_message, branch)
    M.gw(commit_message, branch)
    vim.api.nvim_command('qa')
end

return M
