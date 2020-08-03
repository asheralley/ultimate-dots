syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set autowriteall
set incsearch
set cursorline
set termguicolors
set splitbelow
set splitright
set clipboard=unnamedplus

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'mlaursen/vim-react-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/matchtagalways'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'


call plug#end()

" ============================================================================
" Colorscheme config
" ============================================================================

colorscheme onedark

"let g:gruvbox_contrast_dark = 'hard'

"if exists('+termguicolors')
"  let &t_8f = 
  "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = 
  "\<Esc>[48;2;%lu;%lu;%lum"
"endif
"let g:gruvbox_invert_selection='0'
"colorscheme gruvbox
"set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

"let g:netrw_browse_split = 2
"let g:vrfr_rg = 'true'
"let g:netrw_banner = 0
"let g:netrw_winsize = 25

" vim-javascript configuration
let g:javascript_plugin_jsdoc = 1

" ============================================================================
" Sane split navigation
" ============================================================================
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" clear highlighted search results
nnoremap <leader>\ :noh<CR>

" open undotree this is pretty amazing too
nnoremap <leader>u :UndotreeShow<CR>

" open netrw
" nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" open nerdtree
map <leader>pv :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" ============================================================================
" Emmet setup
" ============================================================================
let g:user_emmet_leader_key='<C-e>'

" ============================================================================
" Exploring files
" ============================================================================
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>t :Buffers<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" open vim config file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

"resizing splits
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" this is for moving lines up and down when highlighted !AMAZING!
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" mapping for deleting a line when highlighted
vnoremap X "_d

" exiting out of insert mode
" inoremap <C-c> <esc>
" inoremap jk <esc>


" ============================================================================
" COC settings
" ============================================================================
set updatetime=300

let g:coc_global_extensions=[
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-html',
      \ 'coc-scssmodules',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-tsserver'
      \ ]


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <buffer> <leader>gd <Plug>(coc-definition)
nmap <buffer> <leader>gy <Plug>(coc-type-definition)
nmap <buffer> <leader>gi <Plug>(coc-implementation)
nmap <buffer> <leader>gr <Plug>(coc-references)
nmap <buffer> <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <buffer> <leader>cr :CocRestart

" for snippets
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" ============================================================================
" Integrated Terminal
" ============================================================================

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <C-\> :call OpenTerminal()<CR>



" ============================================================================
" Prettier config
" ============================================================================

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 4

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
let g:prettier#config#html_whitespace_sensitivity = 'css'

nmap <leader>ff <Plug>(Prettier)

" ============================================================================
" Ariline statusline
" ============================================================================
" Add bufferline to section b
" let g:airline_section_b = '[%n]'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#formatter = 'unique_tail'

" let g:airline_statusline_ontop=1

" Custom Status Line
" Git function 
"function! GitBranch()
"  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"
"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction
"
"set laststatus=2
"set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=\ [%n]\ 
""set statusline+=%#PmenuSel#
"set statusline+=\[%F]\ 
""set statusline+=\ %f\ 
"set statusline+=%#DiffAdd#
"set statusline+=%m
"set statusline+=%{StatuslineGit()}%*
""set statusline+=%#CursorColumn#
"set statusline+=%=
"set statusline+=%#PmenuSel#

"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
