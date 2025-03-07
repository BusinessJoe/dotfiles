vim.opt_local.colorcolumn=""

-- Overwrite netrw refresh with <C-l> mapping for tmux navigator right
vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", ":TmuxNavigateRight<cr>", { noremap = true })
