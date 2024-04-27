return {
    "neoclide/coc.nvim",
    -- ft = { "java", "javascript", "typescript", "lua", "c", "jsx", "tsx", "css", "html" },
    event = 'BufEnter',
    config = function()
        local keyset = vim.keymap.set
        local opts = { silent = true, nowait = true, expr = true }
        -- Make <CR> to accept selected completion item or notify coc.nvim to format
        vim.api.nvim_set_keymap("i", '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"',
            { expr = true, noremap = true, silent = true })

        keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
        keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

        keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
        keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
        keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
        keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

        function _G.show_docs()
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                vim.api.nvim_command('h ' .. cw)
            elseif vim.api.nvim_eval('coc#rpc#ready()') then
                vim.fn.CocActionAsync('doHover')
            else
                vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
            end
        end

        -- Use K to show documentation in preview window

        keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })


        -- Key mappings for scrolling within coc.nvim's floating window
        keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
        keyset("i", "<C-f>",
            'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
        keyset("i", "<C-b>",
            'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
        keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
        keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

        vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
        -- Automatically format code on save
        -- vim.cmd(
        --     [[ autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.scss,*.html,*.vue call CocAction('format') ]])
        -- Autocomplete
        function _G.check_back_space()
            local col = vim.fn.col('.') - 1
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
        vim.api.nvim_create_augroup("CocGroup", {})
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "CocGroup",
            command = "silent call CocActionAsync('highlight')",
            desc = "Highlight symbol under cursor on CursorHold"
        })
        keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
        -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
        vim.api.nvim_create_augroup("CocGroup", {})
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "CocGroup",
            command = "silent call CocActionAsync('highlight')",
            desc = "Highlight symbol under cursor on CursorHold"
        })


        local remap = vim.api.nvim_set_keymap
        local npairs = require('nvim-autopairs')
        npairs.setup({ map_cr = false })

        -- skip it, if you use another global object
        _G.MUtils = {}

        -- old version
        -- MUtils.completion_confirm=function()
        -- if vim.fn["coc#pum#visible"]() ~= 0 then
        -- return vim.fn["coc#_select_confirm"]()
        -- else
        -- return npairs.autopairs_cr()
        -- end
        -- end

        -- new version for custom pum
        MUtils.completion_confirm = function()
            if vim.fn["coc#pum#visible"]() ~= 0 then
                return vim.fn["coc#pum#confirm"]()
            else
                return npairs.autopairs_cr()
            end
        end

        remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
        --  vim.cmd([[
        --    autocmd FileType javascript setlocal cocu_regexps='javascriptreact:\s*\(\k\|$\w\)\+\|\%(\k\|$\w\)\+\%'
        --  ]])
        --end
    end

}
