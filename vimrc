"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

"load pathogen managed plugins
call pathogen#infect()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set noshowmode  "do not show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"add some line space for easy reading
set linespace=4

"disable visual bell
set noeb vb t_vb=

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l

"turn off needless toolbar on gvim/mvim
set guioptions-=T
"turn off the scroll bar
set guioptions-=L
set guioptions-=r

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  colorscheme wombat
  set guitablabel=%M%t
  set lines=40
  set columns=115

  if has("gui_gnome")
      set term=gnome-256color
        colorscheme railscasts
        set guifont=Menlo\ 10
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h12
        set transparency=5
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaDed = 1

    "remove unicode arrows from nerdtree
    let g:NERDTreeDirArrows=0

    "try to set a colorful terminal no matter where
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
    else
        set term=xterm-256color
    endif

    "railscasts is great with a non gui
    colorscheme railscasts
endif

" gist-vim configuration
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" prepare statusline for airline
set laststatus=2

"removing idiot airline separators
let g:airline_left_sep=''
let g:airline_right_sep=''

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" when press { + Enter, the {} block will expand.
imap {<CR> {}<ESC>i<CR><ESC>O

" NERDTree settings
nmap wm :NERDTree<cr>
let NERDTreeIgnore=['\.swp$']

"set <leader>p to open up NERDTree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"set <leader>b to open up BufExplorer
nnoremap <leader>b :BufExplorer<cr>

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"find the median of the given array of numbers
function! s:Median(nums)
   let nums = sort(a:nums)
   let l = len(nums)

   if l % 2 == 1
       let i = (l-1) / 2
       return nums[i]
   else
       return (nums[l/2] + nums[(l/2)-1]) / 2
   endif
endfunction

if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=node_modules/*
set wildignore+=vendor/bundle/*
set wildignore+=vendor/gems/*
set wildignore+=vendor/gem/*
set wildignore+=vendor/cache/*
set wildignore+=tmp/*

"display tabs and trailing spaces
set list
set listchars=tab:\ \ ,extends:>,precedes:<

" disabling list because it interferes with soft wrap
set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"Activate smartcase
set ic
set smartcase

"make <c-z> clear the highlight as well as redraw
nnoremap <C-Z> :nohls<CR><C-Z>
inoremap <C-Z> <C-O>:nohls<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"visual search mappings
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
   let targetWidth = a:width != '' ? a:width : 79
   if targetWidth > 0
       exec 'match Todo /\%>' . (targetWidth) . 'v/'
   else
       echomsg "Usage: HighlightLongLines [natural number]"
   endif
endfunction

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"key mapping for saving file
nmap <C-s> :w<CR>

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

if has("balloon_eval")
  set noballooneval
endif
