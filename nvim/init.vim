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

"---------- APPEARANCE ----------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#whitespace#enabled = 0

" airline tabs
let g:airline#extensions#tabline#enabled = 1         
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'   
let g:airline#extensions#tabline#show_tab_count = 0 
let g:airline#extensions#tabline#show_buffers = 1    
let g:airline#extensions#tabline#tab_min_count = 2    
let g:airline#extensions#tabline#show_splits = 0       
let g:airline#extensions#tabline#show_tab_nr = 0        
let g:airline#extensions#tabline#show_tab_type = 0     

"---------- BASE PLUGINS ----------
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" snippets
Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
Plug 'grvcoelho/vim-javascript-snippets'

" typescript | javascript
Plug 'leafgarland/typescript-vim'

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

" jsx | tsx
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

nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" -------- MAPS --------

map nt <cmd>tabnew<cr>
map ct <cmd>tabclose<cr>

call plug#end()
