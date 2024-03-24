return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
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
        pyright = {},
        julials = {},
        marksman = {},
        rust_analyzer = {},
      },
    },
  },
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
    "williamboman/mason.nvim",
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
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "emoji" },
        { name = "otter" },
        { name = "spell" },
        { name = "cmp_zotcite" },
        { name = "latex_symbols" },
        { name = "pandoc_references" },
      }))
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        python = { "black" },
        fish = { "fish_indent" },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
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
      require("wrapping").setup()
    end,
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      { "hrsh7th/nvim-cmp" },
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
  { "jalvesaq/cmp-zotcite" },
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
