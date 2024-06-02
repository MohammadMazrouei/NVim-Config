local function map(mode, lhs, rhs, opts)
   -- set default value if not specify
   if opts.noremap == nil then
      opts.noremap = true
   end
   if opts.silent == nil then
      opts.silent = true
   end

   vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- better up/down
vim.keymap.set({ 'n', 'x' }, 'j', function()
   return vim.v.count > 0 and 'j' or 'gj'
end, { expr = true })
vim.keymap.set({ 'n', 'x' }, 'k', function()
   return vim.v.count > 0 and 'k' or 'gk'
end, { expr = true })

map('n', '<C-u>', '<C-u>zz', {})
map('n', '<C-d>', '<C-d>zz', {})
map('n', '<C-b>', '<C-b>zz', {})
map('n', '<C-f>', '<C-f>zz', {})

-- window movements
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-l>', '<C-w>l', {})
map('n', '<C-c>', '<C-w>c', {})

-- system clipboard
map({ 'n', 'v' }, '<Leader>y', '"+y', {})
map({ 'n' }, '<Leader>Y', '"+y$', {})

map({ 'n', 'v' }, '<Leader>p', '"+p', {})
map({ 'n', 'v' }, '<Leader>P', '"+P', {})

-- delete
map({"n", "v"}, "<Leader>d", [["_d]], {})

-- line movments
map('v', 'J', ':m \'>+1<CR>gv=gv', {})
map('v', 'K', ':m \'<-2<CR>gv=gv', {})

-- personal 
map('i', 'jk', '<Esc>', {})
map('n', '<Leader>w', ':w<CR>', {})
map('n', '<Leader>q', ':q<CR>', {})
map('n', '<Leader>i', '<C-i>', {})
map('n', '<Leader>o', '<C-o>', {})
map('n', '<Leader>r', '<C-r>', {})
map('n', '<Leader>a', 'ggVG', {})
map('i', '{<CR>', '{<CR>}<Esc>O', {})

map('n', 'J', 'mzJ`z', {})
map('n', 'n', 'nzzzv', {})
map('n', 'N', 'Nzzzv', {})

--map('n', '-', vim.cmd.Ex, {})
map('n', '<Leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})

map('n', '<Leader>;', ':2wincmd c<CR>', {})
