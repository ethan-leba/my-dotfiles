""" Ethan Leba's radical nvim config """

call plug#begin()
" --- General ---
" Lightbar
Plug 'itchyny/lightline.vim'
" Linter
Plug 'dense-analysis/ale'
" Filesystem
Plug 'preservim/nerdtree'
" Git integration
Plug 'tpope/vim-fugitive'
" Same keybinds for vim and tmux
Plug 'christoomey/vim-tmux-navigator'
" Better surrounding
Plug 'machakann/vim-sandwich'
" Highlighted yank
Plug 'machakann/vim-highlightedyank'
" EasyClip
Plug 'svermeulen/vim-easyclip'
" NO JHKL
Plug 'takac/vim-hardtime'
" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" --- Python ---
" Semantic highlighting for Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Python autocomplete
Plug 'davidhalter/jedi-vim'
call plug#end()

" --- My keybindings ---
nnoremap <Leader>f :GFiles<CR>
" Disable search highlighting
noremap <ESC> :noh<CR><ESC>
" Easyclip takes over m for move,
let g:EasyClipUseSubstituteDefaults = 1
" So we're rebinding mark here
nnoremap gm m
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" -- Nvim config --
" Enables the line numbers
set number
set relativenumber

" -- ALE config --
let b:ale_fixers = {'javascript': ['prettier', 'eslint'],
                \    'python' : ['black'],
                \}
let g:ale_linters = {'clojure': ['clj-kondo']}
let g:ale_fix_on_save = 1

