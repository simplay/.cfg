" Stuff you could forget and will regret
" r refresh NerdTree
" R refresh NerdTree
" Normal mode <Leader>__ toggle comment current line
" Visual mode: 
" comment/uncomment: selection + gc
" surround selection by pattern
"   :s/.*/"&" will surround visual selection by \" \"
" Within a rails app, use gf to lookup file
" Surround <V>S<PATTERN> 
" alternative: ciw<PATTERN><ESC>P
" find all occurrances of word at cursor position: * (*|#)
"
" Manipulate splits
" <C-w> = Make splits evenly sized
" <C-w> R swap left-right splits
" <C-w> o close all but this split
" <C-w> | zoom current window
" 
" handy leader commands:
"   A, S, s, K
" handy control commands:
" e,y F,B
" handy general movements
" #, %

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" colorscheme
Plug 'dracula/vim'

" file explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" useful defaults: backspace, insearch, listchars, scrolloff, runtime! matchit
Plug 'tpope/vim-sensible'

" syntax checking plugin
Plug 'scrooloose/syntastic'

" Enahnce statusline/tabls in vim
Plug 'vim-airline/vim-airline'

" git wrapper
Plug 'tpope/vim-fugitive'

" fuzzy finder
Plug 'kien/ctrlp.vim'

" replace surroundings with another: 
"  Press cs*' inside' *Hello world!* to change it to 'Hello world!'
Plug 'tpope/vim-surround'

" auto close surroundings (parentheses,brackets, quetes...)
Plug 'Raimondi/delimitMate'

" (Un)Comment code
Plug 'tomtom/tcomment_vim'

" configuration to edite and compile ruby files
Plug 'vim-ruby/vim-ruby'

" rails utils
Plug 'tpope/vim-rails'

" autocompletion of ruby do/begin/if-end blocks
Plug 'tpope/vim-endwise'

" highlighting match of matchit.vim.
Plug 'vimtaku/hl_matchit.vim'

" Management of tags files in Vim
" Browse into functions vis <c-!>
Plug 'ludovicchabant/vim-gutentags'

" snippet aliases
Plug 'SirVer/ultisnips'

" series of pre-defined snippets
Plug 'honza/vim-snippets'

" Use Ag to search via ctrlP
Plug 'rking/ag.vim'

" Navigation, rails specific highlighting, rails interface
" :help rails-rake
Plug 'tpope/vim-rails'

" javascript syntax highligting and improved indentation
Plug 'pangloss/vim-javascript'

" Syntax for JavaScript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Haml, Sass, SCSS syntax files
Plug 'tpope/vim-haml'

" displaying thin vertical lines at each indentation level for code indented
" with spaces
Plug 'Yggdroot/indentLine'

" browse the tags of a file and get an overview of its structure
Plug 'majutsushi/tagbar'

" search and navigate Ruby library and gem documentation inside Vim
" controlls: <Leader>r toggle horizontal search bar
" requires a preliminarly run: `rvm docs generate-ri`
Plug 'danchoi/ri.vim'

" Write files into directories that do not exist yet (and create them)
Plug 'DataWraith/auto_mkdir'

" move lines and selections up and down
Plug 'matze/vim-move'

" improved search , substitution, and abbreviations of words
" Substitude (reminder)
"   flags = [g,c,i,I]
"   :s/a/b/   replace first occurance of a by b in current line
"   :s/a/b/g  replace in current line every occurance of a by b
"   :%s/a/b/  replace in every line the first a occurance by b
"   :%s/a/b/g replace every a by b
" Subvert
"   :[range]S/target/replacement/[flags]
"   facility -> building & facilities -> buildings
"   :%S/facilit{y,ies}/building{,s}/gc
Plug 'tpope/vim-abolish'

" Ruby refactoring tool
" Default Mappings
"   :nnoremap <leader>rap  :RAddParameter<cr>
"   :nnoremap <leader>rcpc :RConvertPostConditional<cr>
"   :nnoremap <leader>rel  :RExtractLet<cr>
"   :vnoremap <leader>rec  :RExtractConstant<cr>
"   :vnoremap <leader>relv :RExtractLocalVariable<cr>
"   :nnoremap <leader>rit  :RInlineTemp<cr>
"   :vnoremap <leader>rrlv :RRenameLocalVariable<cr>
"   :vnoremap <leader>rriv :RRenameInstanceVariable<cr>
"   :vnoremap <leader>rem  :RExtractMethod<cr>
Plug 'ecomba/vim-ruby-refactoring'

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'

" Semantic code completion
Plug 'Valloric/YouCompleteMe'

" Javascript autocompletion dependency
Plug 'ternjs/tern_for_vim'

" Enhanced javascript syntax file for Vim
Plug 'jelera/vim-javascript-syntax'

" wrapper for running tests
Plug 'janko-m/vim-test'

" endplug
call plug#end()

syntax on
filetype plugin indent on    " required
set t_Co=256
colorscheme dracula


" No backups
set noswapfile
set nobackup
set nowritebackup

" Encoding and stuff
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix

" Smart indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Scrolling Behavoir
set scrolloff=5       " Keep the cursor 5 lines from the top and bottom
set sidescrolloff=5   " Keep the cursor 5 lines from the left
set sidescroll=1

" pretty folding with indentations
" folding using:
"   toggle: zi
"   fold current lvl: zc
"   view current folding: zv
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" disable beep sounds
set visualbell
set noerrorbells

set number
set laststatus=2

" lookup of ctags
" With the following setting, Vim will search for the file named 'tags', starting with 
" the directory of the current file and then going to the parent directory and then recursively 
" to the directory one level above. In the current directory ("tags,./tags"), 
" or in the directory of the current file ("./tags,tags").
set tags=./tags;
set autochdir

" determine correct loaded ruby version since we use rvm
let g:ruby_path='/usr/bin/ruby'

" Use system clipboard
" is different for MacOSX and Ubuntu
set clipboard=unnamedplus
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard=unnamed
  endif
endif

" show current line and col in status bar
set ruler
set nostartofline

" refresh every unchanded file
setl autoread

" Show matches while typing
set incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set showmatch
set ignorecase
set smartcase

" highlight all search matches
set hlsearch
hi Search ctermfg=17 ctermbg=228 cterm=NONE guifg=#282a36 guibg=#f1fa8c gui=NONE

set backspace=indent,eol,start

set lazyredraw
set ttyfast

" show filename in status bar
set title

" Do not show vim welcome msg
set shortmess=atI

" adapt statusline using syntastic and fugative (git)
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ignore files in control P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" ubuntu required setup to enable powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256

" powerline setup to have nice airline fonts
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Open new split panes to right and bottom
set splitbelow
set splitright

" Instead of failing a command because of unsaved changes, raise a
" dialogue asking if you wish to save changed files.
set confirm

" opening a new file when the current buffer has unsaved 
" changes causes files to be hidden instead of closed
" Unsaved changes can still be accessed by typing :ls and then :b[N]
set hidden

set tags=./tags;,tags;

" Move visual selections: prefixed by ctrl
" <C-k>   Move current line/selections up
" <C-j>   Move current line/selections down
let g:move_key_modifier = 'C'

let g:airline_powerline_fonts = 1

" configure syntastic plugin
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {
  \ "!level": "errors",
  \ "type": "style" }

"Redefine finder via controlP: Use silversearcher (ag) and git
let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore ".git" --ignore "doc" --ignore "app/assets/images" --ignore "public" -g ""'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\|data\|log\|features$\|grouper$\|code-lists$\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
\ }

let mapleader="\<Space>"
" set local working directory: neared ancestor that contains .git and the
" directoy of the current file
let g:ctrlp_working_path_mode = 'ra'

" Usage of snippets
let g:UltiSnipsExpandTrigger='§'
let g:UltiSnipsJumpForwardTrigger='§n'
let g:UltiSnipsJumpBackwardTrigger='§p'

" javascript plugin
let g:javascript_plugin_jsdoc = 1

" disable default mappings of danchoi/ri.vim
let g:ri_no_mappings=1

" Autocompletion Ctrl-X Ctrl-U
" vim's omni code completion instead
let g:EclimCompletionMethod = 'omnifunc'

" enable tern keyboard shortcuts
" See help tern 
let g:tern_map_keys=1

" show type argument hint of js when cursor is left over a function
let g:tern_show_argument_hints='on_hold'

" let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py"
" Use ycm completer will collect identifers from tag files
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings  = 1

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

" determine correct loaded ruby version since we use rvm
let g:ruby_path='/usr/bin/ruby'

"MAPPINGS

" Presever forward jumping behavior <ctrl-i>
" <tab> gets remapped by several plugins
nnoremap ,i <C-I>

" toggle nerd tree
noremap <C-n> :NERDTreeToggle<CR>

" Disable arrow-keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Open vimrc file
noremap <Leader>H :e $MYVIMRC <CR>

" jump to tab on the right
nnoremap <tab> <c-w>w

" jum to tab on the left
nnoremap <S-tab> <c-w>W

" toggle git blame
noremap <Leader>b :Gblame <CR>

" Search for word under cursor
nnoremap K :Ag! "<C-R><C-W>"<CR>

" Search buffer
noremap <Leader>p :CtrlPBuffer<CR>
" " Browse Tags in current buffer
noremap <Leader>t :CtrlPBufTag<CR>
" " Browse Tags
noremap <Leader>T :CtrlPTag<CR>
" " Search models
noremap <Leader>m :Emodel<space>"

" Toggle tagbar
nnoremap <F8> :TagbarToggle<CR>

" Change color of visual mode highlighting
hi Visual   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white

" Enable pretty line highlighting via <LEADER-c>
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! <CR>

" Clean file
noremap <leader>C :%s/\s\+$// <CR>

" leave insert mode by pressing jj
inoremap jj <Esc>

" Adjust size of vertical splits.
" To make windows again evenly sized, type `ctrl-w =`
noremap <leader>l :vertical resize +5<CR>
noremap <leader>h :vertical resize -5<CR>

" Browse model, controller and view files
noremap <Leader>8 :vs<CR>:Emodel. <CR>
noremap <Leader>9 :vs<CR>:Econtroller. <CR>
noremap <Leader>0 :vs<CR>:Eview. <CR>

" search for visually selected text:
" select text block and then press //
vnoremap // y/<C-R>"<CR>

" Unbind mappings
noremap r <NOP>

" horizontal split
nnoremap  <Leader>R :call ri#OpenSearchPrompt(0)<CR>
" keyword lookup
nnoremap  <Leader>RK :call ri#LookupNameUnderCursor()<CR> 

" Search file
noremap <leader>s :%s/
" Subvert
noremap <leader>S :%Subvert/

" Search globally
noremap <leader>a :Ag!<space>

" Shell commands
noremap <leader>, :!

" Interpret and execute the current line as a shell command
" and replace current line by output.
noremap Q !!sh<CR>

" delete nested blocks
noremap <Leader>nd :normal! [{mm%d'm}]<CR>

" Import the class under the cursor with <leader>i (:h mapleader):
nnoremap <silent> <buffer> <leader>ji :JavaImport<cr>

" Search for the javadocs of the element under the cursor with <leader>d.
nnoremap <silent> <buffer> <leader>jd :JavaDocSearch -x declarations<cr>

" Perform a context sensitive search of the element under the cursor with <enter>.
nnoremap <silent> <buffer> <leader><cr> :JavaSearchContext<cr>

" Generate a new ruby project:
" TODO: Think about initially creating it when loading the file
noremap <silent> <leader>nr :ProjectCreate ./ -n ruby <CR>

" 
nnoremap <silent> <leader>tn :TestNearest<CR>

" In a test file runs all tests in the current file, otherwise runs the last
" file tests.
nnoremap <silent> <leader>tf :TestFile<CR>

" Runs the whole test suite
nnoremap <silent> <leader>ts :TestSuite<CR>

" Runs the last test.
nnoremap <silent> <leader>tl :TestLast<CR>

" Visits the test file from which you last run your tests
nnoremap <silent> <leader>tv :TestVisit<CR>

" jump to definition in js files using tern
noremap ü :TernDef <CR>

" toggle YCM autocomplete
nnoremap <Leader>ycm :call YCMToggle()<cr>
function! YCMToggle()
    if g:ycm_auto_trigger
        let g:ycm_auto_trigger = 0
    else
        let g:ycm_auto_trigger = 1
    endif
endfunction

" change paste a word: use case: have a word in buffer and want to replace
" another word by current buffer's content.
nmap <silent> cp "_cw<C-R>"<Esc>

" start autogroups
augroup testgroup

  " Clears autogroup if there is another testgroup
  autocmd!
  " Set persistent syntax highlighting for a given filetype.
  autocmd BufNewFile,BufRead *.fml set syntax=javascript

  " Do not display DOS line-endings ^M (Windows)
  autocmd BufNew,BufEnter,BufRead,WinEnter *.fml match Ignore /\r$/


  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
  autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable autocomplete for ruby files
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete

  autocmd Filetype * runtime! autoload/eclim/<amatch>/complete.vim
      \ | let s:cfunc = 'eclim#'.expand('<amatch>').'#complete#CodeComplete'
      \ | if exists('*'.s:cfunc) | let &l:omnifunc=s:cfunc | endif

  au BufReadPost,BufNewFile *.java colorscheme monokai

augroup END


"*************************************************************************"
"autoreload"
"*************************************************************************"
" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1} 
silent! execute WatchForChanges("*",autoreadargs)


if has('nvim')
  " configuration allows using `Alt+{h,j,k,l}` to navigate between windows
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
endif


