set tabstop=4 softtabstop=4
set shiftwidth=4 set expandtab
set smartindent
set guicursor=
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ignorecase
set smartcase

set scrolloff=8
set termguicolors

" Give mor space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000ms) leads to noticable
" delays and poor user experience
set updatetime=50

set clipboard=unnamed " yank from vim to OSX clipboard
set autoread "Reload files changed outside vim

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points



" fold text
set foldenable          " enable folding
set foldmethod=indent
set foldlevelstart=10   " opens most folds by default
set foldnestmax=10      " 10 nested folds maximum
" space opens/closes folds
noremap <S-space> za

call plug#begin('~/.vim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-endwise'
Plug 'mbbill/undotree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vimwiki/vimwiki'

Plug 'vim-test/vim-test'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"C++ compliler
Plug 'cdelledonne/vim-cmake'
if has('nvim')
	Plug 'antoinemadec/FixCursorHold.nvim'
endif

call plug#end()


" Vim Wiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Setup gruvbox
colorscheme gruvbox
highlight Normal guibg=none

" Remap
let mapleader=" "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Configure fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gc :GBranches<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Sex!<CR>

" Terminal Remap
tnoremap <Esc> <C-\><C-n>

" vim-test
nmap <silent> <leader>tn :w<CR>:TestNearest<CR>
nmap <silent> <leader>tf :w<CR>:TestFile<CR>
nmap <silent> <leader>ts :w<CR>:TestSuite<CR>
nmap <silent> <leader>tsf :w<CR>:TestSuite --fail-fast<CR>
nmap <silent> <leader>tl :w<CR>:TestLast<CR>
nmap <silent> <leader>tv :w<CR>:TestVisit<CR>
if has('nvim')
  let test#strategy = "neovim"
  let test#neovim#term_position = "belowright vertical"
else
  let test#strategy = "vimterminal"
endif
let test#ruby#runner = 'rspec'

" Telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>bf <cmd>lua require('telescope.builtin').buffers()<cr>

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>
"

" vim-fugitive maping
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gd :diffget //2<CR>

nmap <leader>gt :G stash<CR>
nmap <leader>gt1 :G stash apply 1<CR>
nmap <leader>gt2 :G stash apply 2<CR>
nmap <leader>gt3 :G stash apply 3<CR>
nmap <leader>gt4 :G stash apply 4<CR>
nmap <leader>gt5 :G stash apply 5<CR>

"C++ compiler
let g:cmake_link_compile_commands = 1

nmap <leader>cg :CMakeGenerate<CR>
nmap <leader>cb :CMakeBuild<CR>

"Collapse text
set foldmethod=indent
set foldlevelstart=10   " opens most folds by default
set foldnestmax=10      " 10 nested folds maximum
" end opens/closes folds
noremap <end> za
