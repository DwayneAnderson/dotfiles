" https://github.com/junegunn/vim-plug
call plug#begin()

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" https://github.com/dikiaap/minimalist
Plug 'dikiaap/minimalist'

" JS syntax highlighing
Plug 'pangloss/vim-javascript'

" JSX syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" line numbers
:set number

" use 2 spaces for TAB 
:set tabstop=2 
:set shiftwidth=2 
:set expandtab 

" syntax highlighting
syntax on

" color scheme
":colorscheme darkblue
:colorscheme minimalist

" these were needed to get Lightline working
" https://github.com/itchyny/lightline.vim
:set noshowmode
:set laststatus=2
if !has('gui_running')
  :set t_co=256
endif

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\   ]
\ },
\ 'component': {
\   'helloworld': 'Hello, world!'
\ },
\ }
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
:set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
:set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
