" vimrc
"
""""""""""""""""""""""""

set history=1000
set undolevels=1500
set scrolloff=10

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
" set splitright
set foldopen-=search
set noswapfile
" fast scroll
set lazyredraw
" fix background color diff
set t_ut=
" use old regex, faster
set re=1

set wildmenu
set wildmode=list:longest:full
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.js.map,.tmp
set tags=.git/.tags,/.tagv

"" encoding
set fenc=utf-8
set enc=utf-8

"" search options
set wrapscan
set incsearch
set ignorecase
set hlsearch

"" Perf: Set scroll to a third of the window instead of half
augroup set_scroll
      au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scroll=winheight(win_getid())/3
augroup END

"" support resizing in tmux
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

"" syntax / filetype
syntax enable
au BufNewFile,BufRead *.jake,*.param set filetype=perl
au BufNewFile,BufRead *.ros set filetype=html
au BufNewFile,BufRead *.nools set filetype=javascript
au BufNewFile,BufRead *.es6 set filetype=javascript.jsx
au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
au BufNewFile,BufRead *.prisma set filetype=graphql

"" extra auto command
au BufNewFile *.pl,*.cgi s,^,#!/usr/local/bin/perl -w\r#\r\ruse strict;\r\r,
au BufNewFile *.sh s,^,#!/bin/sh\r#\r\r,
au BufNewFile,BufRead *.jake,*.param,*.ros set filetype=html

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"" UI
"""""""""""""""""""""""'
set background=dark
set ruler
set laststatus=2
set title

"" color scheme
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_italic = 1

let g:onedark_terminal_italics = 1

" Fix the gray background/intermittent lighter background issue on iTerm
if (!has('gui_running'))
  let g:solarized_termtrans = 1
endif

" $TERM_PROGRAM not set in sudo vim
if (($TERM_PROGRAM == '') || ($TERM_PROGRAM == 'iTerm.app'))
  " colorscheme solarized
  colorscheme onedark
else
  colorscheme molokai
endif

highlight Comment cterm=italic
highlight htmlArg cterm=italic

"" Customize theme
" set vertical seperator to a single line
set fillchars=vert:\│
if (g:colors_name == 'solarized')
  " hide empty lines
  hi NonText ctermfg=235 guifg=#002834 guibg=#002834
  " hide vertical split char |
  hi VertSplit ctermbg=NONE guibg=#073642 ctermfg=0 guifg=#002834
elseif (g:colors_name == 'onedark')
  hi NonText ctermfg=235 guifg=#002834 guibg=#002834
  hi FoldColumn ctermfg=235 guifg=#002834 guibg=#002834
  hi VertSplit ctermbg=NONE guibg=#002834 ctermfg=0 guifg=#393e46
  hi LineNr ctermbg=NONE guibg=#002834 ctermfg=0 guifg=#393e46
  " hi VertSplit ctermbg=NONE guibg=#002834 ctermfg=0 guifg=#2c323d
  hi jsModuleKeywords guifg=#e06475
endif

"" Vundle
"""""""""""""""""""""""'
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

"" Key Map
"""""""""""""""""""""""'

" Quicker switch to command line mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap ga ^

" Quicker word move
" nnoremap w W
" nnoremap W w
" nnoremap b B
" nnoremap B b

" Go to the beginning and end of line
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-a> <C-o>ga
" inoremap <C-Space> <esc>o
" nnoremap <C-Space> o

" Indentation after curly brace & bracket
" Comes with auto-pair plugin
" inoremap {<CR> {<CR>}<Esc>O<BS><Tab>
" inoremap (<CR> (<CR>)<Esc>O<BS><Tab>
" inoremap [<CR> [<CR>]<Esc>O<BS><Tab>

nnoremap H ^
nnoremap L $

" Change mapleader to comma to be more productive
let mapleader=","

" General productivity shortcuts
inoremap jk <esc>
inoremap kk <esc>
inoremap jj <esc>
inoremap ii <esc>
inoremap <C-l> <esc>
inoremap <C-[> <esc>
inoremap <C-s> <C-o>:w<cr>

vnoremap <C-l> <esc>
vnoremap <C-[> <esc>
vnoremap <C-s> :w<cr>

" nnoremap <Space> i

" Very magic regex
" vnoremap / /\v
" vnoremap / /\v

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
cnoremap wsud w !sudo tee %

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

nnoremap <leader>L :Align<cr>
nnoremap <leader>a :Rg<space>
noremap <leader>A :Ack<space>
vnoremap <leader>aw y:Ack <c-r>"<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>T :CtrlPClearCache<cr>:CtrlP<cr>
nnoremap <leader>l :TagbarToggle<cr>
nnoremap <leader>G :GitGutterToggle<cr>
nnoremap <leader>I :IndentGuidesToggle<cr>
nnoremap <leader>i :IndentLinesToggle<cr>
nnoremap <leader>m :messages<cr>
nnoremap <leader>M %
nnoremap <leader>W :ToggleWhitespace<cr>
nnoremap <leader>z :ZoomToggle<cr>
nnoremap <leader>ar :AirlineToggle<cr>
nnoremap <leader>at :ALEToggle\|SyntasticToggleMode<cr>
nnoremap <leader>/ /\v

nnoremap <leader>cl :Copilot<cr>
nnoremap <leader>ce :Copilot enable<cr>
nnoremap <leader>cd :Copilot disable<cr>
nnoremap <leader>cs :Copilot status<cr>
nnoremap <leader>ca :Copilot panel<cr>

nnoremap <leader>ss :call whitespace#strip_trailing()<cr>
nnoremap <leader>nh :call ToggleAgSkipVcsIgnores()<cr>
nnoremap <leader>nl :call ToggleAgSkipLocales()<cr>
nnoremap <leader>nt :call ToggleTypeScriptProject()<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>wr <C-w>x<cr>
nnoremap <leader><leader>w :w\|Prettier<cr>
nnoremap <leader>q! :qa!<cr>
nnoremap <leader><leader> :qa<cr>
nnoremap <leader><leader>q! :qa!<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader><leader>x :xa<cr>
nnoremap <leader>h :h<space>
nnoremap <leader>H :Dash<space>
nnoremap <leader><leader>h :Dash<cr>
nnoremap <leader><leader>bd :bd<cr>
nnoremap <leader><leader>bD :bd!<cr>
nnoremap <leader><leader>bq :bq<cr>
nnoremap <leader><leader>ba :ba<cr>
nnoremap <leader><leader>bo :bufdo<space>
nnoremap <leader><leader>br :bufdo e!<cr>
nnoremap <leader><leader>bq :bufdo bd<cr>
nnoremap <leader>Bj :call JsxBeautify()<cr>
nnoremap <leader>ct :Dispatch! ctpro<cr>
nnoremap <leader>vba :vert ba<cr>
nnoremap <leader><leader>b :BuffergatorOpen<cr>
nnoremap <leader>B :BuffergatorClose<cr>
nnoremap <leader>j :BuffergatorMruCyclePrev<cr>
nnoremap <leader>J :BuffergatorMruCycleNext<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>sp :set paste<cr>
nnoremap <leader>ft :set ft=
nnoremap <leader>fsh :set ft=sh<cr>
nnoremap <leader>fjs :set ft=javascript<cr>
nnoremap <leader>fjo :set ft=json<cr>
nnoremap <leader>fjx :set ft=jsx<cr>
nnoremap <leader>ftx :set ft=typescript.tsx<cr>
nnoremap <leader>fw :Ack <C-r><C-w><cr>
nnoremap <leader>jl <S-j>dw
nnoremap <leader>r :%s/
nnoremap <leader>r/ :%s/\v
nnoremap <leader>rw :%s/<C-r><C-w>/
vnoremap <leader>rw :%s/<C-r><C-w>/
nnoremap <leader>rfa :%s/\(function\)(/\1 (/I<cr>
nnoremap <leader>rff :%s/function \(\w\+\)(/function \1 (/<cr>
nnoremap <leader>rfc :%s/\(\w\+\)(\(\w*\)) {/\1 (\2) {/<cr>
nnoremap <leader>rfs :%s/;//<cr>
nnoremap <leader>rfq :%s/"/'/g<cr>
nnoremap <leader>rc :%s/\/\/\(\w\)/\/\/ \1/<cr>
nnoremap <leader>rif :%s/if(/if (/<cr>:%s/){/) {/<cr>
nnoremap <leader>ra :%s/function\%[ ]()/() =>/I<cr>
nnoremap <leader>rm :exe "!rm ~/tmp/%.sw*"<cr><cr>:echo 'swap files removed'<cr>
nnoremap <leader>re :reg<cr>
nnoremap <leader>ri gg=G<cr>
nnoremap <leader>R :redraw!<cr>
nnoremap <leader>ss /\C
nnoremap <leader>cr :ChromeReload<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>wc :let<space>g:ctrlp_working_path_mode=0<cr>
nnoremap <leader>wd :let<space>g:ctrlp_working_path_mode='ra'<cr>

vnoremap <leader>s :s/
vnoremap <leader>sq :s/"/'/g<cr>
vnoremap <leader>sw y:%s/<C-r>"/

nnoremap <leader>e :e<space>
nnoremap <leader>E :e!<cr>
nnoremap <leader>er :e README.md<cr>
nnoremap <leader>ec :e CHANGELOG.md<cr>
nnoremap <leader>ep :e package.json<cr>
nnoremap <leader>epl :e package-lock.json<cr>
nnoremap <leader>epc :e client/package.json<cr>
nnoremap <leader>eps :e server/package.json<cr>
nnoremap <leader>et :e tsconfig.json<cr>
nnoremap <leader>en :e npm-shrinkwrap.json<cr>
nnoremap <leader>ey :e yarn.lock<cr>
nnoremap <leader>eg :e Gruntfile.js<cr>
nnoremap <leader>ei :e index.js<cr>
nnoremap <leader>ew :e webpack.config.js<cr>
nnoremap <leader>ev :vsplit<cr>:e ~/.vimrc<cr>
nnoremap <leader>evl :vsplit<cr>:e ~/.vimrc.local<cr>
nnoremap <leader>eb :e ~/.vimrc.bundles<cr>
nnoremap <leader>ea :e ~/.aliases<cr>
nnoremap <leader>eal :e ~/.aliases.local<cr>
nnoremap <leader>eap :e ~/.aliases.private<cr>
nnoremap <leader>ebp :e ~/.bash_profile<cr>
nnoremap <leader>ebpl :e ~/.bash_profile.local<cr>
nnoremap <leader>ef :e ~/.functions<cr>
nnoremap <leader>el :!eslint %<cr>
nnoremap <leader>es :e ~/.slate<cr>
nnoremap <leader>eu :UltiSnipsEdit<cr>
nnoremap <leader>N :nohlsearch<cr>
" nnoremap <leader>n />>><cr>
nnoremap <leader>ch :helpc<cr>
nnoremap <leader>hg :helpg<space>
nnoremap <leader>hf :help function-list<cr>
nnoremap <leader>hr :help variables<cr>
nnoremap <leader>he :help expession-syntax<cr>
nnoremap <leader>hc :help variables<cr>
nnoremap <leader>vh :vert h<space>
nnoremap <leader>lf :lfirst<cr>
nnoremap <leader>ln :lnext<cr>
nnoremap <leaderder>lp :lprevious<cr>
nnoremap <leader>cf :cfirst<cr>
noremap <leader>cw :<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>lc :pclose\|cclose\|lclose\|helpclose\|BuffergatorClose<cr>
nnoremap <leader>ms :Gsearch<space>
nnoremap <leader>mw :Gsearch<space><C-R><C-w><cr>
vnoremap <leader>mw y:Gsearch<space><C-R>"<cr>
noremap <leader>mr :Greplace<cr>
map <leader>td <Plug>TaskList
nnoremap <silent><leader>rv :source ~/.vimrc<cr>:filetype detect<cr>:echo 'vimrc reloaded'<cr>
nnoremap <leader>ya :%y+<cr>
nnoremap <leader>da ggdG
nnoremap <leader>va ggVG
nnoremap <leader>yr :reg<cr>

" ale
" nmap <leader>ln <Plug>(ale_next_wrap)
" nmap <leader>lp <Plug>(ale_previous_wrap)
nmap <leader><leader>l <Plug>(ale_fix)

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>sj :SyntasticCheck jscs<cr>
nnoremap <leader>se :SyntasticCheck eslint<cr>
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>mf :MultipleCursorsFind<space>

nnoremap <leader>ic :set invignorecase<cr>
nnoremap <leader>it :set invexpandtab<cr>
nnoremap <leader>il :set invlist<cr>
nnoremap <leader>in :set invnumber<cr>
nnoremap <leader>iw :set invwrap<cr>
nnoremap <leader>fo :set foldcolumn=2<cr>
nnoremap <leader>fr :set foldcolumn=0<cr>
nnoremap <leader>fc :/<<<<<<<<cr>
nnoremap <leader>t2 :set sw=2 ts=2<cr>
nnoremap <leader>t4 :set sw=4 ts=4<cr>
nnoremap <leader>k :set foldlevel=0<cr>
nnoremap <leader>kk :set foldlevel=1<cr>
nnoremap <leader>K :set foldlevel=2<cr>
nnoremap <leader>fjs :set filetype=javascript<cr>
nnoremap <leader>fjo :set filetype=json<cr>
nnoremap <leader><leader>0 :set foldlevel=0<cr>
nnoremap <leader><leader>1 :set foldlevel=1<cr>
nnoremap <leader><leader>2 :set foldlevel=2<cr>
nnoremap <leader><leader>3 :set foldlevel=3<cr>
nnoremap <leader><leader>4 :set foldlevel=4<cr>
nnoremap <leader><leader>5 :set foldlevel=5<cr>
nnoremap <leader><leader>6 :set foldlevel=6<cr>
nnoremap <leader><leader>7 :set foldlevel=7<cr>
nnoremap <leader><leader>8 :set foldlevel=8<cr>
nnoremap <leader><leader>9 :set foldlevel=99<cr>
nnoremap <leader><leader>f zA
nnoremap <leader><leader>c zc

" Move lines
nnoremap <leader>gj :m .+1<CR>==
nnoremap <leader>gk :m .-2<CR>==
inoremap <leader>gj <Esc>:m .+1<CR>==gi
inoremap <leader>gk <Esc>:m .-2<CR>==gi
vnoremap <leader>gj :m '>+1<CR>gv=gv
vnoremap <leader>gk :m '<-2<CR>gv=gv

" Diff
nnoremap <leader>dt :windo diffthis<cr>
nnoremap <leader>do :windo diffoff<cr>
nnoremap <leader>dg :windo diffget<cr>
nnoremap <leader>dp :windo diffput<cr>
nnoremap <leader>du :windo diffupdate<cr>

" Find
nnoremap <leader>fcon :/console.log<cr>

" Space to toggle folds
nnoremap <leader><leader><leader> :call ToggleFoldLevel()<cr>
nnoremap <expr><leader><leader>o ":exe ':!open %'\n:redraw\<CR>"
nnoremap <expr><leader><leader>od ":exe ':!open .'\n:redraw\<CR>"

function! ToggleFoldLevel()
  if &foldlevel
    setlocal foldlevel=0
  else
    setlocal foldlevel=99
  endif
endfunction

" fugitive git bindings
nnoremap <leader>g :Git<space>
" nnoremap <leader>ga :Git add %:p<cr><cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gc :Git commit -v -q<cr>
nnoremap <leader>gt :Git commit -v -q %:p<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ge :Git edit<cr>
nnoremap <leader>gr :Git read<cr>
nnoremap <leader>gw :Git write<cr><cr>
nnoremap <leader>gl :silent! Glog<cr>:bot copen<cr>
nnoremap <leader>gp :Git grep<Space>
nnoremap <leader>gm :Git move<Space>
nnoremap <leader>gB :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<cr>
nnoremap <leader>gpl :Dispatch! git pull<cr>

" To open :Glog in quick fix window
autocmd QuickFixCmdPost *grep* cwindow

" Gist
nnoremap <leader><leader>G :Gist<space>
nnoremap <leader><leader>g :Gist<cr>
nnoremap <leader><leader>gg :Gist!<cr>
nnoremap <leader><leader>gl :Gist -l<cr>
nnoremap <leader><leader>gp :Gist -P<cr>
nnoremap <leader><leader>ga :Gist -a<cr>
nnoremap <leader><leader>ge :Gist -e<cr>
nnoremap <leader><leader>gd :Gist -d<cr>
nnoremap <leader><leader>gm :Gist -m<cr>
nnoremap <leader><leader>gb :Gist -b<cr>

vnoremap <leader><leader>g :Gist<cr>
vnoremap <leader><leader>gg :Gist!<cr>
vnoremap <leader><leader>gp :Gist -a<cr>
vnoremap <leader><leader>ga :Gist -a<cr>

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
nnoremap <leader>9 :tabn 9<cr>
nnoremap <leader>0 :tablast<cr>

nnoremap <leader>t :tabnew<cr>
nnoremap <leader><leader>t :tabnew %<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tol :tabonly<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>n :tabprevious<cr>
nnoremap <leader>tf :tabfirst<cr>
nnoremap <leader>tl :tablast<cr>
nnoremap <leader>te :tabedit %<cr>
" Same with tabedit %
nnoremap <leader>ts :tab split<cr>

" Tern mapping
nnoremap <leader><leader>rd :TernDoc<cr>
nnoremap <leader>rb :TernDocBrowse<cr>
nnoremap <leader>rt :TernType<cr>
nnoremap <leader>rdd :TernDef<cr>
nnoremap <leader>rd :TernDefPreview<cr>
nnoremap <leader>rds :TernDefSplit<cr>
nnoremap <leader>rdt :TernDefTab<cr>
nnoremap <leader>rr :TernRefs<cr>
nnoremap <leader>rR :TernRename<cr>

" Selection shortcuts
nnoremap <leader>vp <S-v>ap
nnoremap <leader>vP `[v`]
nnoremap <leader><leader>vp V]}

" Common Tasks
" Open last closed file
nnoremap <leader>ol :sp #<cr>
nnoremap <leader>vol :vsp #<cr>

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

"" Plugin Configs
"""""""""""""""""""""""'
"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'monochrome'
let g:airline_left_alt_sep = '<'
let g:airline_right_alt_sep = '>'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Display filename on the last visible section
let g:airline_section_z = '%t'

"" javascript-library-syntax
let g:used_javascript_libs='jquery,underscore,backbone,react,flux,requirejs,chai'

"" stop vim from removing idnentation on empty line
" inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" Buffergator
let g:buffergator_suppress_keymaps=1
let g:buffergator_show_full_directory_path=0
let g:buffergator_viewport_split_policy='B'

" php
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=1
let php_parent_error_close=1

" rails
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb

" better-whitespace
let g:strip_whitespace_on_save = 0
let g:better_whitespace_filetypes_blacklist=['dustjs']

" ragtag
" noremap <M-o>        <Esc>o
" inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" syntastic
" let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html'] }
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_json_checkers = ['jsonlint']
" let g:syntastic_typescript_checkers = ['tslint', 'tsc']
" let g:syntastic_typescript_checkers = []
" let g:syntastic_html_tidy_ignore_errors = [
"   \ 'trimming empty <span>',
"   \ 'trimming empty <i>'
"   \ ]

" Note: Doesn't work to investigate
" let g:syntastic_typescript_tsc_args = "--experimentalDecorators"
" let g:syntastic_typescript_tsc_fname = ''

" Ale
" To avoid conflict warning with Syntastic on startup
let g:ale_emit_conflict_warnings = 0

" To fix autocomplete issue
" set completeopt=menu,menuone,preview,noselect,noinsert

" let g:ale_linters = {'javascript': ['eslint', 'prettier']}
" To linters for add new file types manually, doesn't merge with the default configs
let g:ale_linters = {
    \ 'javascript': ['eslint', 'prettier', 'flow'],
    \ 'typescript': ['tsc', 'tslint'],
    \ 'typescript.tsx': ['tslint', 'tsc'],
    \ 'json': ['jsonlint']
  \ }

let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'graphql': ['eslint', 'gqllint']}

" let g:ale_set_loclist = 0
" let g:ale_set_quickfix =0
let g:ale_open_list = 1
" Onlyt tsserver for Typescript code is supported for completion
" Disable, let YCM handle
let g:ale_completion_enabled = 1

" Typescript support
" Default: '' - tslint.json
" let g:ale_typescript_tslint_config_path = 'tsconfig.json'
"

" To speed up slow linting
let g:ale_c_clangtidy_checks = ['-*', 'cppcoreguidelines-*']

if executable('node_modules/.bin/tslint')
  let g:syntastic_typescript_tslint_exec = 'node_modules/.bin/tslint'
  if !filereadable('tslint.json') && filereadable('node_modules/commonweb-setup/tslint.json')
    let g:syntastic_typescript_tslint_args = '-c node_modules/commonweb-setup/tslint.json'
  endif
endif


" Let Ale handle typescript check
if executable('./node_modules/.bin/tsc')
  let g:syntastic_typescript_tsc_exec = './node_modules/.bin/tsc'
endif

" let g:syntastic_ruby_checkers = ['rubocop', 'ruby-lint']
" let g:syntastic_objc_checkers = ['oclint']
" let g:syntastic_debug = 3

autocmd FileType javascript,javascript.jsx
  \ let b:syntastic_checkers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']

" Auto indent with . prefix
autocmd FileType javascript,javascript.jsx setlocal indentkeys+=0.

" mxw/vim-jsx plugin
let g:jsx_ext_required = 0 " Allow JSX in normal JS files, causing filetype set to javascript.jsx

" easytags - create .tags in project directory
" set tags=./tags
" let g:easytags_dynamic_files = 2
"
" YCM Init
" let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-N>'
" let g:ycm_auto_trigger=0
" let g:ycm_key_invoke_completion = '<C-;>'
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" Let ale handle validation checks, and YCM handles only the autocomplete
let g:ycm_show_diagnostics_ui = 0

" Update YCM window colour
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#61afef guibg=#002c38

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Sparkup to create HTML
let g:sparkupExecuteMapping = '<C-t>'

" vim-emmet
let g:emmet_html5 = 0
let g:user_emmet_settings = {
  \   'javascript.jsx': {
  \       'extends': 'jsx'
  \   }
  \ }

" RG ack and ctrlp search configs
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
  " let g:ctrlp_user_command = 'rg --files --hidden --colors="match:fg:yellow,bold,path:fg:blue,line:fg:green"'

  " Set fzf window layout with preview on the righ
  let g:fzf_layout = { 'down': '~60%' }
  let g:fzf_preview_hidden = ['right:60%:hidden', 'ctrl-/']
  let g:fzf_preview_shown = ['right:60%', 'ctrl-/']
  let g:fzf_preview_window = g:fzf_preview_hidden
  " let g:fzf_preview_window = g:fzf_preview_shown

  " Override environment variables, FZF_DEFFAULT_COMMAND used by :Files if avvailable
  " let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
  " let $FZF_DEFAULT_OPTS='--color="fg:#ff0000,fg+:#ff0000,bg:#ff0000,hl:#ff0000"'
  "
  " let $FZF_PREVIEW_COMMAND="COLORTERM=truecolor bat --style=numbers --color=always {}"

  " Customize the Rg colors
  function! RgCustomOptions(query)
    let colors = '--colors "path:fg:198,120,221" --colors "line:fg:97,175,239" --colors "match:fg:40,44,52" --colors "match:bg:229,192,123"'
    let command = "rg --column --line-number --no-heading --color=always --smart-case " . colors . " -- "
    echo command
    call fzf#vim#grep(command . fzf#shellescape(a:query), fzf#vim#with_preview(), 0)
  endfunction

  command! -bang -nargs=* Rg call RgCustomOptions(<q-args>)

  " Wrapper function for rg search with preview enabled
  function! Rgp(query)
    let g:fzf_preview_window = g:fzf_preview_shown
    execute 'Rg ' . a:query
    let g:fzf_preview_window = g:fzf_preview_hidden
  endfunction

  function! FilesFzf()
    " let g:fzf_preview_window = g:fzf_preview_hidden
    execute 'Files'
    " let g:fzf_preview_window = g:fzf_preview_shown
  endfunction

  " Key mappings
  " File search with no preview
  nnoremap <C-t> :call FilesFzf()<CR>
  nnoremap <C-p> :call FilesFzf()<CR>

  " Open Rg automatically
  nnoremap <C-f> :call Rgp('')<CR>
  " Auto search keyword under the cursor with rg
  nnoremap <C-t> :call Rgp(expand("<cword>"))<CR>
endif

" vim-editorconfig
let g:EditorConfig_max_line_indicator = "none"

" Custom indent-guides color
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
" let g:indent_guides_enable_on_vim_startup = 1

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_char = '︙'
" let g:indentLine_color_term = 239

" vim-jsbeautify configs
autocmd FileType javascript noremap <buffer> <leader>F :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <leader>F :call JsonBeautify()<cr>
autocmd FileType html,xml noremap <buffer> <leader>F :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>F :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

let editorconfig = getcwd() . '/.editorconfig'
if filereadable(editorconfig)
  let g:editorconfig_Beautifier = editorconfig
endif

" NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeIgnoreOn=['.configcache', '.nyc_output', 'node_modules', 'coverage', '\~$', './tags',
  \ 'build$', '\.build$', 'dist$', '\.log$', '\.git$', '\.sass-cache$', '\.cache', '\.gh-pages', '\.js\.map$',
  \ '\.docz']
let g:NERDTreeIgnoreOff=['.configcache', '.nyc_output', '\~$', './tags', '\.log$', '\.git$',
  \ '\.sass-cache$', '\.docz']
let NERDTreeMinimalUI=1
" To allow switching to the top/bottom tmux window
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeRespectWildIgnore = 1

if !&diff
  " to open NERDTree on start
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd l
endif

" delimitMate, auto indent after braces
let delimitMate_expand_cr=1

" vim-better-whitepace color
highlight ExtraWhitespace ctermbg=238 guibg=#465457

" multi-cursors
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<cr>

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

" tabular
" Not using this
" vnoremap <leader>t= :Tabularize /=<cr>
" vnoremap <leader>t: :Tabularize /:<cr>
" vnoremap <leader>t- :Tabularize /-<cr>
" vnoremap <leader>ts :Tabularize / <cr>
" vnoremap <leader>tt :Tabularize /\t<cr>

" vim-node
autocmd User Node
      \ if &filetype == "javascript" |
      \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
      \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
      \ endif

" common functions
function! RefreshNerdTree()
  if exists('t:NERDTreeBufName')
    :NERDTreeFocus
    call feedkeys("R")
    call feedkeys("\<C-l>")
  endif
endfunction

" Invert ag --skip-vcs-ignores
let g:ag_skip_vcs_ignores = 0

let g:NERDTreeIgnore = g:NERDTreeIgnoreOn

let g:vim_ctrlp_user_prefix = 'rg --files --hidden --color="match:fg:yellow,bold,path:fg:blue,line:fg:green"'

function! ToggleAgSkipVcsIgnores()
  if g:av_skip_vcs_ignores == 0
    let l:path_to_ignore = ' --ignore node_modules --ignore .git'
    let g:ackprg = g:ackprg . " --skip-vcs-ignore" . l:path_to_ignore
    " Slow to index node_modules directory
    " let g:ctrlp_user_command = g:ctrlp_user_command . " --skip-vcs-ignore" . l:path_to_ignore
    let g:ag_skip_vcs_ignores = 1
    let g:NERDTreeRespectWildIgnore = 0
    let g:NERDTreeIgnore = g:NERDTreeIgnoreOff
  else
    let g:ackprg = 'ag --vimgrep'
    let g:NERDTreeRespectWildIgnore = 1
    " let g:ctrlp_user_command g:vim_ctrlp_userprefix
    let g:ag_skip_vcs_ignores = 0
    let g:NERDTreeIgnore = g:NERDTreeIgnoreOn
  endif

  call RefreshNerdTree()
endfunction

command! -nargs=0 ToggleAgSkipVcsIgnores :call ToggleAgSkipVcsIgnores()

" Typescript
let g:is_typescript_project = 0
" let g:vim_ctrlp_command_prefix = 'rg --files --hidden --color="match:fg:yellow,bold,path:fg:blue,line:fg:green"'
let g:vim_ackprg_ignore_locales = ''

function! ToggleTypeScriptProject()
  if g:is_typescript_project == 0
    call insert(g:NERDTreeIgnore, '\.js$', 0)
    call insert(g:NERDTreeIgnore, '\.d.ts$', 0)
    let g:is_typescript_project = 1
    " let g:ctrlp_user_command = g:vim_ctrlp_command_prefix . ' --ignore=*.js --ignore=*.map --ignore=locales'
    let g:ackprg = g:vim_ackprg_ignore_locales . ' --ignore=*.js --ignore=*.map'
  else
    call remove(g:NERDTreeIgnore, 0)
    call remove(g:NERDTreeIgnore, 0)
    let g:is_typescript_project = 0
    " let g:ctrlp_user_command = g:vim_ctrlp_command_prefix
    let g:ackprg = g:vim_ackprg_ignore_locales
  endif

  call RefreshNerdTree()
endfunction

command! -nargs=0 ToggleTypeScriptProject :call ToggleTypeScriptProject()

if filereadable("./tsconfig.json") || filereadable("./server/tsconfig.json") || filereadable("./client/tsconfig.json")
   call ToggleTypeScriptProject()
endif

" greplace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Tagbar
let g:tagbar_autofocus = 1
" let g:tagbar_autoclose = 1
let g:tagbar_previewwin_pos = "bottom"

" Tagbar - Typescript, install tstags
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

" Dust.js
let g:surround_{char2nr('d')} = "{\r}"

" JSX comment, not supported in tsx
autocmd FileType javascript let b:surround_47 = "{/* \r */}"

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

" Gist
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Polyglot
" Conflict with vim-jsx, new line not indented
" let g:polyglot_disabled = ['jsx']

" Indent after html tag
function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction

inoremap <expr> <CR> Expander()

" Prettier
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 100

" use tabs over spaces
" number of spaces per indentation level
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
" print semicolons
" single quotes over double quotes
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'
" none|es5|all
let g:prettier#config#trailing_comma = 'all'
" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'
" disable prettier validation, use ale instead
let g:prettier#exec_cmd_async = 1
" cli-override|file-override|prefer-file
" let g:prettier#config#config_precedence = 'prefer-file'

" vim-instant-markdown
let g:instant_markdown_autostart = 0

" Temporary workaround for python 3.7 deprecated warning:
" https://github.com/vim/vim/issues/3117#issuecomment-402622616
if has('python3')
  silent! python3 1
endif

" Flow
" Disable flow validation error, let Ale handles it
" Use vim-flow only for omni completion
let g:flow#showquickfix = 0

" Default markdown.mdx does not highlight javascript
au BufNewFile,BufRead *.mdx set filetype=javascript.mdx
