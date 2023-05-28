local Session = require("gpt4all.flows.chat.session")
local Prompts = require("gpt4all.prompts")
local Chat = require("gpt4all.flows.chat.base")

local M = {
  chat = nil,
}

M.open = function()
  if M.chat ~= nil then
    M.chat:toggle()
  else
    M.chat = Chat:new()
    M.chat:open()
  end
end

M.open_with_awesome_prompt = function()
  Prompts.selectAwesomePrompt({
    cb = vim.schedule_wrap(function(act, prompt)
      -- create new named session
      local session = Session.new({ name = act })
      session:save()

      local chat = Chat:new()
      chat:open()
      chat.chat_window.border:set_text("top", " Gpt4All - Acts as " .. act .. " ", "center")

      chat:set_system_message(prompt)
      chat:open_system_panel()
    end),
  })
end

return M
