" dwayne's vim config

" START: plugins
" https://github.com/junegunn/vim-plug
call plug#begin()

" plugin: lightline
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" plugin: NERDTree
" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" plugin: minimalist (color scheme)
" https://github.com/dikiaap/minimalist
Plug 'dikiaap/minimalist'

" plugin: vim-javascript
" https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'

" plugin: vim-jsx-pretty
" https://github.com/maxmellon/vim-jsx-pretty
Plug 'maxmellon/vim-jsx-pretty'

" plugin: coc
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" plugin: fzf
" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" plugin: vim-prettier
" https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \}

" plugin: vim-better-whitespace
" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

" END: plugins
call plug#end()

" disable welcome message
set shortmess=I

" show line numbers
set number

" use 2 spaces for tabs
set tabstop=2
set shiftwidth=2
set expandtab

" syntax highlighting
syntax on

" colorscheme
:colorscheme minimalist

" support lightline
set laststatus=2
set noshowmode
if !has('gui_running')
  set t_co=256
endif
let g:lightline = {
  \  'colorscheme': 'wombat',
  \  'active': {
  \    'right': [ [ 'lineinfo' ],
  \               [ 'percent' ],
  \    ],
  \  },
  \}

" support coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
set hidden
set updatetime=300
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SiD>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

" support Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" support vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

