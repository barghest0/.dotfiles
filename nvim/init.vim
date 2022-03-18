:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set noswapfile
:set ma 
:set encoding=UTF-8
:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

call plug#begin()

" appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='atomic'

" base plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

Plug 'leafgarland/typescript-vim'

Plug 'MaxMEllon/vim-jsx-pretty'

" prettier config
Plug 'prettier/vim-prettier', {
  \'do': 'yarn install --frozen-lockfile --production',
  \ }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"---- will know this later ------
" let g:prettier#autoformat_config_present = 1 
" let g:prettier#autoformat_config_files = ['.prettierrc']
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync


" coc config 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
		\'coc-tsserver',
		\'coc-eslint'
\	]






" telescope config
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

call plug#end()
