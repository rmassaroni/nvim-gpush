local M = {}

function M.gpush()
    print("gpushing")
    --local result, exit_code = os.execute("echo hello")
    local cmd = "wsl echo hello"
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    local exit_code = {handle:close()}
    if exit_code[1] == true then
        print("success")
    else
        print("fail")
        if exit_code[3] then
            print("Exit code:", exit_code[3])
        end
        print("Output:", result)
    end
end

return M
