vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- View errors on line
vim.keymap.set("n", "<C-o>", vim.diagnostic.open_float, {})

-- Open small terminal
vim.keymap.set("n", "<C-s>",function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0,15)
end)

vim.opt.number = true
vim.opt.relativenumber = true
