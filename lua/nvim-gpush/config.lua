local M = {}

local defaults = {
    auto_gpush_on_write = false,
}

M.options = {}

function M.setup(options)
    M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M
