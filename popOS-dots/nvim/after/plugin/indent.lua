-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

vim.cmd [[highlight IndentOdd guifg=#4d4d4d guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentEven guifg=#4d4d4d guibg=NONE gui=nocombine]]

vim.g.indent_blankline_char_highlight_list = {"IndentOdd", "IndentEven"}
vim.g.indent_blankline_space_char_highlight_list = {"IndentOdd", "IndentEven"}
