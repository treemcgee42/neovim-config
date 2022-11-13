" Useful default vim commands:
" 	'vie'		select inside environment
" 	'vae'		select entire environment

set number

set autoindent

set tabstop=4
set shiftwidth=4

set mouse=a

inoremap ii <Esc>
:command T NeoTreeFloatToggle

" use more efficient lua implementation
" let g:do_filetype_lua = 1
" let g:did_load_filetypes = 0

lua require "my_configs.plugins"
nnoremap <leader>xx <cmd>TroubleToggle<cr>
" expands trouble error
" nnoremap <space>e <cmd>lua vim.diagnostic.open_float()<CR>
lua require "my_configs.colorscheme"
lua require "my_configs.ccls_config"
lua require "my_configs.cmp_config"
lua require "my_configs.lsp_confg"
lua require "my_configs.treesitter_config"
lua require "my_configs.lualine_config"
lua require "my_configs.barbar_config"
lua require "my_configs.fterm_config"
lua require "my_configs.nvim-snippy_config"

lua require('mini.sessions').setup()
lua require('mini.starter').setup()

"lua require'lspconfig'.rust_analyzer.setup({})
" lua require('rust-tools').setup({})
"lua require'lspconfig'.ccls.setup{}

lua require('nvim-autopairs').setup{}

" AUTOFORMATTING
"let g:neoformat_cpp_clangformat = {
"    \ 'exe': 'clang-format',
"    \ 'args': ['--style="{IndentWidth: 4}"']
"\}
"let g:neoformat_enabled_cpp = ['clangformat']
"let g:neoformat_enabled_c = ['clangformat']

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" -----------------
" ----- LaTeX ----- 
" -----------------
"
" Issues:
" 	- no autocomplete
"
" Notes:
" 	- the default fold method is set to 'marker'. To insert a fold, you 
" 	could do something like this:
" 			| % description of fold content {{{
" 			| 	...
" 			| % }}}
" 	- shortcut to begin document: `defdoc` pulls up a snippet (this and 
" 	other snippets are defined in custom-snippets/tex.snippets)
"
" Useful commands:
" 	\ll		toggle compile-on-save
" 	cse		change an environment
" 	dse		delete an environment
" 	tse		toggle starred and no-star environment
" 	]]		in insert mode, generate end environment tag
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_open_on_warning = 0

