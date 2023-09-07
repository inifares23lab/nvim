return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    handlers = {
                        ["textDocument/publishDiagnostics"] = function() end,
                    },
                    on_attach = function(client, _)
                        client.server_capabilities.codeActionProvider = false
                    end,
                    settings = {
                        pyright = {
                            disableOrganizeImports = true,
                            autostart = false,
                        },
                        python = {
                            autostart = false,
                        },
                    },
                },

            },
            pylsp = {},
            ruff_lsp = {},
        }
    }
}
