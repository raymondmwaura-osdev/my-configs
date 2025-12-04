vim.g.mapleader = " "

-- Explorer.
vim.keymap.set({"n", "v"}, "<Leader>e", ":Ex<CR>")

-- Navigating tabs.
for i = 1, 9 do
    vim.keymap.set(
        {"n", "v"},
        "<Leader>" .. i,
        ":tabn " .. i .. "<CR>"
    )
end
