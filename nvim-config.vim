""" Ethan Leba's radical nvim config """

call plug#begin()
" --- General ---
" Lightbar
Plug 'itchyny/lightline.vim'
" Linter
Plug 'dense-analysis/ale'
" Git integration
Plug 'tpope/vim-fugitive'
" Show git conflicts in gutter
Plug 'airblade/vim-gitgutter'
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
" TOML highlighting for those ill pyproject.tomls
Plug 'cespare/vim-toml'
" Make swapping args ez
" Plug 'machakann/vim-swap'
" --- Python ---
" Semantic highlighting for Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Python autocomplete
Plug 'davidhalter/jedi-vim'
call plug#end()

" --- My keybindings ---
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>sf :vsp<CR>:GFiles<CR>
nnoremap <Leader>dc :Files ~/Documents/<CR>
nnoremap <Leader>sdc :vsp<CR>:Files ~/Documents/<CR>

" Disable search highlighting
noremap <ESC> :noh<CR><ESC>
" Exiting terminal
tnoremap <ESC> <C-\><C-n>
" Easyclip takes over m for move,
let g:EasyClipUseSubstituteDefaults = 1
" So we're rebinding mark here
nnoremap gm m
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Git bindings
nnoremap gs :Git<CR>
nnoremap gc :Gclog<CR>
nnoremap gd :Gdiff master<CR>
nnoremap gt :Git mergetool<CR>

" -- Nvim config --
" Enables the line numbers
" set number
" set relativenumber

" -- ALE config --
let g:ale_fixers = {'javascript': ['prettier', 'eslint'],
                \   'python' : ['black', 'reorder-python-imports'],
                \}
" MYPY has trouble finding imports (at least with my starry workflow)
let g:ale_python_mypy_options = "--ignore-missing-imports"
let g:ale_linters = {'clojure': ['clj-kondo']}
let g:ale_fix_on_save = 1

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

" Folds
set foldmethod=indent
set foldnestmax=2
set foldlevel=99
