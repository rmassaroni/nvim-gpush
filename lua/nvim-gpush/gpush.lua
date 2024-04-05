local M = {}

function M.gpush()
    print("gpushing")
    local result, exit_code = os.execute("echo hello")
    if result == true then
        print("success")
    else
        print("fail")
        if exit_code then
            print("exit_code: ", exit_code)
        end
    end
end

return M
