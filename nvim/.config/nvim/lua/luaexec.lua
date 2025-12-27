vim.keymap.set("n", "<leader>e", function ()
	if vim.bo.filetype == "lua" then
		vim.cmd("split")
		local pucoutput = vim.fn.system({"lua", vim.fn.expand('%:p')})
		local luneoutput = vim.fn.system({"./out/Main", vim.fn.expand('%:p')})

		local win = vim.api.nvim_get_current_win()
		local buf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_win_set_buf(win, buf)
		local output = vim.split("PUC-Rio\n" .. pucoutput .. "\nLune\n" .. luneoutput, "\n")
		vim.api.nvim_buf_set_lines(buf, 0, 1, false, output)
	end
	vim.lsp.buf.rename()
end, {silent = true})
