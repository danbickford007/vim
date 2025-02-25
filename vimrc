execute pathogen#infect()

packloadall
silent! helptags ALL

set viminfo="NONE"
filetype plugin indent on
syntax on

"auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" ctrlP get all files
" slower but gets em all
let g:ctrlp_max_files=0

"delete 20 buffers
" map xxx :1,20bd<cr>
nnoremap <F5> :GundoToggle<CR>
syntax on
setf pegjs
"execute "set colorcolumn=" . join(range(81,335), ',')
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set nowrap
set guifont=Monico
set hidden
map ,ln :set number<cr>
map ,nl :set nonumber<cr>
map ,t :w \|!rspec %<cr>
map ,<right> :bn<cr>
map ,<left> :bp<cr>
map ,a :Ack
map ,q :bd
map ,b :Gblame<cr>
map ,c :w \|!cucumber<cr>
map ct :checktime<cr>
map ,rtf :CopyRTF<cr>
map ,op :call VimuxRunCommand('
colorscheme void
:cd %:p:h
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
map ,fj %!python -m json.tool

" https://github.com/ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
map \t :CtrlP<cr>
let g:ctrlp_map = '\t'

autocmd FileType ruby compiler ruby
no ,w <C-w><C-w>
map ,s <C-w><C-v><C-w><C-w>
map ,c :w\|:!cucumber features<cr>
map ,n :NERDTree<cr>
imap <Nul> <ESC>
imap jk <ESC>
imap kj <ESC>
imap <C-h> <C-W>
map <C-n> :tabnext<cr>
map <C-p> :tabprevious<cr>
map <C-t> :tabnew<cr>
map <C-c> :tabclose<cr>
nmap n nzz
nmap N Nzz
vnoremap ,c :s/^/#<cr>
vnoremap ,u :s/^#//<cr>
no J 8j
no K 8k
"set winwidth=104
"set winheight=5
"set winminheight=5
"set winheight=999
set wildmode=longest,list
set wildmenu
set nu
set viminfo='100,<50,s10,h,:100
set modeline
set ls=2

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vmap <silent>gg :call VisualSearch('gv')<CR>
vmap <silent>gd :call VisualSearch('gd')<CR>
map cc <C-_><C-_>

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "Ack " . l:pattern
    elseif a:direction == 'gd'
        execute "Ack \"(def|function|class) " . l:pattern . "\""
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let g:syntastic_javascript_checkers = ['standard']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" allow backspace to delete old text
set backspace=indent,eol,start
