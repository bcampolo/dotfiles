SSE_SERVER_ID = 0
JOB_ID = 0
local P = {}
keymaps = P

-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk 
keymap.set("i", "ii", "<ESC>") -- exit insert mode with ii
keymap.set("i", "II", "<ESC><CapsLock>") -- exit insert mode with ii
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save

-- split window management
keymap.set("n", "<leader>nh", "nohl<CR>")
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>") -- make split windows width bigger 
keymap.set("n", "<leader>sh", "<C-w><") -- make split windows width smaller

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {})
keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
keymap.set('n', '<leader>fm', function() builtin.treesitter({default_text=":method:"}) end)

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
keymap.set("n", "<leader>ha", mark.add_file)
keymap.set("n", "<leader>hh", ui.toggle_quick_menu)
keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
keymap.set("n", "<leader>h5", function() ui.nav_file(5) end)
keymap.set("n", "<leader>h6", function() ui.nav_file(6) end)
keymap.set("n", "<leader>h7", function() ui.nav_file(7) end)
keymap.set("n", "<leader>h8", function() ui.nav_file(8) end)
keymap.set("n", "<leader>h9", function() ui.nav_file(9) end)

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- get token
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

-- get production token
keymap.set("n", "<leader>xp", function()
  -- kill existing process
  -- vim.fn.jobstop(MOCK_PROC_ID)
  -- build jar using gradle
  MOCK_PROC_ID = vim.fn.jobstart({
    "java",
    "-cp",
    "/home/a0msfzz/git/gpcs-gpcs-104/gpcs/mock/build/libs/gpcsTestClient.jar",
    "-Xmx1g",
    "com.mmmhis.gpcs.mock.GpcsTestClient",
    "-sts_address", "https://gpcs.soa-pr.aws.3mhis.net/GpcsSts/oauth/token",
    "-clientkey", "/home/a0msfzz/Downloads/2870159_3MHealthInformationSystems_Cert-PR.jks",
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

-- Java LSP - jdtls
function P.map_java_keys(bufnr)
  map_lsp_keys()
  -- keymap.set("n", "<leader>ew", ":lua require('jdtls').organize_imports()<CR>")
end

