set number relativenumber
set linebreak	" Break lines at word (requires Wrap lines)
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
 
set hlsearch	" Highlight all search results
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
 autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

autocmd Filetype rmd map <F7> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd Filetype rmd map ,c o```{c eval=FALSE}<enter><enter>```<Up>
"make and git shortcuts 
autocmd Filetype c map <F7> :!make<enter>
map ,ga :Gcommit -a -m changes<enter>
map ,gp :Gpush<enter>

map <space><space> :NERDTree<enter>

call plug#begin()
Plug '907th/vim-auto-save'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'vim-IDE/vim-fugitive' "git wrapper
Plug 'vim-IDE/c.vim' "c ide
Plug 'junegunn/vim-easy-align' 
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'universal-ctags/ctags'
Plug 'joom/latex-unicoder.vim'
Plug 'vim-scripts/unilatex.vim'
call plug#end()

let g:auto_save = 1
syntax enable
colorscheme gruvbox
set background=dark
let g:gruvbox_termcolors = '256'
let g:gruvbox_bold = '1'
let g:gruvbox_contrast_dark = 'hard'

"c.vim plugin
"
let g:C_UseTool_cmake   = 'no'
let g:C_UseTool_doxygen = 'yes'

" By default, cvim insert a header when opening a filetype supported.
" If it set to 0, it doesn't insert it. If it's set to 1, it inserts the header.
let g:C_insert_header   = 1
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction

set backspace=indent,eol,start
