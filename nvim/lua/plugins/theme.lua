require('catppuccin').setup({
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    background = {
        dark = 'mocha',
    },
})

require('dracula').setup({
    disable_background = true
})

function Theme(color)
    color = color or 'dracula'
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Theme()
