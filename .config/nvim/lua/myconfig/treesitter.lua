require("nvim-treesitter.configs").setup {
 ensure_installed = { "lua", "sway", "python", "markdown", "bash", "toml"},
 sync_install = true,
 auto_install = false,
 highlight = {
   enable = true,
   additional_vim_regex_highlighting = {"markdown"},
 },
}
