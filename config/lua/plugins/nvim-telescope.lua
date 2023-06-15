local telescope = require("telescope")

local M = {}

M.config = function ()
	local opt = { noremap = true }
	telescope.setup({})
	vim.api.nvim_set_keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opt)

end

return M
