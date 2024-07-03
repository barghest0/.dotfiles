vim.opt.termguicolors = true

function setColor(color)
	color = color or "tokyonight-storm"
	vim.cmd.colorscheme(color)
end

setColor()
