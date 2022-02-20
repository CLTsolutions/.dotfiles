return {
	cmd = { "remark-language-server", "--stdio" },
	filetypes = { "markdown" },
	root_dir = function(path)
		-- Support git directories and git files (worktrees)
		if M.path.is_dir(M.path.join(path, ".git")) or M.path.is_file(M.path.join(path, ".git")) then
			return path
		end
	end,
	single_file_support = true,
}
