" -- ENTRY POINT --
" No vi compatibility necessary
set nocompatible
filetype off
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif


  " Start screen
  call dein#add('mhinz/vim-startify')

  " Airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Git
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  " Editing utilities
  call dein#add('mkitt/tabline.vim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('gavocanov/vim-js-indent')
  call dein#add('Yggdroot/indentLine')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('vim-syntastic/syntastic')

  " Statistics
  call dein#add('wakatime/vim-wakatime')

  " NerdTree
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

    " (Programming) languages support
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('isRuslan/vim-es6')
  call dein#add('slashmili/alchemist.vim')

  " Colorschemes
  call dein#add('flazz/vim-colorschemes')
  call dein#add('whatyouhide/vim-gotham')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('joshdick/onedark.vim')
  call dein#add('rakr/vim-one')
  call dein#add('drewtempelmeyer/palenight.vim')
  call dein#add('ashfinal/vim-colors-violet')
  call dein#add('NLKNguyen/papercolor-theme')
  call dein#add('Yggdroot/duoduo')
  call dein#add('liuchengxu/space-vim-dark')

  call dein#add('ryanoasis/vim-devicons')

  call dein#add('let-def/vimbufsync')

  " Cool Hacks <3
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('alexlafroscia/deoplete-flow')
  call dein#add('w0rp/ale')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('Shougo/denite.nvim')

  " Snippets
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')


  " End of the installation script
  call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable`

" -- EDITOR SETTINGS --

" Use custom separator for inner windows
set fillchars=vert:│

" i18n and charset
let lang='en'
set langmenu=en
set encoding=utf8
set ffs=unix,dos,mac

" Ignored folders
set wildignore+=*/node_modules/*,*/dist/*,*/public/*,coverage

" Mouse support
if has('mouse')
  set mouse=a
endif

" Additional runtime files and syntax highlighting
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
filetype plugin indent on
syntax enable

" Improve editing and searching
set backspace=eol,start,indent
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set ai
set si
set wrap
set magic
set history=500
set so=0
set wildmenu
set ruler
set lbr
set tw=500
set nu
set numberwidth=5
set conceallevel=1

" Avoid creating temporary files
set nobackup
set nowb
set noswapfile

" But use viminfo

" Convert tabs to spaces
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Make arrows work
set ww+=<,>

" Color system and scheme
set t_Co=256
set termguicolors
colorscheme space-vim-dark
set background=dark

" -- AUTOMATIC COMMANDS --

" Load NerdTree
" Ensure NERDTree is open
function! s:isOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Reveal NERDTree file on open it
function! s:reveal()
  if &modifiable && s:isOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" au VimEnter * NERDTree
au BufEnter * call s:reveal()

" Focus on editor instead of NerdTree
au VimEnter * wincmd p

" Kill trailing whitespace on save
au BufWritePre * StripWhitespace

" Convert `.md' files for Markdown instead of Modula 2
au BufRead,BufNewFile *.md set filetype=markdown

" Error messages
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%120v.\+', -1)

" Run Startify on new tabs
au VimEnter * let t:startify_new_tab = 1
au BufEnter *
    \ if !exists('t:startify_new_tab') && empty(expand('%')) |
    \   let t:startify_new_tab = 1 |
    \   Startify |
    \ endif

" Map Coq commands
au FileType coq call coquille#CoqideMapping()

" Map TypeScript commands
autocmd FileType typescript nmap <buffer> <Leader>t :<C-u>echo tsuquyomi#hint()<CR>

" -- KEYBOARD SHORTCUTS --

nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-T> :tabnew<CR>
nnoremap <C-W> :q<CR>
nnoremap <C-Q> :q!<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-B> :NERDTreeToggle<CR>

" Save with <C-S> and update git gutter
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
                           \|:GitGutter
nnoremap <silent> <C-S> :<C-u>Update<CR>

" -- GUI SETTINGS --

" Startify
let g:startify_fortune_use_unicode = 1

" WebDevIcons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" NerdTree
let g:NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeIgnore = ['node_modules', 'public', 'coverage']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
hi NERDTreeOpenable guifg=#27CBC0
hi NERDTreeClosable guifg=#DA3C78

" Syntastic
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\uf071"

" Syntastic
hi SyntasticErrorLine ctermbg=161
hi SyntasticErrorSign ctermbg=161 ctermfg=White cterm=Bold
hi SyntasticWarningSign ctermbg=178 ctermfg=White cterm=Bold

" Airline
let g:airline_left_sep = "\ue0b8"
let g:airline_right_sep = "\ue0ba"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'violet'
let g:airline#extensions#syntastic#error_symbol = "\u2717"
let g:airline#extensions#syntastic#warning_symbol = "\uf071"
let g:airline#extensions#syntastic#stl_format_err = ' %e'
let g:airline#extensions#syntastic#stl_format_warn = ' %w'
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%p%%'])
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . " \uE0A3" . '%{col(".")}'])

" Tabs
hi TabLine guibg=#333333 guifg=#CCCCCC
hi TabLineSel guibg=#2980B9 guifg=#FFFFFF cterm=Bold

" Highlight current line number
set cursorline

" Omit '~'
" highlight NonText ctermfg=bg guifg=bg

" Indent guides (with indent line)
let g:indentLine_color_term = 128
let g:indentLine_color_gui = '#7E349D'
let g:indentLine_concealcursor = 0
let g:indentLine_fileTypeExclude = ['nerdtree']

" Git gutter symbols and colors
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified = '~~'
hi GitGutterAdd ctermfg=34 ctermfg=White guifg=#FFFFFF guibg=#2ECC71 cterm=Bold
hi GitGutterDelete ctermbg=161 ctermfg=White guifg=#FFFFFF guibg=#E74C3C cterm=Bold
hi GitGutterChange ctermbg=32 ctermfg=White guifg=#FFFFFF guibg=#2980B9 cterm=Bold

" -- LANGUAGE SETTINGS --

" Autocomplete
let g:deoplete#enable_at_startup = 1

" JavaScript
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" TypeScript
let g:tsuquyomi_completion_detail = 1

" UntiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories = ['/Users/lxspandora/.vim/UltiSnips']
