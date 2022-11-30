call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'folke/which-key.nvim'

call plug#end()

set number
set nowrap

filetype plugin indent on
syntax on

colorscheme nord

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
  local wk = require("which-key")
  wk.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  wk.register({
    c = {
	    name = "coc",
	    a = { "<Plug>(coc-codeaction-selected)<CR>", "code action" },
	    f = { "<Plug>(coc-format-selected)", "format selected" },
	    d = { "<Plug>(coc-definition)", "goto def" },
	    v = { ":vsp<CR><Plug>(coc-definition)<C-h>L", "goto def new window"}
    },
    n = {
	    name = "NERDTree",
	    t = { ":NERDTreeToggle<CR>", "toggle" }
    },
    t = {
	    name = "Telescope",
 	    f = { ":Telescope find_files<CR>", "find files" },
	    b = { ":Telescope buffers<CR>", "buffers" },
	    g = { ":Telescope grep_string<CR>", "grep string" },
	    l = { ":Telescope live_grep<CR>", "live grep" },
  }, { prefix = "<leader>" }})
EOF
