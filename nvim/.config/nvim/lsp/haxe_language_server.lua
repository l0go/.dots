print(vim.fn.getcwd())
return {
    cmd = { 'node', '/home/logo/haxe/lsp/bin/server.js' },
    filetypes = { 'haxe' },
    root_markers = {
        "build.hxml"
    },
    init_options = {
		displayArguments = {vim.fn.getcwd() .. "/build.hxml"}
    },
    settings = {
        haxe = {
            executable = "haxe",
        }
    }
}
