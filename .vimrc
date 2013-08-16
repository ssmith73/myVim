"Use pathogen
execute pathogen#infect()

syntax enable
filetype plugin indent on

" Highlight characters that are stretching out to the end of the screen beyond 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

"Switch between windows intuitively
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif


" Set utf8 as standard encoding and en_US as the standard
" language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"Turn on the ruler
if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

" I like highlighting strings inside C comments
let c_comment_strings=1
set showmode
set wildmenu

" Show line numbers
set number

set shiftwidth=2
set textwidth=76

"Setup colorscheme
if has("gui_running")
  set guifont=Monospace\ 9
  "set guifont=sans-serif\ 9
  colorscheme blacklight

endif

"allow to switch between buffers with the [ (prev) ] (next) keys"
nmap <leader>tl :tabn<CR>
nmap <leader>th :tabp<CR>


""Turn off the left and right scrollbars, as i don't use them
set guioptions-=L
set guioptions-=r
""Turn off the menu toolbar
set guioptions-=T

""keep the working directory with the open buffer
autocmd BufEnter * lcd %:p:h

""Automatically reload .vimrc when saved
au BufWritePost ~/.vimrc :source ~/.vimrc
""make it easy to reaload vimrc
nmap <leader>l :source ~/.vimrc
nmap <leader>e :e ~/.vimrc

""flash opposite bracket on insertion
set showmatch

"make all tabs appear as spaces
"to make all existing tabs in a file be converted to spaces :%retab!
set expandtab

"make the repeat work a bit better
nmap . .`[


"Ensure folds are saved and restored properly
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"""save marks
set viminfo='100,f1

"SOS chekin/checkout
nmap ,o:!soscmd co %<cr>
nmap ,i:!soscmd co %<cr>

"Search for word under curser in all files in current and subdirectories,
"open window with results
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"Have vi move just a single row over wrapped lines
:nmap j gj
:nmap k gk

"Ignore case in searches except when using caps
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

:au BufNewFile,BufRead *.v,*.vh,*.sv,*.svi set filetype=systemverilog

"Add a Custom header for verilog files
autocmd bufnewfile *.v,*.sv so /home/ssmith/.vim/v_header.txt
autocmd bufnewfile *.v,*.sv exe "1," . 10 . "g/FILE NAME :.*/s//FILE NAME : " .expand("%")
autocmd bufnewfile *.v,*.sv exe "1," . 10 . "g/CREATION DATE :.*/s//CREATION DATE : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.v,*.sv  execute "normal ma"
autocmd Bufwritepre,filewritepre *.v,*.sv  exe "1," . 10 . "g/LAST MODIFIED :.*/s/LAST MODIFIED :.*/LAST MODIFIED : " .strftime("%c")
autocmd bufwritepost,filewritepost *.v,*.sv  execute "normal `a"

