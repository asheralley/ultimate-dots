-- require('onedark').setup {
--     style = 'dark'
-- }
-- require('onedark').load()
--
vim.cmd[[colorscheme nightfox]]

require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})
