local M = {}

function M.gpush()
    local script_path = os.getenv("HOME") .. "/.gpush/gpush"
    local cmd = "bash -c 'source " .. script_path .. " && gpush'"
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    local exit_code = {handle:close()}

    if exit_code[1] == true then
        --print("success")
        --print("output:", result)
    else
        print("fail")
        if exit_code[3] then
            print("Exit code:", exit_code[3])
        end
        print("Output:", result)
    end
end

return M
