-- main module file
local api = require("gpt4all.api")
local module = require("gpt4all.module")
local config = require("gpt4all.config")
local signs = require("gpt4all.signs")

local M = {}

M.setup = function(options)
  -- set custom highlights
  vim.api.nvim_set_hl(0, "Gpt4AllQuestion", { fg = "#b4befe", italic = true, bold = false, default = true })

  vim.api.nvim_set_hl(0, "Gpt4AllWelcome", { fg = "#9399b2", italic = true, bold = false, default = true })

  vim.api.nvim_set_hl(0, "Gpt4AllTotalTokens", { fg = "#ffffff", bg = "#444444", default = true })
  vim.api.nvim_set_hl(0, "Gpt4AllTotalTokensBorder", { fg = "#444444", default = true })

  vim.api.nvim_set_hl(0, "Gpt4AllMessageAction", { fg = "#ffffff", bg = "#1d4c61", italic = true, default = true })

  vim.api.nvim_set_hl(0, "Gpt4AllCompletion", { fg = "#9399b2", italic = true, bold = false, default = true })

  vim.cmd("highlight default link Gpt4AllSelectedMessage ColorColumn")

  config.setup(options)
  api.setup()
  signs.setup()
end

--
-- public methods for the plugin
--

M.openChat = function()
  module.open_chat()
end

M.selectAwesomePrompt = function()
  module.open_chat_with_awesome_prompt()
end

M.edit_with_instructions = function()
  module.edit_with_instructions()
end

M.run_action = function(opts)
  module.run_action(opts)
end

M.complete_code = module.complete_code

return M
