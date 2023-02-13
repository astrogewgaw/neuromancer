return {
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
}
