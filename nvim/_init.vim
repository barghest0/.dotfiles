set nocompatible
set number
set encoding=utf-8
set title
set noswapfile
set relativenumber
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
set shiftwidth=2
set tabstop=2
set ai 
set si 
set nowrap 
set backspace=start,eol,indent
set path+=**
set wildignore+=*/node_modules/*
set formatoptions+=r
set filetype=typescript.tsx

filetype plugin indent on
autocmd InsertLeave * set nopaste

syntax enable

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
Plug 'numToStr/Comment.nvim'
Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'ryanoasis/vim-devicons'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs' 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'declancm/cinnamon.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'rmagatti/goto-preview'
" Plug 'romgrk/barbar.nvim'


" nerd tree
Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



" git
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

Plug 'f-person/git-blame.nvim'
let g:gitblame_enabled = 0


" react
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


" snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-x>"


" pug
Plug 'digitaltoad/vim-pug'


" prettier
Plug 'prettier/vim-prettier', {
  \'do': 'yarn install --frozen-lockfile --production',
  \ }

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"---- if auto prettier need ------
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

" coc 
Plug 'neoclide/coc.nvim', {'branch': 'release','do': 'yarn install --frozen-lockfile'}

nmap <leader>da <Plug>(coc-codeaction)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <silent>K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:coc_global_extensions = [
		\'coc-tsserver',
		\'coc-eslint',
		\'coc-json',
\	]



" telescope 
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'


nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fs <cmd>Telescope grep_string find_command=rg,--ignore="node_modules,yarn.log,package.json.lock",--hidden,--files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep find_command=rg,--ignore="node_modules,yarn.log,package.json.lock",--hidden,--files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

call plug#end()


" --------- LUA SETUPS ----------

lua << EOF
  require('Comment').setup()
  require('cinnamon').setup()
  require('notify')
  require('goto-preview').setup {
    width = 120; -- Width of the floating window
    height = 15; -- Height of the floating window
    border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
    default_mappings = false; -- Bind default mappings
    debug = false; -- Print debug information
    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
    post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
    focus_on_open = true; -- Focus the floating window when opening it.
    dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
    force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
    bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
  }
EOF

" -------- MAPS --------
" tabs
map nt <cmd>tabnew<cr>
map ct <cmd>tabclose<cr>

nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>

" git 
map gbd <cmd>:GitBlameDisable<cr>
map gbe <cmd>:GitBlameEnable<cr>
map giti <cmd>:LazyGit<cr>

" tagbar
map tb <cmd>:TagbarToggle<CR>

" regexp
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" auto-completion
inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

" delete without copy
nnoremap <leader>d "_d


