local M = {}

--local defaults = {
M.defaults = {
    auto_gpush_on_write = false,
    one_liner = true
}

M.options = {}

function M.setup(options)
    M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

function M.extend(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or M.defaults, options or {})
end

M.setup()

return M
