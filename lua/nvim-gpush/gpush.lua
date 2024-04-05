local M = {}

function M.gpush()
    print("gpushing")
    local result = os.execute("bash -c '" .. "echo hello" .. "' executed successfully.")
    if result == true then
        print("success")
    else
        print("fail")
    end
end

return M
