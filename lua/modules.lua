-- 保存的时候自动导包跟 null-ls 不兼容
local M = {}
function M.org_imports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit,"utf-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end


-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
function M.goimports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit,"utf-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end


return M

