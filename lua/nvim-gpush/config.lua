local M = {}

local defaults = {
    auto_gpush_on_write = false,
    one_liner = true,
    default_commit_message = "unnamed commit",
    default_branch = "main",
    debug_mode = false,
    file_specific_configs = {
        lua = {},
        java = {},
        py = {},
    }
}


M.options = {}

function M.setup(options)
    M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

function M.file_config(file_type, key, value)
    M.options.file_specific_configs[file_type] = M.options.file_specific_configs[file_type] or {}
    M.options.file_specific_configs[file_type][key] = value
end

function M.extend(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, options or {})
end

M.setup()

return M
