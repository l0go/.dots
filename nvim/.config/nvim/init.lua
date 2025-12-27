require "plugins"
require "luaexec"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.number = true
vim.keymap.set("n", "<leader>rn", function () vim.lsp.buf.rename() end, {silent = true})
vim.cmd.colorscheme("gruber-darker")

-- LSP
vim.lsp.enable({'haxe_language_server', 'lua_ls', 'rust_analyzer'})
vim.diagnostic.config({ virtual_lines = true })
