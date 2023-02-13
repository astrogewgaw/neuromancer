return {
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
}
