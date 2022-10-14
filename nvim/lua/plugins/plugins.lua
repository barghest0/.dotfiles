vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap = true})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'
  use 'ap/vim-css-color'
  use 'matze/vim-move'
  use 'ryanoasis/vim-devicons'
  use 'alvan/vim-closetag'
  use 'jiangmiao/auto-pairs' 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'preservim/tagbar'
  use 'pangloss/vim-javascript'
  use 'declancm/cinnamon.nvim'
  use 'rcarriga/nvim-notify'
  use 'rmagatti/goto-preview'
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'
  use 'airblade/vim-gitgutter'
  use 'SirVer/ultisnips'
  use 'mlaursen/vim-react-snippets'
  use 'honza/vim-snippets'
  use 'digitaltoad/vim-pug'
  use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'}
  use {'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'preservim/nerdtree'
end)



