local nls = require("null-ls")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[
                :h-                                  Nhy`
              -mh.                           h.    `Ndho
              hmh+                          oNm.   oNdhh
              `Nmhd`                        /NNmd  /NNhhd
              -NNhhy                      `hMNmmm`+NNdhhh
              .NNmhhs              ```....`..-:/./mNdhhh+
              mNNdhhh-     `.-::///+++////++//:--.`-/sd`
              oNNNdhhdo..://++//++++++/+++//++///++/-.`
          y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:
    .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+
    h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`
    hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`
    /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.
      oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.
      /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.
        /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`
          .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:
          -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`
          /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:
          //+++//++++++////+++///::--                 .::::-------::
          :/++++///////////++++//////.                -:/:----::../-
          -/++++//++///+//////////////               .::::---:::-.+`
          `////////////////////////////:.            --::-----...-/
            -///://////////////////////::::-..      :-:-:-..-::.`.+`
            :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -
              ::::://::://::::::::::::::----------..-:....`.../- -+oo/
                -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``
              s-`::--:::------:////----:---.-:::...-.....`./:
              yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`
            oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-
            :dy+:`      .-::-..NNNhhd+``..`...````.-::-`
                            .-:mNdhh:.......--::::-`
                              yNh/..------..`

    ]]
      opts.section.header.val = vim.split(logo, "\n", { triempty = true })
    end,
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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      nls.setup({
        on_init = function(client, _)
          client.offset_encoding = "utf-32"
        end,
      })
    end,
    opts = {
      sources = {
        nls.builtins.formatting.just,
        nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.ruff,
        nls.builtins.formatting.black,
        nls.builtins.formatting.gofmt,
        nls.builtins.completion.spell,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.rustfmt,
        nls.builtins.formatting.prettier,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.formatting.latexindent,
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
      require "quarto".setup {
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
      }
    end
  },
  { "Bekaboo/dropbar.nvim" },
  { "navarasu/onedark.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "folke/tokyonight.nvim" },
  { "junegunn/vim-easy-align" },
  { "shortcuts/no-neck-pain.nvim" },
  { "JuliaEditorSupport/julia-vim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "catppuccin/nvim",                            as = "catppuccin" },
  { "rose-pine/neovim",                           as = "rose-pine" },
}
