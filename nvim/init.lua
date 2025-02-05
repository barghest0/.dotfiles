local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

require("shared.remaps")
require("shared.options")

vim.g.copilot_proxy = "http://uvv44a:zXS34C@168.80.81.53:8000"

-- Или через переменные окружения:
vim.env.HTTPS_PROXY = "http://uvv44a:zXS34C@168.80.81.53:8000"
vim.env.HTTP_PROXY = "http://uvv44a:zXS34C@168.80.81.53:8000"

vim.cmd("colorscheme tokyonight-night")
vim.cmd("hi IlluminatedWordText guibg=none gui=underline")
vim.cmd("hi IlluminatedWordRead guibg=none gui=underline")
vim.cmd("hi IlluminatedWordWrite guibg=none gui=underline")
