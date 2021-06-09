set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'

call plug#end()
filetype plugin indent on

syntax enable

" Enable True Color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set termguicolors

" Make it pretty
set background=light
colo gruvbox

hi Search cterm=none guifg=#3c3836 guibg=#ebdbb2
hi IncSearch cterm=none guifg=#fbf1c7 guibg=#3c3836
hi Visual cterm=none guifg=#fbf1c7 guibg=#458588

" Highlight text over 100 chars wide
hi OverLength guibg=NONE guifg=#af3a03
match OverLength /\%101v.*/

" ALE
let g:ale_sign_error = '->'
let g:ale_sign_warning = '->'

" Built in Vim settings.
set expandtab
set fillchars+=vert:│
set grepprg=rg\ --vimgrep
set hlsearch
set ignorecase
set lazyredraw
set list listchars=tab:→\ ,trail:\•"
set nobackup
set noerrorbells visualbell t_vb=
set nonumber
set noswapfile
set scrolljump=15
set shell=$SHELL
set shiftwidth=2
set shortmess=atI
set smartcase
set softtabstop=2
set splitbelow
set splitright
set timeoutlen=1000 ttimeoutlen=0
set ttyfast
set wildmode=list:longest,list:full
set wrap

" ALE, chill out
let g:ale_linters = {'ruby': ['standardrb']}
let g:ale_fixers = {'ruby': ['standardrb']}

let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = get(g:, 'ale_sign_error', '!!')
let g:ale_sign_info = get(g:, 'ale_sign_info', '++')
let g:ale_sign_style_error = get(g:, 'ale_sign_style_error', '??')
let g:ale_sign_style_warning = get(g:, 'ale_sign_style_warning', '??')
let g:ale_sign_warning = get(g:, 'ale_sign_warning', '--')

" Use ripgrep when available.
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Distribute windows when resize happens.
au VimResized * :wincmd =

" Changes cursor while in insert mode.
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" The final frontier.
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" Disable things I accidentally do.
nnoremap K \<noop>
vnoremap K \<noop>
nnoremap <c-w>o \<noop>
vnoremap <c-w>o \<noop>

" Clear search.
nnoremap <leader>/ :let @/=""<cr>

" FZF support!
nnoremap <leader><leader> :FZF<cr>

" Use Ale to x-plain what's under the cursor.
nnoremap <leader>x :ALEHover<cr>

" Dispatch
nnoremap <leader>d :Dispatch<cr>
nnoremap <leader>f :Dispatch bundle exec standardrb --fix %<cr>

" Gem search
function! GemSearch()
  call fzf#run(fzf#wrap({'source': "bundle list | sed '1d;$d' | cut -d ' ' -f 4", 'sink': {gem -> GemFileSearch(gem)}}))
endfunction

function! GemFileSearch(gem)
  let gemdir = substitute(system("bundle info --path " . a:gem), '\n\+$', '', '')
  call fzf#run(fzf#wrap({'source': 'rg --files ' . gemdir . ' --color never | sed -e "s#^' . gemdir . '/##"', 'dir': gemdir}))
endfunction

nnoremap <leader>gf :call GemSearch()<cr>

function! SynStack ()
  for i1 in synstack(line("."), col("."))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, "name")
    let n2 = synIDattr(i2, "name")
    echo n1 "->" n2
  endfor
endfunction
nnoremap <leader>s :call SynStack()<CR>
