local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({
	"*", -- Highlight all files, but customize some others.
	scss = { css = true }, -- Apply the 'css' setting for 'scss' files.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
	java = { names = false }, -- Disable parsing "names" like Blue or Gray
	lua = { names = false }, -- Disable parsing "names" like Blue or Gray
})

--[[
local opts = {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = true, -- "Name" codes like Blue
	RRGGBBAA = false, -- #RRGGBBAA hex codes
	rgb_fn = false, -- CSS rgb() and rgba() functions
	hsl_fn = false, -- CSS hsl() and hsla() functions
	css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode = "background", -- Set the display mode.
}
--]]
