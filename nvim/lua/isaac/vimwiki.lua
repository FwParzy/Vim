local status_ok, vimwiki = pcall(require, "vimwiki")
if not status_ok then
	return
end

vimwiki.setup({
  vim.g.vimwiki_list == ({
    path = {'~/vimwiki/'},
    syntax = {'markdown'},
    ext = {'.md'},
  })
})

 --TODO map all of these properly :)

 --<Leader>ww -- Open default wiki index file.
 --<Leader>wt -- Open default wiki index file in a new tab.
 --<Leader>ws -- Select and open wiki index file.
 --<Leader>wd -- Delete wiki file you are in.
 --<Leader>wr -- Rename wiki file you are in.
 --<Enter> -- Follow/Create wiki link.
 --<Shift-Enter> -- Split and follow/create wiki link.
 --<Ctrl-Enter> -- Vertical split and follow/create wiki link.
 --<Backspace> -- Go back to parent(previous) wiki link.
 --<Tab> -- Find next wiki link.
 --<Shift-Tab> -- Find previous wiki link.
