vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "rust", "python", "javascript", "typescript" },
  callback = function()
    local cs = vim.bo.commentstring
    if cs and not cs:match(" %%s") then
      vim.bo.commentstring = cs:gsub("%%s", " %%s")
    end
  end,
})
