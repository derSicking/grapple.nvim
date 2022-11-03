local types = require("grapple.types")

---@type Grapple.Config
local M = {}

---@class Grapple.Config
local DEFAULT_CONFIG = {
    ---@type "debug" | "info" | "warn" | "error"
    log_level = "warn",

    ---The scope used when creating, selecting, and deleting tags
    ---@type Grapple.Scope
    scope = types.Scope.GLOBAL,

    ---The save location for tags
    save_path = vim.fn.stdpath("data") .. "/" .. "grapple.json",

    integrations = {
        -- todo(cbochs): implement
        resession = false,
    },
}

---@type Grapple.Config
local _config = DEFAULT_CONFIG

---@param opts? Grapple.Config
function M.load(opts)
    opts = opts or {}

    ---@type Grapple.Config
    _config = vim.tbl_deep_extend("force", DEFAULT_CONFIG, opts)
end

setmetatable(M, {
    __index = function(_, index)
        return _config[index]
    end,
})

return M
