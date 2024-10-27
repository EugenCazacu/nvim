local opt = vim.opt
vim.cmd("let g:netrw_liststyle = 3")
opt.number=true
opt.relativenumber=true

opt.tabstop=8
opt.softtabstop=4
opt.shiftwidth=4
opt.expandtab=true
opt.smarttab=true
opt.cursorline=true

opt.incsearch=true
opt.hlsearch=true
opt.ignorecase=true
opt.smartcase=true

opt.wrap=true

opt.swapfile=false
opt.backup=false
opt.undodir=os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile=true

opt.termguicolors=true

opt.scrolloff=8

vim.cmd([[autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s]])
vim.cmd([[autocmd FileType lua setlocal commentstring=--\ %s]])
vim.cmd([[autocmd FileType c,cpp, set formatprg=clangformat]])
