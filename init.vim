set ruler
set hlsearch
set incsearch
set ignorecase smartcase
set number
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing
set foldmethod=syntax

" Enable cursor line position tracking
set cursorline
highlight clear CursorLine

let mapleader=","
noremap \ ,

set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set cinoptions=(0

" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" Mapping to toggle line numbers
nnoremap <silent> <leader>n :set nu!<CR>
nnoremap <silent> <leader>r :set relativenumber!<CR>
" nnoremap <silent> <leader>r :set relativenumber! <bar> set nu!<CR>

" Open a file in readonly mode if it already has a swapfile
autocmd SwapExists * let v:swapchoice = "o"

" Disable continuation of comments to the next line
autocmd FileType * set formatoptions-=cro

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set backup
" mkdir -p ~/.vim/backup
set backupdir=~/.vim/backup//
" mkdir -p ~/.vim/swapfiles
set directory=~/.vim/swapfiles//

" autocomplete braces
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Format code file using astyle with "="
fun! CPPFormatSettings()
  " astyle options:
  " --style=1tbs --indent=spaces=4 --break-blocks --pad-oper --pad-comma
  " --pad-header --unpad-paren --delete-empty-lines --align-pointer=type
  " --align-reference=name --attach-return-type --attach-return-type-decl
  " set equalprg=astyle\ -A10 -s4 -fp -xg -H -U -xe  -k1 -W3 -xf -xh

  " setlocal equalprg=clang-format\ -style=google
  " setlocal equalprg=astyle\ -A10s4fpxgHUxek1W3xfxh
  setlocal equalprg=astyle\ -A10s4fpxgHUk1W3xfxh " remove delete empty lines
endfun
autocmd FileType c,cpp,h,hpp call CPPFormatSettings()

" force write on read-only files
cmap w!! w !sudo tee > /dev/null %
cnoremap sudow w !sudo tee % >/dev/null

" Use vim-plug
" Make sure you use single quotes
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/autotags'
Plug 'chazy/cscope_maps'
Plug 'mg979/vim-visual-multi'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'pseewald/vim-anyfold'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/a.vim'
" Plug 'derekwyatt/vim-fswitch'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

filetype plugin indent on " required
syntax on                 " required

" Set up vim-airline
set laststatus=2
set t_Co=256
set noshowmode
set ambiwidth=double
let g:airline_section_y=''
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" Vim Better Whitespace
" let g:better_whitespace_enabled=1
let g:strip_whitelines_at_eof=1
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
map <F2> :StripWhitespace<CR>
map! <F2> :StripWhitespace<CR>

" vim-commentary
autocmd FileType cfg setlocal commentstring=#\ %s
autocmd FileType c,cpp setlocal commentstring=//\ %s

" Nerdtree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc', '\.pyo', '\.swp', '\~']
let NERDTreeQuitOnOpen=1

" Tagbar
nnoremap <Leader>tl :TagbarToggle<CR>
let g:tagbar_width = 32 " tagbar's width, default 20
let g:tagbar_right = 1  " on the right side

" Cscope
" Maps ctrl-c to find functions calling the function in cscope
nnoremap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>

" Autotags
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaS --extra=+q --extra=+f"

" Fold
autocmd Filetype * AnyFoldActivate
set foldlevel=99 " Open all folds

" Paste mode
" https://stackoverflow.com/a/38258720
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
