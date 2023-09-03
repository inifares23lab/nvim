-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

local lvim = {}
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  others = {
    {
      -- THEMES
      {
        "EdenEast/nightfox.nvim",
      },
      -- {
      -- "RRethy/nvim-base16",
      -- },
      -- GIT
      {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
          vim.cmd("highlight default link gitblame SpecialComment")
          vim.g.gitblame_enabled = 1
        end,
      },
      -- ACCESSIBILITY
      {
        "stevearc/dressing.nvim",
        opts = {},
      },
      {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          vim.opt.list = true
          vim.opt.listchars:append("space:⋅")
          vim.opt.listchars:append("eol:↴")

          vim.opt.termguicolors = true
          vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
          vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
          vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
          vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
          vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
          vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
          require("indent_blankline").setup({
            space_char_blankline = " ",
            char_highlight_list = {
              "IndentBlanklineIndent1",
              "IndentBlanklineIndent2",
              "IndentBlanklineIndent3",
              "IndentBlanklineIndent4",
              "IndentBlanklineIndent5",
              "IndentBlanklineIndent6",
            },
            show_trailing_blankline_indent = true,
            show_current_context = true,
            show_current_context_start = true,
          })
        end,
      },
      {
        "RRethy/vim-illuminate",
      },
      -- MASON DAP
      {
        "jay-babu/mason-nvim-dap.nvim",
      },
      -- GOLANG
      {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
          "ray-x/guihua.lua",
          "neovim/nvim-lspconfig",
          "nvim-treesitter/nvim-treesitter",
        },
        config = function()
          require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()',
      },
      -- CODEIUM plugin
      {
        "jcdickinson/codeium.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "hrsh7th/nvim-cmp",
        },
        config = function()
          require("codeium").setup()
          table.insert(lvim.builtin.cmp.sources, { name = "codeium" })
        end,
      },
      -- LIVE_GREP_ARGS plugin
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
      -- AST-GREP plugin
      {
        "Marskey/telescope-sg",
      },
      -- SCOPE plugin
      {
        "tiagovla/scope.nvim",
        config = function()
          require("scope").setup()
        end,
      },
      -- AUTO-SESSION plugin
      {
        "rmagatti/auto-session",
        config = function()
          require("auto-session").setup({
            log_level = "error",
            auto_session_use_git_branch = false,
            auto_save_enabled = false,
            auto_session_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            session_lens = {
              load_on_setup = true,
              theme_conf = { border = true, theme = "dropdown" },
              previewer = true,
            },
          })
        end,
      },
      -- SYMBOLS-OUTLINE plugin
      {
        "simrat39/symbols-outline.nvim",
        config = function()
          require("symbols-outline").setup()
          lvim.builtin.which_key.mappings["l"]["o"] = { "<cmd>SymbolsOutline<CR>", "Outline" }
        end,
      },
      -- TS-RAINBOW-2 plugin
      {
        "HiPhish/nvim-ts-rainbow2",
        config = function()
          lvim.builtin.treesitter.rainbow = {
            enable = true,
            query = "rainbow-parens",
            strategy = require("ts-rainbow").strategy.global,
          }
        end,
      },
      {
        "tomasky/bookmarks.nvim",
        -- after = "telescope.nvim",
        event = "VimEnter",
        config = function()
          require("bookmarks").setup({
            save_file = vim.fn.stdpath("data") .. "/bookmarks", -- bookmarks save file path
            keywords = {
              ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
              ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
              ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
              ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
            },
          })
          lvim.builtin.which_key.mappings["m"] = {
            name = "Bookmarks",
            m = { '<CMD>lua require("bookmarks").bookmark_toggle()<CR>', "toggle line" },
            i = { '<CMD>lua require("bookmarks").bookmark_ann()<CR>', "add/edit line" },
            c = { '<CMD>lua require("bookmarks").bookmark_clean()<CR>', "clean buffer" },
            n = { '<CMD>lua require("bookmarks").bookmark_next()<CR>', "next" },
            p = { '<CMD>lua require("bookmarks").bookmark_prev()<CR>', "prev" },
            l = { "<CMD>Telescope bookmarks list<CR>", "list" },
          }
        end,
      },
      -- PYTHON VENV
      {
        "AckslD/swenv.nvim",
        config = function()
          require("swenv").setup({
            -- Should return a list of tables with a `name` and a `path` entry each.
            -- Gets the argument `venvs_path` set below.
            -- By default just lists the entries in `venvs_path`.
            get_venvs = function(venvs_path)
              return require("swenv.api").get_venvs(venvs_path)
            end,
            -- Path passed to `get_venvs`.
            venvs_path = vim.fn.expand("~/.venvs"),
            -- Something to do after setting an environment, for example call vim.cmd.LspRestart
            post_set_venv = nil,
          })
          lvim.builtin.which_key.mappings["v"] = {
            name = "python venvs",
            s = { '<cmd>lua require("swenv.api").pick_venv()<cr>', "select venvs" },
            c = { '<cmd>lua require("swenv.api").get_current_venv()<cr>', "current venv" },
          }
        end,
      },
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
        end,
      },
      -- LeetCode NeetCode plugin
            {
        "natecraddock/workspaces.nvim",
        config = function()
          require("workspaces").setup({
            hooks = {
              open = { "NvimTreeToggle" },
            },
          })
        end,
      },
    },
  },
}
