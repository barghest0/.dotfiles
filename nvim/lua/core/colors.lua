vim.opt.termguicolors = true

function setColor(color)
  color = color or "tokyonight-night"
  vim.cmd.colorscheme(color)
end

setColor()
