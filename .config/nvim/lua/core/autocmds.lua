vim.api.nvim_create_augroup("MyAutoCommands", { clear = true })

-- Open various document formats with pandoc
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "MyAutoCommands",
  pattern = { "*.rtf" },
  callback = function()
    vim.cmd("%!pandoc --from=rtf --to=markdown --markdown-headings=atx " .. vim.fn.fnameescape(vim.fn.expand("%")))
    vim.bo.filetype = "markdown"
  end,
})

-- For markdown files in my notes folder, sync from S3 when opening Neovim (works with markor on my phone)
vim.api.nvim_create_autocmd("VimEnter", {
  group = "MyAutoCommands",
  pattern = { vim.fn.expand("~/notes") .. "/*" },
  callback = function()
    os.execute("aws s3 sync --only-show-errors s3://bcampolo/notes ~/notes")
    vim.defer_fn(function() vim.notify("Synced All Notes from S3", vim.log.levels.INFO) end, 1000)
  end,
})

-- For markdown files in my notes folder, sync to S3 (works with markor on my phone)
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "MyAutoCommands",
  pattern = { vim.fn.expand("~/notes") .. "/*" },
  callback = function()
    local path = vim.fn.expand("%:p")
    local relative_path = path:gsub(os.getenv("HOME") .. "/notes/", "")
    os.execute("aws s3 cp --only-show-errors " .. path .. " s3://bcampolo/notes/" .. relative_path)
    vim.defer_fn(function() vim.notify("Synced Note: " .. path .. " to S3", vim.log.levels.INFO) end, 100)
  end,
})
