return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {},
      bashls = {},
      clangd = {},
      texlab = {},
      pyright = {},
      marksman = {},
      rust_analyzer = {},
      julials = {
        on_new_config = function(new_config, _)
          local julia = vim.fn.expand("~/.julia/environments/lsp/bin/julia")
          if require("lspconfig").util.path.is_file(julia) then
            new_config.cmd[1] = julia
          end
        end,
      },
    },
  },
}
