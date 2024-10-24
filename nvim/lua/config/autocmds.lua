-- keymap for .cpp file
vim.api.create_autcmd = vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.cpp' },
    callback = function()
        vim.keymap.set(
        'n',
        '<Leader>9',
        ':w<CR> :vert term g++ -Wall -Wextra -Wshadow -ggdb3 -D_GLIBCXX_ASSERTIONS -fmax-errors=2 -fsanitize=undefined -DDEBUG -static -O2 -std=c++23 "%:~" -o "%:~:r.exe" && "%:~:r.exe"<CR> i',
        { silent = true }
        )
    end,
})

-- keymap for .c file
vim.api.create_autcmd = vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.c' },
    callback = function()
        vim.keymap.set(
        'n',
        '<Leader>9',
        ':w<CR> :vert term gcc -Wall -Wextra -Wshadow "%:~" -o "%:~:r.exe" && "%:~:r.exe"<CR> i',
        { silent = true }
        )
    end,
})
