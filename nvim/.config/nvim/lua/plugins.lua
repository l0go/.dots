local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Language Support
	"kLabz/haxe.vim",
	-- LSP
	{
		'saghen/blink.cmp',
		version = '1.*',
		opts = {
			completion = {
				documentation = { auto_show = true },
				trigger = { show_on_trigger_character = true },
			},
		},
		opts_extend = { "sources.default" }
	},
	-- Color Schemes
	"blazkowolf/gruber-darker.nvim",
})
