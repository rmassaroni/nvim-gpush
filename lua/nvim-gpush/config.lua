local M = {}

local defaults = {
    auto_gpush_on_write = false,
    one_liner = true,
    default_commit_message = "unnamed commit",
    default_branch = "main",
    debug_mode = false,
    file_specific_configs = {}
}


M.options = {}

function M.setup(options)
    M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

function M.extend(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, options or {})
end

M.setup()

return M
