set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'embear/vim-uncrustify'
Plug 'jason0x43/vim-js-indent'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'

Plug 'jeffkreeftmeijer/vim-dim'

Plug 'w0rp/ale'

call plug#end()
filetype plugin indent on

" Make it pretty!
syntax enable
set t_Co=256
colo dim

" ALE
let g:ale_sign_error = '->'
let g:ale_sign_warning = '->'
hi! ALEError ctermfg=9 ctermbg=15 cterm=reverse,bold
hi! ALEErrorSign ctermfg=15 ctermbg=9 cterm=bold
hi! ALEWarning ctermfg=none ctermbg=none cterm=underline
hi! ALEWarningSign ctermfg=15 ctermbg=1 cterm=none
hi! SignColumn ctermbg=7

" Built in Vim settings.
set expandtab
set fillchars+=vert:│
set grepprg=rg\ --vimgrep
set hlsearch
set ignorecase
set lazyredraw
set list listchars=tab:→\ ,trail:\ "
set nobackup
set noerrorbells visualbell t_vb=
set noswapfile
set nonumber
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

" Uncrustify
autocmd BufWritePre *.c call Uncrustify()

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

" Pane navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Tab navigation
nnoremap <leader><tab> :tabn<cr>
nnoremap <leader><s-tab> :tabp<cr>

" Clear search.
nnoremap <leader>/ :let @/=""<cr>

" FZF support!
nnoremap <leader><leader> :FZF<cr>

" Use Ale to x-plain what's under the cursor.
nnoremap <leader>x :ALEHover<cr>

" Test running! I promise I'll do something more sensible at some point.
nnoremap <leader>t :!clear; bundle exec rspec %<cr>

" Ruby
nnoremap <leader>r :!clear; bundle exec ./%<cr>
nnoremap <leader>f :!clear; bundle exec standardrb %<cr>

" Gem search
function! GemSearch()
  call fzf#run(fzf#wrap({'source': "bundle list | sed '1d;$d' | cut -d ' ' -f 4", 'sink': {gem -> GemFileSearch(gem)}}))
endfunction

function! GemFileSearch(gem)
  let gemdir = substitute(system("bundle info --path " . a:gem), '\n\+$', '', '')
  call fzf#run(fzf#wrap({'source': 'rg --files ' . gemdir . ' --color never | sed -e "s#^' . gemdir . '/##"', 'dir': gemdir}))
endfunction

nnoremap <leader>gf :call GemSearch()<cr>

" Default search colours in base16 are really bad:
hi Search cterm=NONE ctermfg=black ctermbg=blue
hi IncSearch cterm=NONE ctermfg=black ctermbg=red

function! SynStack ()
  for i1 in synstack(line("."), col("."))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, "name")
    let n2 = synIDattr(i2, "name")
    echo n1 "->" n2
  endfor
endfunction
nnoremap <leader>s :call SynStack()<CR>
