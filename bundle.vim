"----------------------------------------------------------------------
" packages begin
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = []
endif

let g:bundle_enabled = {}
for key in g:bundle_group | let g:bundle_enabled[key] = 1 | endfor
let s:enabled = g:bundle_enabled


" call plug#begin()
call plug#begin('~/.vim/bundles')


"----------------------------------------------------------------------
" package group - simple
"----------------------------------------------------------------------
if has_key(s:enabled, 'simple')
    Plug 'easymotion/vim-easymotion'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'LunarWatcher/auto-pairs'
    Plug 'justinmk/vim-dirvish'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-surround'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'ghifarit53/tokyonight-vim'

    IncScript site/bundle/asyncrun.vim
endif


"----------------------------------------------------------------------
" package group - basic
"----------------------------------------------------------------------
if has_key(s:enabled, 'basic')
    Plug 'mhinz/vim-startify'
    Plug 'tommcdo/vim-lion'

    Plug 'tbastos/vim-lua', { 'for': 'lua' }
    Plug 'vim-python/python-syntax', { 'for': ['python'] }
    Plug 'pboettch/vim-cmake-syntax', { 'for': ['cmake'] }
    Plug 'skywind3000/vim-flex-bison-syntax', { 'for': ['yacc', 'lex'] }
    Plug 'preservim/vim-markdown'

    Plug 'skywind3000/vim-dict'
    Plug 'dag/vim-fish'

	Plug 'kana/vim-textobj-user'
	" Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-syntax'
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
	Plug 'sgur/vim-textobj-parameter'
	Plug 'bps/vim-textobj-python', {'for': 'python'}
	Plug 'jceb/vim-textobj-uri'

	Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	IncScript site/bundle/nerdtree.vim

    Plug 'preservim/tagbar'
	IncScript site/bundle/tagbar.vim

	if !has_key(s:enabled, 'syntax-extra')
		Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
	else
		Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
	endif

	if has('python3') || has('python')
		Plug 'Yggdroot/LeaderF'
		Plug 'tamago324/LeaderF-filer'
		Plug 'voldikss/LeaderF-emoji'
		IncScript site/bundle/leaderf.vim
	else
		Plug 'ctrlpvim/ctrlp.vim'
		Plug 'tacahiroy/ctrlp-funky'
		let g:ctrlp_map = ''
		noremap <c-p> :cclose<cr>:CtrlP<cr>
		noremap <c-n> :cclose<cr>:CtrlPMRUFiles<cr>
		noremap <m-p> :cclose<cr>:CtrlPFunky<cr>
		noremap <m-n> :cclose<cr>:CtrlPBuffer<cr>
	endif

	" let g:cpp_class_scope_highlight = 1
	let g:cpp_member_variable_highlight = 1
	let g:cpp_class_decl_highlight = 1
	" let g:cpp_experimental_simple_template_highlight = 1
	let g:cpp_concepts_highlight = 1
	" let g:cpp_no_function_highlight = 1
	let g:cpp_posix_standard = 1

	let g:python_highlight_builtins = 1
	let g:python_highlight_builtin_objs = 1
	let g:python_highlight_builtin_types = 1
	let g:python_highlight_builtin_funcs = 1
endif


"----------------------------------------------------------------------
" package group - huge
"----------------------------------------------------------------------
if has_key(s:enabled, 'huge')
    Plug 'kshenoy/vim-signature'
    Plug 'mhinz/vim-signify'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    " Plug 'jceb/vim-orgmode', { 'for': 'org' }
    Plug 'francoiscabrol/ranger.vim'
    Plug 'sbdchd/neoformat'
	Plug 'dense-analysis/ale'
	Plug 'Shougo/echodoc.vim'
	let g:echodoc#enable_at_startup = 1

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	IncScript site/bundle/vim-go.vim

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
      Plug 'Shougo/deoplete-clangx'
    endif
    let g:deoplete#enable_at_startup = 1

	IncScript site/bundle/ale.vim

    let g:ranger_map_keys = 0

	let g:gutentags_modules = []
	if executable('ctags')
		let g:gutentags_modules += ['ctags']
	endif
	if executable('gtags-cscope') && executable('gtags')
		let g:gutentags_modules += ['gtags_cscope']
	endif
	if len(g:gutentags_modules) > 0
		" Plug 'ludovicchabant/vim-gutentags'
		Plug 'skywind3000/vim-gutentags'
	endif

endif


"----------------------------------------------------------------------
" package group - opt
"----------------------------------------------------------------------
if has_key(s:enabled, 'opt')
    Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
    Plug 'voldikss/vim-translator'
    Plug 'dhruvasagar/vim-table-mode'

	if 1
		" Echo translation in the cmdline
		nmap <silent> <Leader>tt <Plug>Translate
		vmap <silent> <Leader>tt <Plug>TranslateV
		" Display translation in a window
		nmap <silent> <Leader>tw <Plug>TranslateW
		vmap <silent> <Leader>tw <Plug>TranslateWV
		" Replace the text with translation
		nmap <silent> <Leader>tr <Plug>TranslateR
		vmap <silent> <Leader>tr <Plug>TranslateRV
		let g:translator_window_enable_icon = v:true
	endif
endif


"----------------------------------------------------------------------
" modules
"----------------------------------------------------------------------

" coc
if has_key(s:enabled, 'coc')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	IncScript site/bundle/coc.vim
endif

" vim-lsp
if has_key(s:enabled, 'lsp')
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete-buffer.vim'
	Plug 'prabirshrestha/asyncomplete-tags.vim'
	Plug 'jsit/asyncomplete-user.vim'
	IncScript site/bundle/lsp.vim
endif

" vimspector
if has_key(s:enabled, 'vimspector')
	Plug 'puremourning/vimspector'
	IncScript site/bundle/vimspector.vim
endif

" vimwiki
if has_key(s:enabled, 'vimwiki')
	Plug 'vimwiki/vimwiki'
	IncScript site/bundle/vimwiki.vim
endif

if has_key(s:enabled, 'grammer')
	Plug 'rhysd/vim-grammarous'
	noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
	map <space>rr <Plug>(grammarous-open-info-window)
	map <space>rv <Plug>(grammarous-move-to-info-window)
	map <space>rs <Plug>(grammarous-reset)
	map <space>rx <Plug>(grammarous-close-info-window)
	map <space>rm <Plug>(grammarous-remove-error)
	map <space>rd <Plug>(grammarous-disable-rule)
	map <space>rn <Plug>(grammarous-move-to-next-error)
	map <space>rp <Plug>(grammarous-move-to-previous-error)
endif

if has_key(s:enabled, 'neomake')
	Plug 'neomake/neomake'
endif

if has_key(s:enabled, 'vista')
	Plug 'liuchengxu/vista.vim'
endif

if has_key(s:enabled, 'neocomplete')
	Plug 'Shougo/neocomplete.vim'
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 2
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-g><C-g> neocomplete#undo_completion()
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	endfunction
endif

if has_key(s:enabled, 'lh-cpp')
	Plug 'LucHermitte/lh-vim-lib'
	Plug 'LucHermitte/lh-style'
	Plug 'LucHermitte/lh-tags'
	Plug 'LucHermitte/lh-dev'
	Plug 'LucHermitte/lh-brackets'
	Plug 'LucHermitte/searchInRuntime'
	Plug 'LucHermitte/mu-template'
	Plug 'tomtom/stakeholders_vim'
	Plug 'LucHermitte/alternate-lite'
	Plug 'LucHermitte/lh-cpp'
endif


call plug#end()
