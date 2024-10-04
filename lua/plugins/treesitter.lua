return {
  -- add treesitter parser
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.cds = {
        install_info = {
          url = "https://github.com/cap-js-community/tree-sitter-cds.git",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "cds",
        used_by = { "cdl", "hdbcds" },
      }
    end,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      playground = { enable = true },
      ensure_installed = {
        "cds",
      },
    },
  },
}
