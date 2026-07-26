require "nvchad.autocmds"

local api = vim.api

api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argc = vim.fn.argc()

    if argc == 0 then
      vim.schedule(function()
        vim.cmd("NvimTreeFocus")
      end)
      return
    end

    if argc == 1 then
      local arg = vim.fn.argv(0) --[[@as string]]

      if vim.fn.isdirectory(arg) == 1 then
        vim.schedule(function()
          vim.cmd("NvimTreeFocus")
        end)
      end
    end
  end,
})
