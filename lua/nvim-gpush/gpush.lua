local M = {}

function M.gpush()
    print("gpushing")
    local result = os.execute("echo hello")
    if result == true then
        print("success")
    else
        print("fail")
    end
end

return M
