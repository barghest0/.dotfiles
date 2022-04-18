set nocompatible
set number
syntax enable
set encoding=utf-8
set title
set autoindent
set background=dark
set completeopt=menuone,noinsert,noselect
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set encoding=UTF-8
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set nosc noru nosm
set lazyredraw
set ignorecase
set smarttab
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai 
set si 
set nowrap 
set backspace=start,eol,indent
set path+=**
set wildignore+=*/node_modules/*
autocmd InsertLeave * set nopaste
set formatoptions+=r

call plug#begin()


"---------- APPEARANCE ----------
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#whitespace#enabled = 0



" airline tabs
let g:airline#extensions#tabline#enabled = 1           
let g:airline#extensions#tabline#show_close_button = 0 
let g:airline#extensions#tabline#tabs_label = ''       
let g:airline#extensions#tabline#buffers_label = ''    
let g:airline#extensions#tabline#fnamemod = ':t'       
let g:airline#extensions#tabline#show_tab_count = 0    
let g:airline#extensions#tabline#show_buffers = 0      
let g:airline#extensions#tabline#tab_min_count = 2     
let g:airline#extensions#tabline#show_splits = 0       
let g:airline#extensions#tabline#show_tab_nr = 0       
let g:airline#extensions#tabline#show_tab_type = 0     





"---------- BASE PLUGINS ----------
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'ryanoasis/vim-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }



" nerd tree
Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'



" react
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-x>"



" prettier
Plug 'prettier/vim-prettier', {
  \'do': 'yarn install --frozen-lockfile --production',
  \ }

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"---- if auto prettier need ------
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync




" coc 
Plug 'neoclide/coc.nvim', {'branch': 'master','do': 'yarn install --frozen-lockfile'}

let g:coc_global_extensions = [
		\'coc-tsserver',
\	]





" telescope 
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

call plug#end()

" -------- MAPS --------
map nt <cmd>tabnew<cr>
map ct <cmd>tabclose<cr>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
inoremap <expr> <Tab> pumvisible() ? "\<C-x>" : "\<Tab>"

