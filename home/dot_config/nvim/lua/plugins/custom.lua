return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      words = { enabled = true },
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
        bashls = {},
        clangd = {},
        texlab = {},
        julials = {},
        marksman = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "vale",
        "isort",
        "black",
        "shfmt",
        "stylua",
        "shellcheck",
      },
    },
  },
  { "mason-org/mason-lspconfig.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "go",
        "vim",
        "org",
        "cpp",
        "css",
        "lua",
        "rust",
        "just",
        "cuda",
        "bash",
        "json",
        "yaml",
        "toml",
        "html",
        "scss",
        "make",
        "cmake",
        "regex",
        "julia",
        "fortran",
        "markdown",
        "javascript",
        "dockerfile",
        "markdown_inline",
      },
    },
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    dependencies = { "moyiz/blink-emoji.nvim" },
    opts = {
      sources = {
        default = {
          "lsp",
          "path",
          "emoji",
          "buffer",
          "snippets",
        },
        providers = {
          emoji = {
            name = "Emoji",
            module = "blink-emoji",
            opts = { insert = true },
            should_show_items = function()
              return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
            end,
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        python = { "black" },
        c = { "clang_format" },
        fish = { "fish_indent" },
        cmake = { "cmake_format" },
      },
    },
  },
  { "folke/zen-mode.nvim" },
  {
    "OscarCreator/rsync.nvim",
    build = "make",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("rsync").setup({})
    end,
  },
  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup({})
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "lukas-reineke/headlines.nvim",
    config = function()
      require("headlines").setup()
    end,
  },
  {
    "lervag/vimtex",
    config = function()
      vim.cmd("let g:tex_flavor='latex'")
      vim.cmd("let g:vimtex_quickfix_mode=0")
      vim.cmd("let g:vimtex_view_method = 'general'")
      vim.cmd("let g:vimtex_compiler_method='tectonic'")
      vim.cmd("autocmd BufWritePost *.tex :VimtexCompile")
      vim.cmd("let g:vimtex_view_general_viewer = 'okular'")
      vim.cmd("let g:vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'")
      vim.cmd("let g:vimtex_compiler_tectonic={'options': ['-X', 'compile', '-Z', 'shell-escape']}")
    end,
  },
  {
    "KeitaNakamura/tex-conceal.vim",
    config = function()
      vim.cmd("set conceallevel=1")
      vim.cmd("hi Conceal ctermbg=none")
      vim.cmd("let g:tex_conceal='abdmg'")
    end,
  },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup({})
    end,
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      { "jmbuhr/otter.nvim" },
    },
    config = function()
      require("quarto").setup({
        debug = false,
        closePreviewOnExit = true,
        lspFeatures = {
          enabled = true,
          chunks = "curly",
          completion = { enabled = true },
          languages = { "python", "julia", "bash", "lua" },
          diagnostics = { enabled = true, triggers = { "BufWritePost" } },
        },
        keymap = { hover = "K", definition = "gd" },
      })
    end,
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },
  { "jalvesaq/zotcite" },
  { "rcarriga/nvim-notify" },
  { "Bekaboo/dropbar.nvim" },
  { "navarasu/onedark.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "folke/tokyonight.nvim" },
  { "junegunn/vim-easy-align" },
  { "shortcuts/no-neck-pain.nvim" },
  { "JuliaEditorSupport/julia-vim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "catppuccin/nvim", as = "catppuccin" },
  { "rose-pine/neovim", as = "rose-pine" },
}
