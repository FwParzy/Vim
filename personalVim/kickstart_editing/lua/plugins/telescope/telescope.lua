local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("Shit broke with ", telescope)
  return
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
