vim.api.nvim_create_user_command("Gpt4All", function()
  require("gpt4all").openChat()
end, {})

vim.api.nvim_create_user_command("Gpt4AllActAs", function()
  require("gpt4all").selectAwesomePrompt()
end, {})

vim.api.nvim_create_user_command("Gpt4AllEditWithInstructions", function()
  require("gpt4all").edit_with_instructions()
end, {})

vim.api.nvim_create_user_command("Gpt4AllRun", function(opts)
  require("gpt4all").run_action(opts)
end, {
  nargs = "*",
  range = true,
  complete = function()
    local ActionFlow = require("gpt4all.flows.actions")
    local action_definitions = ActionFlow.read_actions()

    local actions = {}
    for key, _ in pairs(action_definitions) do
      table.insert(actions, key)
    end
    table.sort(actions)

    return actions
  end,
})

vim.api.nvim_create_user_command("Gpt4AllCompleteCode", function(opts)
  require("gpt4all").complete_code(opts)
end, {})
