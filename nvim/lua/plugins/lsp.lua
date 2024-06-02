local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<Leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>gl', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[a', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']a', function() vim.diagnostic.goto_prev() end, opts)

    lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup();

-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
-- LspInstall
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'pyright',
        'lua_ls',
        'texlab',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        lua_ls = function()
            -- Fix Undefined global 'vim'
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                    },
                },
            })
        end,
    },
})


local cmp = require('cmp')
local ls = require('luasnip')

ls.filetype_extend('all', { '_' })
require('luasnip.loaders.from_snipmate').lazy_load({ path = { '~/.config/nvim/snippets' } })

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<M-e>'] = cmp.mapping.abort(),
        ['<M-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<M-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),

        vim.keymap.set({"i", "s"}, "<Tab>",
        function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
            end
        end,
        {silent = true}),

        vim.keymap.set({"i", "s"}, "<C-a>", function() ls.jump( 1) end, {silent = true}),
        vim.keymap.set({"i", "s"}, "<S-C-a>", function() ls.jump(-1) end, {silent = true}),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})
