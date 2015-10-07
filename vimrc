"""""""""""""""""""""""'
" vimrc
"
""""""""""""""""""""""""
set backspace=eol,start,indent
set nocompatible
set history=1000
set undolevels=1500
set scrolloff=10
set cmdheight=2
set linebreak
set textwidth=500
set mouse=a
set noerrorbells
set hidden
set number
set completeopt=longest,menuone
set nowrap
set autoread
set clipboard=unnamed
set directory-=.
set timeoutlen=400
set splitbelow
set splitright
set foldopen-=search
" set smartcase

set wildmenu
set wildmode=list:longest:full
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc

"" encoding
set fenc=utf-8
set enc=utf-8

"" search options
set wrapscan
set incsearch
set ignorecase
set hlsearch

"" support resizing in tmux
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

"" syntax / filetype
syntax enable
au BufNewFile,BufRead *.jake,*.param set filetype=perl
au BufNewFile,BufRead *.ros set filetype=html
au BufNewFile,BufRead *.nools set filetype=javascript
au BufNewFile,BufRead *.snippets set filetype=perl

"" extra auto command
au BufNewFile *.pl,*.cgi s,^,#!/usr/local/bin/perl -w\r#\r\ruse strict;\r\r,
au BufNewFile *.sh s,^,#!/bin/sh\r#\r\r,
au BufNewFile,BufRead *.jake,*.param,*.ros set filetype=html
au BufNewFile,BufRead *.jake,*.param,*.ros set filetype=html

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"" ui
set background=dark
set ruler
set laststatus=2
set title

"" color scheme
if (&t_Co == 256 || has('gui_running'))
  " $TERM_PROGRAM not set in sudo vim
  if (($TERM_PROGRAM == '') || ($TERM_PROGRAM == 'iTerm.app'))
  colorscheme solarized
  else
    colorscheme molokai
  endif
endif

"" tab / indentation
set expandtab
set softtabstop=2
set tabstop=4
set shiftwidth=2
set autoindent
set smarttab

"" folding
set foldmethod=indent
set foldlevelstart=99
set foldnestmax=10
set foldminlines=1
set foldcolumn=0

"" Vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

call vundle#end()
filetype plugin indent on

" Quicker switch to command line mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Quicker word move
" nnoremap w W
" nnoremap W w
" nnoremap b B
" nnoremap B b

" Go to the beginning and end of line
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <C-a> <C-o>0

" Change mapleader to comma to be more productive
let mapleader=","

" General productivity shortcuts
inoremap jk <esc>
inoremap jj <esc>
inoremap <C-l> <esc>
inoremap <C-s> <C-o>:w<cr>
nnoremap <C-s> :w<cr>

" Very magic regex
nnoremap / /\v
vnoremap / /\v

" Command line shortcut
cnoremap <C-l> <C-c>
cnoremap jk <C-c>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
" cnoremap sw w !sudo tee %

" Remap alt key for it to work in commandline mode
execute "set <M-b>=\eb"
execute "set <M-d>=\ed"
execute "set <M-f>=\ef"

" Keep selection selected after indented
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv
vmap <BS> x

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>l :Align
nnoremap <leader>a :Ack<space>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>T :CtrlPClearCache<cr>:CtrlP<cr>
nnoremap <leader>] :TagbarToggle<cr>
nnoremap <leader>G :GitGutterToggle<cr>
nnoremap <leader>i :IndentGuidesToggle<cr>
nnoremap <leader>W :ToggleWhitespace<cr>
nnoremap <leader>z :ZoomToggle<cr>
nnoremap <leader>/ /

nnoremap <leader>ss :call whitespace#strip_trailing()<cr>
nnoremap <silent><leader>si :call ToggleAgSkipVcsIgnores()<cr>:NERDTree<cr>:wincmd l<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>q! :qa!<cr>
nnoremap <leader><leader>q :qa<cr>
nnoremap <leader><leader>q! :qa!<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader><leader>x :xa<cr>
nnoremap <leader>h :h<space>
nnoremap <leader>H :Dash<space>
nnoremap <leader><leader>h :Dash<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bd! :bd!<cr>
nnoremap <leader>ba :ba<cr>
nnoremap <leader>bo :bufdo<space>
nnoremap <leader>br :bufdo e!<cr>
nnoremap <leader>vba :vert ba<cr>
nnoremap <leader>j :BuffergatorMruCyclePrev<cr>
nnoremap <leader>J :BuffergatorMruCycleNext<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>sp :set paste<cr>
nnoremap <leader>ft :set ft=<space>
nnoremap <leader>fs :set ft=sh<cr>
nnoremap <leader>jl <S-j>dw
nnoremap <leader>r :%s/
nnoremap <leader>rw :%s/<C-r><C-w>/
vnoremap <leader>rw y:%s/<C-r>"/
nnoremap <leader>ru y:%s/function(/function (/<cr>
nnoremap <leader>rm :exe "!rm ~/tmp/%.sw*"<cr><cr>:echo 'swap files removed'<cr>
nnoremap <leader>ri gg=G<cr>
nnoremap <leader>R :redraw!<cr>
nnoremap <leader>ss /\C
nnoremap <leader>cr :ChromeReload<cr>
nnoremap <leader>wc :let<space>g:ctrlp_working_path_mode=0<cr>
nnoremap <leader>wd :let<space>g:ctrlp_working_path_mode='ra'<cr>

nnoremap <leader>o :!open %<cr>
nnoremap <leader>od :!open .<cr>
nnoremap <leader>e :e<space>
nnoremap <leader>er :e<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>eb :e ~/.vimrc.bundles<cr>
nnoremap <leader>el :!eslint %<cr>
nnoremap <leader>es :e ~/.slate<cr>
nnoremap <leader>eu :UltiSnipsEdit<cr>
nnoremap <leader>N :nohlsearch<cr>
nnoremap <leader>n />><cr>
nnoremap <leader>ch :helpc<cr>
nnoremap <leader>hg :helpg<space>
nnoremap <leader>lf :lfirst<cr>
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>
nnoremap <leader>cf :cfirst<cr>
nnoremap <leader>cw :<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>pc :pclose<cr>
nnoremap <silent><leader>rv :source ~/.vimrc<cr>:filetype detect<cr>:echo 'vimrc reloaded'<cr>

nnoremap <leader>pt :CtrlPTag<cr>
nnoremap <leader>ll :TagbarToggle<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>mp :InstantMarkdownPreview<cr>

nnoremap <leader>iw :set invwrap<cr>
nnoremap <leader>in :set invnumber<cr>
nnoremap <leader>il :set invlist<cr>
nnoremap <leader>ic :set invignorecase<cr>
nnoremap <leader>t2 :set sw=2 ts=2<cr>
nnoremap <leader>t4 :set sw=2 ts=2<cr>
nnoremap <leader>ff :set foldcolumn=2<cr>
nnoremap <leader>F :set foldcolumn=0<cr>
nnoremap <leader><leader>0 :set foldlevel=0<cr>
nnoremap <leader><leader>1 :set foldlevel=1<cr>
nnoremap <leader><leader>2 :set foldlevel=2<cr>
nnoremap <leader><leader>3 :set foldlevel=3<cr>
nnoremap <leader><leader>4 :set foldlevel=4<cr>
nnoremap <leader><leader>5 :set foldlevel=5<cr>
nnoremap <leader><leader>9 :set foldlevel=99<cr>
nnoremap <leader><leader><leader> :set foldlevel=99<cr>

" Space to toggle folds
nnoremap <leader><leader>f zA

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<cr><cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit -v -q<cr>
nnoremap <leader>gt :Gcommit -v -q %:p<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr><cr>
nnoremap <leader>gl :silent! Glog<cr>:bot copen<cr>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<cr>
nnoremap <leader>gpl :Dispatch! git pull<cr>

" Tab mappings
nnoremap <leader><Space> :tabnext<cr>
nnoremap <leader><leader><Space> :tabprevious<cr>
nnoremap <leader>1 :tabn 1<cr>
nnoremap <leader>2 :tabn 2<cr>
nnoremap <leader>3 :tabn 3<cr>
nnoremap <leader>4 :tabn 4<cr>
nnoremap <leader>5 :tabn 5<cr>
nnoremap <leader>6 :tabn 6<cr>
nnoremap <leader>7 :tabn 7<cr>
nnoremap <leader>8 :tabn 8<cr>

nnoremap <leader>t :tabnew<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tol :tabonly<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tl :tabfirst<cr>
nnoremap <leader>tl :tablast<cr>

" Tern mappings
nnoremap <leader>rd :TernDoc<cr>
nnoremap <leader>rb :TernDocBrowse<cr>
nnoremap <leader>rt :TernType<cr>
nnoremap <leader>rf :TernDef<cr>
nnoremap <leader>rp :TernDefPreview<cr>
nnoremap <leader>rs :TernDefSplit<cr>
nnoremap <leader>rT :TernDefTab<cr>
nnoremap <leader>rr :TernRefs<cr>
nnoremap <leader>rR :TernRename<cr>

" Tab mapping for rails
nnoremap <leader>ra :A<cr>
nnoremap <leader>rr :R<cr>

" Selection shortcuts
nnoremap <leader>vp <S-v>ap

" Common Tasks
" Open last closed file
nnoremap <leader>sj :sp #<cr>
nnoremap <leader>vj :vsp #<cr>

" Jump to file in a split window
nnoremap <leader>vg <C-w>vgf #<cr>
nnoremap <leader>sg <C-w>sgf #<cr>

" Search selected text
vnoremap // y/<c-r>"<cr>

" Window resize shortcuts
nnoremap <silent>+ :exe "resize +5"<cr>
nnoremap <silent>_ :exe "resize -5"<cr>
nnoremap <silent>= :exe "vertical resize +5"<cr>
nnoremap <silent>- :exe "vertical resize -5"<cr>

" syntastic bundle
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" bufexplorer & buffergator
let g:bufExplorerShowRelativePath=1
let g:buffergator_suppress_keymaps=1

" php
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=1
let php_parent_error_close=1

" better-whitespace
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist=['dustjs']

" Recommended ragtag mapping
" noremap <M-o>        <Esc>o
" inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" Disable c-j shortcut to move line down on terminal
" let g:BASH_Ctrl_j = 'off'

" Fix Cursor in TMUX, thin cursor for insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Set mode to passive not to auto check
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop', 'ruby-lint']
" let g:syntastic_javascript_checkers = ['eslint']

autocmd FileType javascript
  \ let b:syntastic_checkers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint'] |
  \ call JavaScriptFold() |
  \ setl foldlevelstart=99

" mxw/vim-jsx plugin
" let g:jsx_ext_requirpd = 0 " Allow JSX in normal JS files, causing filetype set to javascript.jsx

" easy tags, to create .tags specific to project directory
set tags=./tags
let g:easytags_dynamic_files = 2

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Sparkup to create HTML
let g:sparkupExecuteMapping = '<c-t>'

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Custom indent-guides color
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
" let g:indent_guides_enable_on_vim_startup = 1

" vim-jsbeautify configs

" map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <leader>F :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>F :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>F :call CSSBeautify()<cr>

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules', '\.vim$', '\~$', 'tags', 'build', '\.log$', '\.git$', '\.sass-cache$']

" to open NERDTree on start
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l

" CtrlP settings
" Doesn't work with ag search, use .agitignore
" let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
let g:ctrlp_match_window = 'order:ttb,max:20'

" delimitMate, auto indent after braces
let delimitMate_expand_cr=1

" vim-better-whitepace color
highlight ExtraWhitespace ctermbg=238 guibg=#465457

" Tern config
" Enable keyboard shortcuts
" let g:tern_map_keys = 1
let g:tern_show_argument_hints='on_hold'

" Git gutter settings
let g:gitgutter_enabled = 0

" Disambiguate ,a & ,t from the Align plugin, making them fast again.
"
" This section is here to prevent AlignMaps from adding a bunch of mappings
" that interfere with the very-common ,a and ,t mappings. This will get run
" at every startup to remove the AlignMaps for the *next* vim startup.
"
" If you do want the AlignMaps mappings, remove this section, remove
" ~/.vim/bundle/Align, and re-run rake in maximum-awesome.
function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps

" Tabularize
nnoremap <leader>a= :Tabularize /=<cr>
vnoremap <leader>a= :Tabularize /=<cr>
nnoremap <leader>a: :Tabularize /:<cr>
vnoremap <leader>a: :Tabularize /:<cr>
vnoremap <leader>a: :Tabularize /:<cr>
vnoremap <leader>as :Tabularize / <cr>
vnoremap <leader>as :Tabularize / <cr>

" vim-node
autocmd User Node
      \ if &filetype == "javascript" |
      \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
      \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
      \ endif

" map another key to <Plug>Vsurround
:vmap <Leader>s <Plug>Vsurround

" Invert ag --skip-vcs-ignores
let g:ag_skip_vcs_ignores = 0
let g:NERDTreeIgnore = NERDTreeIgnore
function! ToggleAgSkipVcsIgnores()
  if g:ag_skip_vcs_ignores == 0
    let g:ackprg = g:ackprg . " --skip-vcs-ignores"
    let g:ctrlp_user_command = g:ctrlp_user_command . " --skip-vcs-ignores"
    call remove(g:NERDTreeIgnore, 0)
    let g:ag_skip_vcs_ignores = 1
  else
    let g:ackprg = 'ag --vimgrep'
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    call insert(g:NERDTreeIgnore, 'node_modules', 0)
    let g:ag_skip_vcs_ignores = 0
  endif
endfunction
command! -nargs=0 ToggleAgSkipVcsIgnores :call ToggleAgSkipVcsIgnores()

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_previewwin_pos = "bottom"

" Instant markdown
let g:instant_markdown_autostart = 0

" Dust.js
let g:surround_{char2nr('d')} = "{\r}"

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        exec t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

function! CssSetting()
  imap <TAB><TAB> <C-X><C-O>
endfunction

autocmd FileType css,scss,sass,stylus,less :call CssSetting()
