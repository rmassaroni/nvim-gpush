local config = require("nvim-gpush.config")

local M = {}

function M.gpush(commit_message)
    local script_path = os.getenv("HOME") .. "/.gpush/gpush.sh"

    local cmd = "bash -c 'source " .. script_path .. " && gpush \"" .. config.options.default_commit_message .. "\"'"
    if config.options.one_liner == true then
        cmd = "bash -c 'source " .. script_path .. " && gpush -q \"" .. config.options.default_commit_message .. "\"'"
    end


    if commit_message ~= "" then
        --print(commit_message)
        --cmd = cmd .. " \"" .. commit_message .. "\""
        --cmd = cmd .. " " .. commit_message
        cmd = "bash -c 'source " .. script_path .. " && gpush " .. commit_message .. "'"
        --print(cmd)
        if config.options.one_liner == true then
            cmd = "bash -c 'source " .. script_path .. " && gpush -q " .. commit_message .. "'"
        end
    end


--[[
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    local exit_code = {handle:close()}

    if exit_code[1] == true then
        --print("success")
        --print("output:", result)
        --print(result)
    else
        print("fail")
        if exit_code[3] then
            print("Exit code:", exit_code[3])
        end
        print("Output:", result)
    end

    --vim.cmd("<CR>")
--]]
    --t

    local output = {}
    local job_id = vim.fn.jobstart(cmd, {
        --on_exit = function(_, exit_code)
        on_exit = function(_, _)
            --if exit_code == 0 then
                --print("gpush successful")
            if #output > 0 then
                vim.fn.echo(output[#output])
            else
                --print("gpush failed with exit code: " .. exit_code)
                vim.fn.echo("fail")
            end
        end,
        on_stdout = function(_, data)
            -- Handle stdout if needed
            table.insert(output, data)
            vim.fn.execute("redraw")
        end,
        on_stderr = function(_, data)
            -- Handle stderr if needed
        end
    })

    if job_id <= 0 then
        print("Failed to start job for gpush command")
    end
--]]

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
