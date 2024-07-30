-- keymap for .cpp file
vim.api.create_autcmd = vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.cpp" },
    callback = function()
        vim.keymap.set(
        "n",
        "<Leader>9",
        ":w<CR> :vert term g++ -static -DDEBUG -lm -s -x c++ -Wall -Wextra -O2 -std=c++20 -o %:r % && ./%:r<CR> i",
        { silent = true }
        )
    end,
})
