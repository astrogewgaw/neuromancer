local nls = require("null-ls")

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = {
    sources = {
      nls.builtins.formatting.just,
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.vale,
      nls.builtins.diagnostics.ruff,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.formatting.gofmt,
      nls.builtins.completion.spell,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.rustfmt,
      nls.builtins.code_actions.gitsigns,
      nls.builtins.formatting.latexindent,
    },
  },
}
