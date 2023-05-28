local Config = require("gpt4all.config")

local M = {}

function M.setup()
  vim.cmd([[sign define gpt4all_action_start_block text=┌ texthl=ErrorMsg linehl=BufferLineBackground]])
  vim.cmd([[sign define gpt4all_action_middle_block text=│ texthl=ErrorMsg linehl=BufferLineBackground]])
  vim.cmd([[sign define gpt4all_action_end_block text=└ texthl=ErrorMsg linehl=BufferLineBackground]])

  vim.cmd([[sign define gpt4all_chat_start_block text=┌ texthl=Constant]])
  vim.cmd([[sign define gpt4all_chat_middle_block text=│ texthl=Constant]])
  vim.cmd([[sign define gpt4all_chat_end_block text=└ texthl=Constant]])

  vim.cmd("sign define gpt4all_question_sign text=" .. Config.options.chat.question_sign .. " texthl=Gpt4AllQustion")
end

function M.set(name, bufnr, line)
  pcall(vim.fn.sign_place, 0, "gpt4all_ns", name, bufnr, { lnum = line + 1 })
end

function M.del(bufnr)
  pcall(vim.fn.sign_unplace, "gpt4all_ns", { buffer = bufnr })
end

function M.set_for_lines(bufnr, start_line, end_line, type)
  if start_line == end_line or end_line < start_line then
    M.set("gpt4all_" .. type .. "_middle_block", bufnr, start_line)
  else
    M.set("gpt4all_" .. type .. "_start_block", bufnr, start_line)
    M.set("gpt4all_" .. type .. "_end_block", bufnr, end_line)
  end
  if start_line + 1 < end_line then
    for j = start_line + 1, end_line - 1, 1 do
      M.set("gpt4all_" .. type .. "_middle_block", bufnr, j)
    end
  end
end

return M
