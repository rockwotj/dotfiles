lua <<EOF

-- TODO: Start porting config to lua :)

vim.o.background = "dark"
vim.cmd[[colorscheme gruvbox-material]]
vim.api.nvim_set_option('makeprg', 'just')

EOF
