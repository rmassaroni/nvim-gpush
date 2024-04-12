local config = require("nvim-gpush.config")

local M = {}

function M.gpush(args)
    local script_path = os.getenv("HOME") .. "/.gpush/gpush.sh"
    local tags = ""

    if config.options.debug_mode == true then
        if config.options.file_specific_configs[file_type] then
            local file_type_config = config.options.file_specific_configs[file_type]
            for option, value in pairs(file_type_config) do
                if config.options[option] ~= nil then
                    config.extend({[option] = value})
                end
            end
        end
    end

    local commit_message = "\"" .. config.options.default_commit_message .. "\""
    local branch = config.options.default_branch


    if args:sub(1, 1) == "\"" then
        local last_quote = args:find("\"[^\"]*$")
        commit_message = args:sub(1, last_quote)
        branch = args:sub(last_quote + 2)
    elseif args ~= "" then
        commit_message = "\"" .. args .. "\""
    end

    if config.options.one_liner == true then
        tags = tags .. " -q"
    end
    if commit_message ~= "" then
        tags = tags .. " " .. commit_message
    end
    if branch ~= "" then
        tags = tags .. " " .. branch
    end

    local cmd = "bash -c 'source " .. script_path .. " && gpush " .. tags .. "'"

    local handle = io.popen(cmd)
    local result = handle:read("*a")
    local exit_code = {handle:close()}

    if exit_code[1] == true then
        vim.api.nvim_command('echom "' .. result .. '"')
    else
        print("fail")
        if exit_code[3] then
            print("Exit code:", exit_code[3])
        end
        print("Output:", result)
    end
end

function M.gp(args)
    M.gpush(args)
end

function M.gw(args)
    vim.api.nvim_command('w')
    M.gpush(args)
end

function M.gwq(args)
    M.gw(args)
    vim.api.nvim_command('qa')
end

return M
