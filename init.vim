if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')
 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 
 " Airline themes
 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')

 " Wakatime - Code hours analytics
 call dein#add('wakatime/vim-wakatime')

 " Languages
 call dein#add('chemzqm/vim-jsx-improve')
 call dein#add('pangloss/vim-javascript')
 call dein#add('jparise/vim-graphql')
 call dein#add('isRuslan/vim-es6')
 call dein#add('carlitux/deoplete-ternjs')

 " Code Tree
 call dein#add('scrooloose/nerdtree')
 call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
 
 " Tree icons
 call dein#add('ryanoasis/vim-devicons')

 " Code Utilities
 call dein#add('ctrlpvim/ctrlp.vim')
 call dein#add('jiangmiao/auto-pairs')
 call dein#add('gavocanov/vim-js-indent')
 call dein#add('w0rp/ale')
 call dein#add('mattn/emmet-vim')
 call dein#add('styled-components/vim-styled-components')
 call dein#add('vim-scripts/FuzzyFinder')
 call dein#add('vim-scripts/L9')

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

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Mouse support
if has('mouse')
  set mouse=a
endif

set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings
set shiftwidth=2               " │ http://vimcasts.org/e/2

" nerdtree
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

let NERDTreeShowHidden=1


" key mappings

let mapleader=","

inoremap jk <esc>

set backspace=indent
set backspace+=eol
set backspace+=start

set nobackup
set nowb
set noswapfile

set ai
set si

set clipboard=unnamed
" -------------------------------------- 
"          KEY MAPPINGS 
" --------------------------------------

nnoremap <leader>s :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :u<CR>
nnoremap <leader>b :NERDTreeToggle<CR> 
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>n :tabnew<cr>
nnoremap <leader>w :tabclose<cr>
nnoremap <leader><tab> :tabnext<cr>

set cursorline
set number

" Color system and scheme

set termguicolors
colorscheme palenight
set background=dark


" CTRL P 
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

" Completion
let g:ale_completion_enabled = 1

" Javascript Settings
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" ALE Language Server
let b:ale_linters = ['eslint', 'flow']
let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_javascript_flow_executable = 'flow'
let g:ale_javascript_flow_use_global = 0
let g:ale_javascript_flow_use_home_config = 0
let g:ale_change_sign_column_color = 0
let g:ale_command_wrapper = ''
let g:ale_completion_delay = 100
let g:ale_completion_enabled = 0
let g:ale_completion_max_suggestions = 50
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_echo_msg_info_str = 'Info'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_fix_on_save = 0
let g:ale_fixers = {}
let g:ale_history_enabled = 1
let g:ale_history_log_output = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 0
let g:ale_linter_aliases = {}
let g:ale_linters_explicit = 0
let g:ale_list_window_size = 10
let g:ale_list_vertical = 0
let g:ale_loclist_msg_format = '%linter% says %s'
let g:ale_max_buffer_history_size = 20
let g:ale_max_signs = -1
let g:ale_maximum_file_size = 0
let g:ale_open_list = 0
let g:ale_pattern_options = {}
let g:ale_pattern_options_enabled = 0
let g:ale_set_balloons = 1
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = 'X'
let g:ale_sign_info = '?'
let g:ale_sign_offset = 1000000
let g:ale_sign_style_error = 'X'
let g:ale_sign_style_warning = '?'
let g:ale_sign_warning = '?'
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_type_map = {}
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1 

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
