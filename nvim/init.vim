call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'folke/which-key.nvim'

call plug#end()

set relativenumber
set nowrap

filetype plugin indent on
syntax on

colorscheme nord

" Code action on <leader>a
vmap <leader>ca <Plug>(coc-codeaction-selected)<CR>
nmap <leader>ca <Plug>(coc-codeaction-selected)<CR>

" Format action on <leader>f
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
" Goto definition
nmap <leader>cd <Plug>(coc-definition)
" Open definition in a split window
nmap <leader>cv :vsp<CR><Plug>(coc-definition)<C-h>L
" Open Nerd Tree
nmap <leader>ntt :NERDTreeToggle<CR>
" Telescope find files
nmap <leader>tf :Telescope find_files<CR>
" Telescope find buffer
nmap <leader>tb :Telescope buffers<CR>
" Telescope grep string
nmap <leader>tg :Telescope grep_string<CR>
" Telescope live grep
nmap <leader>tl :Telescope live_grep<CR>
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
