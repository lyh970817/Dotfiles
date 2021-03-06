let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged') " Colorscheme support

" Themes
Plug 'p7g/vim-bow-wob'
Plug 'lifepillar/vim-solarized8'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language Support
Plug 'jalvesaq/vimcmdline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-mma'

" Notebook Plug 'baruchel/vim-notebook'

" R
Plug 'jalvesaq/Nvim-R'

" lintr
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-grammarous'

" Plug 'junegunn/vim-easy-align'
Plug '907th/vim-auto-save'

Plug 'tpope/vim-surround'
" Read on Zhihu
" Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'jreybert/vimagit'
" Plug 'vimwiki/vimwiki'

Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/ingo-library'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'yuttie/comfortable-motion.vim'

Plug 'junegunn/vim-slash'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-table-mode'

" Completion and snippets
Plug 'sirver/UltiSnips'

" Cheatsheet
Plug 'lifepillar/vim-cheat40'

" Citation support
Plug 'jalvesaq/zotcite'

" Markdown
Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

call plug#end()

"" Autoinstall coc plugins
if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-r-lsp/package.json'))
	autocmd VimEnter * CocInstall coc-r-lsp
endif

if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-word/package.json'))
	autocmd VimEnter * CocInstall coc-word
endif

if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-python/package.json'))
	autocmd VimEnter * CocInstall coc-python
endif

if !filereadable(expand('~/.config/coc/extensions/node_modules/coc-sh/package.json'))
	autocmd VimEnter * CocInstall coc-sh
endif

" Theme setting
colorscheme bow-wob
let g:airline_theme='silver'

"" Transpearancy
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

"" Indicate 80 characters
highlight ColorColumn ctermbg=white
call matchadd('ColorColumn', '\%81v', 100)

"" Get rid of tilda at the end of file
au ColorScheme * highlight EndOfBuffer ctermfg=white ctermbg=none

set signcolumn=no
set updatetime=500
set background="light"
set go=a
set mouse=a
set nohlsearch
set nowrap
set hidden
set noshowmode
set cmdheight=2

set clipboard+=unnamedplus

" No highlit into normal mode
nnoremap <silent><ESC> :noh<CR><ESC>

" Map arrows keys to moving to beginning/end of line
imap <Left> <ESC>^
inoremap <Right> <ESC>$
nmap <Left> ^
nnoremap <Right> $
vmap <Left> ^
vnoremap <Right> $<Left>

" Convert tab to spaces
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab


" Some basics:
 	" nnoremap T :tabedit ./
	" nnoremap c "_c
    xnoremap <expr> p 'pgv"'.v:register.'y'
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
    " Set v$ to not include new line
    nnoremap v$ v$h
    " Set db to also delete the current word
    nnoremap db db2x
    " Map O to non-insert
    nnoremap O O<ESC>
    " Map Q to @q for recording playback
    nnoremap Q @q
    " Map Y to y$ for consistency with D
    noremap Y y$
    " Map Z for quick exit
    nnoremap <silent> Z ZZ
    " Ignore case in search
    set ignorecase
    set smartcase
    set shiftround

    " Add quotes for meancomma separated lists
    " vmap <silent> gw :s/\%V\([ A-Za-z()]\+\)\(,* *\)\%V/"\1"\2/g<CR>
    vmap <silent> gw :s/\%V\([^,]\+\)\(, \)\?\%V/"\1"\2/g<CR>
    " Automatically correct spelling errors
    nnoremap <silent> z= z=1<CR><CR>
    " Show correction options
    nnoremap <silent> z+ z=

    " Space after comma
    inoremap , ,<Space>

    " Auto-save
    let g:auto_save = 1
    let g:auto_save_in_insert_mode = 0
    let g:auto_save_silent = 1
    let g:auto_save_events = ["InsertLeave", "TextChanged"]
    set noswapfile
    function! CommandCabbr(abbreviation, expansion)
    execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
    endfunction

    command! -nargs=+ CommandCabbr call CommandCabbr(<f-args>)
    CommandCabbr q! u0\|wq

"Vimscript settings:
    autocmd FileType vim imap <si  <silent>
    autocmd Filetype vim nmap O O<ESC>x

" Goyo plugin makes text more readable when writing prose:
	map <silent> <leader>g :Goyo \| set bg=light \| set linebreak<CR>
    autocmd Filetype markdown autocmd! User GoyoEnter Limelight
    autocmd Filetype markdown autocmd! User GoyoLeave Limelight!
    let g:limelight_conceal_ctermfg = 'gray'


" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_gb<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitright

" Nerd tree
	map <F3> :NERDTreeToggle<CR>
    let NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 'h', 'keepopen':0, 'stay':0}, 'dir': {}}
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Replace all is aliased to S.
    nmap S :s/<c-r>=expand("<cword>")<cr>//g<left><left>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

let cmdline_map_start          = '<F1>'

" Bash terminal split
" " Use <ESC> to exit terminal
"     tnoremap <Esc> <C-\><C-n>
" Maximize current buffer
    nnoremap <silent> <leader>f <C-w>K<C-w>_

" Adjust buffer sizes
    nnoremap <silent>,r :windo wincmd K<CR>:windo wincmd K<CR>:resize 28<CR>
    nnoremap ,k <C-w>+
    nnoremap ,j <C-w>-
    nnoremap ,b :buffers<CR>
    nnoremap ,l :hide<CR>

" Shortcut for switching buffers
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    inoremap <C-h> <C-\><C-N><C-w>h
    inoremap <C-j> <C-\><C-N><C-w>j
    inoremap <C-k> <C-\><C-N><C-w>k
    inoremap <C-l> <C-\><C-N><C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

" Switch to vertical split
    nnoremap <silent><Leader>v :windo wincmd H<CR>:windo wincmd H<CR>

" EasyMotion settings
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    let g:EasyMotion_verbose = 0
    let g:EasyMotion_prompt = ''
    map f <Plug>(easymotion-fl)
    " Turn on case-insensitive feature
    let g:EasyMotion_smartcase = 1
    " JK motions: Line motions
    " map J <Plug>(easymotion-w)
    " " map K <Plug>(easymotion-b)

" Indentline
    " Keep current conceal settings
    let g:indentLine_setConceal = 0

    " set completeopt=noinsert,menuone
    set completeopt=noinsert,menuone
    set completeopt-=noselect
    set shortmess+=c

    set pumheight=7
    set previewheight=5
    let g:UltiSnipsExpandTrigger="<M-e>"
    let g:UltiSnipsJumpForwardTrigger="<Down>"
    let g:UltiSnipsJumpBackwardTrigger="<Up>"

    " inoremap <silent> <expr> ( (getline('.')[col('.')]=~"\[A-Za-z\]" ? "(<ESC>" : "()<left>")
    " inoremap <silent> <expr> [ (getline('.')[col('.')]=~"\[A-Za-z\]" ? "[<ESC>" : "[]<left>")
    inoremap <silent> <expr> ( (getline('.')[col('.') - 1]=~"\[A-Za-z0-9([{\]" ? "(<ESC>" : "()<left>")
    inoremap <silent> <expr> [ (getline('.')[col('.') - 1]=~"\[A-Za-z0-9([{\]" ? "[<ESC>" : "[]<left>")
    inoremap ) )<ESC>
    inoremap ] ]<ESC>


    autocmd Filetype r,rmd,python,haskell inoremap <silent><expr> "
        \ getline('.')[col('.') - 1]=~"\[A-Za-z\]" ? '"<ESC>' :
        \ getline('.')[col('.') - 2]=~"\[A-Za-z\]" ? '"<ESC>' :
        \ '""<left>'

    inoremap <expr> <BS> (getline('.')[col('.')-2: col('.')-1]=~"()" \|\|
                \ getline('.')[col('.')-2: col('.')-1]=~"[]" \|\|
                \ getline('.')[col('.')-2: col('.')-1]=~"{}" ? "<right><BS><BS>" : "<BS>")

" Cheatsheet settings
    let g:cheat40_use_default = 0

" R Settings
    " Common settings
    let R_debug = 0
    autocmd Filetype r,rmd nnoremap <silent> <Leader>db :!git grep -l 'browser()'\|xargs sed -i 's/browser()//g'<CR>
    autocmd Filetype r,rmd nnoremap <silent> gl :RSend load.project()<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap <silent> gL :RSend devtools::load_all()<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap <silent> <C-c> :RStop<CR>
    autocmd Filetype r,rmd nmap <silent> gD <Plug>(coc-definition)

    " Debug shortccuts
    autocmd Filetype r,rmd nnoremap <silent> gn :RSend n<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap <silent> gq :RSend Q<CR>:noh<CR>
    autocmd Filetype r,rmd nnoremap gb Obrowser()<ESC>==
    " Close R buffer on exiting vim
    autocmd Filetype r,rmd nnoremap <silent><expr> Z (len(getbufinfo({'buflisted':1})))== 1 ? "ZZZZ" : "ZZ"
    " Disable R terminal color
    let R_hl_term = 0
    " Check unique values
    autocmd Filetype r,rmd nmap <silent> gu :call RAction('unique')<CR>
    autocmd Filetype r,rmd vmap <silent> gu :call RAction('unique', 'v')<CR>
    autocmd Filetype r,rmd nmap <silent> gU :call RAction('lapply', ', unique')<CR>
    autocmd Filetype r,rmd vmap <silent> gU :call RAction('lapply', 'v',  ', unique')<CR>
    " Show documentation
    autocmd Filetype r,rmd nmap <silent> gh \rh
    " View structure
    autocmd Filetype r,rmd map <silent> gS :call RAction('str')<CR>
    autocmd Filetype r,rmd vmap <silent> gS :call RAction('str', 'v')<CR>
    " View names
    autocmd Filetype r,rmd map <silent> gs :call RAction('names')<CR>
    autocmd Filetype r,rmd vmap <silent> gs :call RAction('names', 'v')<CR>
    " Print
    autocmd Filetype r,rmd map <silent> gp \rp
    " Jump to next function
    autocmd Filetype r,rmd nmap <silent> [f /<- function(.*)<CR>
    autocmd Filetype r,rmd nmap <silent> ]f ?<- function(.*)<CR>
    " Map Enter to run selection in visual mode
    autocmd FileType r vmap <CR> \ss
    autocmd FileType rmd vmap <CR> \ss
    " Map to %>%
    autocmd Filetype r,rmd inoremap <M-m>  %>%
    " Disable assignment <- change
    let R_assign = 0
    " Map to <-
    autocmd Filetype r,rmd inoremap <M-->   <-<space>
    " Open R session when opening .R files
    autocmd FileType r,rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
    autocmd Filetype r,rmd set textwidth=75
    autocmd FileType r,rmd setlocal formatoptions-=t
    " Map <CR> to run line and down
    autocmd Filetype r,rmd nmap <silent> <CR> \d
    autocmd Filetype r nmap <silent> <F5> \su

" Rmarkdown settings
    " Load template for rmd
    autocmd BufNewFile *.rmd 0r ~/.config/nvim/skeleton.rmd
    " Run current chunk
    autocmd FileType rmd map <silent> <F4> \ce
    " Run current chunk and down
    autocmd FileType rmd map <silent> <F17> \ca
    " Run from the first chunk
    autocmd Filetype rmd nmap <silent> <F5> \ch
    " Map gk to knit(render markdown file according to header)
    autocmd Filetype rmd nmap gk \kr

" Python
    autocmd Filetype python let cmdline_map_send_paragraph = '<CR>'
    " Run from beginning
    autocmd Filetype python nmap <silent> <F17> maVgg<CR>'a
    " Run selection
    autocmd Filetype python vmap <buffer> <CR> <Space>
    " See docs
    autocmd Filetype python nmap gh K
    " Print
    autocmd Filetype python nmap gp viw<Space>
    autocmd Filetype python vmap gp <Space>
    " Debug
    autocmd Filetype python nnoremap gb Obreakpoint()<ESC>==
    autocmd Filetype python nmap <silent> gn <C-j>An<CR><ESC><C-k>
    autocmd Filetype python nmap <silent> gq <C-j>Aq<CR><ESC><C-k>
    " Terminate
    autocmd Filetype python nmap <silent> <buffer> <C-c> <C-j>A<C-c><ESC><C-k>
    " Open python automatically
    autocmd Filetype python normal <F1>,r
    " autocmd Filetype python nmap <silent> <buffer> gK <Plug>(kite-docs)
    " autocmd Filetype python nmap <silent> gh ghh<C-W>H
    let cmdline_follow_colorscheme = 1
    let cmdline_app           = {}
    let cmdline_app['python']     = 'ipython'
    let cmdline_app['wl']     = 'wolframscript'
    autocmd Filetype python nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Haskell
    " nmap gl :put =expand('%:t')<CR>i:load <ESC>dd<C-j>pA<CR><ESC><C-k>
    nmap gl <C-j>A:reload<CR><ESC><C-k>
    let cmdline_app['haskell']  = 'ghci'
    " Open automatically
    autocmd Filetype haskell normal \s,r
    " Run line
    " autocmd Filetype haskell silent! lcd %:p:h
    autocmd Filetype haskell nmap <silent> <buffer> <CR> V<Space>
    " Run from beginning
    autocmd Filetype haskell nmap <silent> <F17> maVgg<CR>'a
    " Run selection
    autocmd Filetype haskell vmap <buffer> <CR> <Space>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction
    autocmd Filetype haskell nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Bash
    let cmdline_app['sh']     = 'bash'
    " Run line
    autocmd Filetype sh nmap <silent> <buffer> <CR> <Space>
    " Run from beginning
    autocmd Filetype sh nmap <silent> <F17> maVgg<CR>'a
    " Run selection
    autocmd Filetype sh vmap <buffer> <CR> <Space>
    let cmdline_term_height = 24

" Zotcite
    let $ZCitationTemplate = '{Authors}_{Year}_{Title}'
    nmap <space> <Plug>ZCitationInfo

let $ZoteroSQLpath = '/home/lyh970817/Zotero/zotero.sqlite'
let $Zotcite_exclude = "note attachment"

" Markdown
    let g:mkdp_browser = ''
    let g:mkdp_page_title = ''
    let g:mkdp_command_for_global = 1
    autocmd BufNewFile,BufRead *.md set textwidth=80
    autocmd BufNewFile,BufRead *.md set wrapmargin=0
    autocmd BufNewFile,BufRead *.md set formatoptions+=t
    " autocmd BufNewFile,BufRead *.md set formatoptions+=a
    autocmd BufNewFile,BufRead *.md set linebreak
    au FileType markdown nnoremap gk :MarkdownPreview<CR>

    function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
    endfunction

    inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
    inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"    " Load template for markdown
"    autocmd BufNewFile *.md 0r ~/.config/nvim/skeleton.md
"    autocmd Filetype markdown nmap  :TOC<CR>
"    let g:pandoc#syntax#conceal#use = 0
"    let g:pandoc#folding#mode = 'relative'
"    let g:pandoc#folding#level = 6
"    let g:pandoc#folding#fold_yaml = 1
"    let g:pandoc#formatting#mode = "hA"
"    let g:pandoc#biblio#sources = "bcgyl"
"    " Need to install bibtool
"    let g:pandoc#biblio#use_bibtool = 1

" Ale setting
    let g:ale_echo_cursor = 0
    let g:ale_virtualtext_cursor = 1
    let g:ale_warn_about_trailing_blank_lines = 0
    let g:ale_change_sign_column_color = 1
    let g:ale_warn_about_trailing_whitespace = 0
    let g:ale_lint_delay = 200
    let g:ale_lint_on_insert_leave = 1
    " autocmd Filetype python let b:ale_fixers = ['yapf']
    autocmd Filetype r,rmd let b:ale_fixers = ['styler']
    autocmd Filetype r,rmd let b:ale_lintr = ['lintr']
    let g:ale_set_highlights = 1
    nmap <silent> <C-;> <Plug>(ale_previous)
    nmap <silent> <C-,> <Plug>(ale_next)
    autocmd Filetype r,rmd let g:ale_fix_on_save = 1
    autocmd Filetype r,rmd let g:ale_r_lintr_options = 'lintr::with_defaults(line_length_linter = NULL, trailing_blank_lines_linter = NULL, trailing_whitespace_linter = NULL)'

" autocmd Filetype markdown imap <CR> <ESC>maVgggq`aa<CR>

" au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>
" au FileType markdown map <Bar> vip :EasyAlign*<Bar><Enter>

set t_Co=256

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" Coc completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Vimwiki
let g:vimwiki_list = [{'path':'~/Yandex.Disk/VimWiki', 'path_html':'~/Yandex.Disk/VimWiki/exports'}]

" fzf
nnoremap <Leader>s :Rg<CR>

" Replace word in entire file
nnoremap <Leader>S :%s/\<<c-r><c-w>\>//g\|norm!``<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
" set enc=utf8
" set fencs=utf8,gbk,gb2312,gb18030

