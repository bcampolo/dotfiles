SSE_SERVER_ID = 0
JOB_ID = 0

-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk 
keymap.set("i", "ii", "<ESC>") -- exit insert mode with ii
keymap.set("i", "II", "<ESC><CapsLock>") -- exit insert mode with ii
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save

-- Split window management
keymap.set("n", "<leader>nh", "nohl<CR>")
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger 
keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- Get token
keymap.set("n", "<leader>xt", function()
  -- kill existing process
  -- vim.fn.jobstop(MOCK_PROC_ID)
  -- build jar using gradle
  MOCK_PROC_ID = vim.fn.jobstart({
    "java",
    "-cp",
    "/home/a0msfzz/git/gpcs-gpcs-104/gpcs/mock/build/libs/gpcsTestClient.jar",
    "-Xmx1g",
    "com.mmmhis.gpcs.mock.GpcsTestClient",
    "-sts_address", "https://gpcs.soa-rd.aws.3mhis.net/GpcsSts/oauth/token",
    "-clientkey", "/home/a0msfzz/Downloads/2870159_3MHealthInformationSystems_Cert.jks",
    "-ignore_certificate_errors", "true",
    "-request_timeout", "60000",
    "-rest_token_type", "jwt",
    "-token_only", "true",
  }, {
    stdout_buffered = true,
    on_stdout = function (_, data)
      if data then
        local token = "Authorization: " .. data[1]
        local ok, result = pcall(vim.fn.writefile, {token}, "/tmp/token.jwt")

        if ok then
            print("Token Updated, see /tmp/token.log for details")
        else
            print(result)
        end
      end
    end,
    stderr_buffered = true,
    on_stderr = function (_, data)
      if data then
        local ok, result = pcall(vim.fn.writefile, data, "/tmp/token.log")

        if not ok then
            print(result)
        end
      end
    end,
   -- if successful...
    -- on_exit = function(_, data)
    --   if vim.api.nvim_get_vvar("shell_error") == 0 then
    --   end
    -- end
  })
end)

-- Get production token
keymap.set("n", "<leader>xp", function()
  -- kill existing process
  -- vim.fn.jobstop(MOCK_PROC_ID)
  -- build jar using gradle
    -- "-authorized_site_name", "3MTest",
  MOCK_PROC_ID = vim.fn.jobstart({
    "java",
    "-cp",
    "/home/a0msfzz/git/gpcs-gpcs-104/gpcs/mock/build/libs/gpcsTestClient.jar",
    "-Xmx1g",
    "com.mmmhis.gpcs.mock.GpcsTestClient",
    "-sts_address", "https://gpcs.soa-pr.aws.3mhis.net/GpcsSts/oauth/token",
    "-clientkey", "/home/a0msfzz/Downloads/2870159_3MHealthInformationSystems_SuperCert-PR.jks",
    "-ignore_certificate_errors", "true",
    "-request_timeout", "60000",
    "-rest_token_type", "jwt",
    "-token_only", "true",
  }, {
    stdout_buffered = true,
    on_stdout = function (_, data)
      if data then
        local token = "Authorization: " .. data[1]
        local ok, result = pcall(vim.fn.writefile, {token}, "/tmp/token.jwt")

        if ok then
            print("Token Updated, see /tmp/token.log for details")
        else
            print(result)
        end
      end
    end,
    stderr_buffered = true,
    on_stderr = function (_, data)
      if data then
        local ok, result = pcall(vim.fn.writefile, data, "/tmp/token.log")

        if not ok then
            print(result)
        end
      end
    end,
   -- if successful...
    -- on_exit = function(_, data)
    --   if vim.api.nvim_get_vvar("shell_error") == 0 then
    --   end
    -- end
  })
end)


-- LSP/JDTLS
keymap.set('n', '<leader>go', "<cmd>lua require('jdtls').organize_imports()<CR>")
keymap.set('n', '<leader>gu', "<cmd>lua require('jdtls').update_projects_config()<CR>")
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Testing
keymap.set("n", "<leader>tc", "<cmd>lua require('jdtls').test_class()<CR>")
keymap.set("n", "<leader>tm", "<cmd>lua require('jdtls').test_nearest_method()<CR>")

-- Nvim-dap
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

-- Starship Empire
-- client
keymap.set("n", "<leader>xc", function()
  vim.fn.jobstart({ "steam", "-dev", "steam://rungameid/1882170" }, { stdout_buffered = true })
end)

-- server
keymap.set("n", "<leader>xs", function()
  -- kill existing server
  vim.fn.jobstop(SSE_SERVER_ID)
  -- build jar using gradle
  vim.fn.jobstart({
    "sh",
    "/home/bcampolo/git/starshipempire/server/gradlew",
    "-p",
    "/home/bcampolo/git/starshipempire/server",
    "build"
  }, {
    stdout_buffered = true,
    -- on_stdout = function (_, data)
    --   if data then
    --     print(dump(data))
    --   end
    -- end,
    stderr_buffered = true,
    on_stderr = function (_, data)
      if data then
        print(dump(data))
      end
    end,
   -- if successful, then start server
    on_exit = function(_, data)
      if vim.api.nvim_get_vvar("shell_error") == 0 then
        SSE_SERVER_ID = vim.fn.jobstart({
          "java",
          "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8001",
          "-cp",
          "/home/bcampolo/git/starshipempire/server/build/libs/starshipempireserver.jar",
          "-Xmx2g",
          "-Dstarshipempire.db.path=/home/bcampolo/git/starshipempire/server/src/main/resources/database/server.db",
          "-Dstarshipempire.shared.path=/home/bcampolo/git/starshipempire/shared",
          "-Dstarshipempire.mode.demo=False",
          "-Dstarshipempire.steam.api.url=https://partner.steam-api.com",
          "-Dstarshipempire.steam.api.microtxn.endpoint=ISteamMicroTxnSandbox",
          "-Dstarshipempire.steam.api.key=FA9A9256EEA6C8AB70C125A3449C0925",
          "-Dstarshipempire.steam.api.appid=1882170",
          "-Dstarshipempire.port=8080",
          "com.starshipempire.server.StarshipEmpireServer"
        }, {
          stdout_buffered = true,
          stderr_buffered = true
        })
      end
    end
  })
end)

-- Hutter
-- stop
keymap.set("n", "<leader>xx", function()
  vim.fn.jobstop(JOB_ID)
end)

-- start
keymap.set("n", "<leader>xh", function()
  -- kill existing server
  vim.fn.jobstop(JOB_ID)
  -- build jar using gradle
  vim.fn.jobstart({
    "sh",
    "/home/bcampolo/git/hutter/gradlew",
    "build"
  }, {
    stdout_buffered = true,
    -- on_stdout = function (_, data)
    --   if data then
    --     print(dump(data))
    --   end
    -- end,
    stderr_buffered = true,
    on_stderr = function (_, data)
      if data then
        print(dump(data))
      end
    end,
   -- if successful, then start server
    on_exit = function(_, data)
      if vim.api.nvim_get_vvar("shell_error") == 0 then
        JOB_ID = vim.fn.jobstart({
          "java",
          "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8001",
          "-cp",
          "/home/bcampolo/git/hutter/build/libs/hutter.jar:/home/bcampolo/git/hutter/build/libs/dependencies.jar",
          "-Xmx12g",
          "com.bcampolo.hutter.Hutter",
          "/home/bcampolo/git/hutter/data/enwik9-10"
        }, {
          stdout_buffered = true,
          stderr_buffered = true
        })
      end
    end
  })
end)


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

