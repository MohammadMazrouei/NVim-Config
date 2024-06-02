-- keymap for .cpp file
vim.api.create_autcmd = vim.api.nvim_create_autocmd("BufEnter", {
   pattern = { "*.cpp" },
   callback = function()
      vim.keymap.set(
         "n",
         "<Leader>9",
         "<cmd>w<CR>:vert term g++ -static -DDEBUG -lm -s -x c++ -Wall -Wextra -O2 -std=c++20 -o %:r %<CR>",
         { silent = true }
      )
   end,
})
