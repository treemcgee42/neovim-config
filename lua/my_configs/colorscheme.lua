--
-- Change these variables to change the color scheme. Many schemes also have "flavors",
-- which are variations of the same general theme. 
--
-- Supported color scheme:
-- 		* "tokyo night"; "night" / "storm" / "moon" / "day"
-- 		* "catpuccin"; "latte" / "frappe" / "macchiato" / "mocha"
-- 		* "gruvbox"; "dark" / "light"
--
-- Error handling: 
-- 		* if `color_scheme` is not valid, then no color scheme will be applied.
-- 		* if `night` is not valid for the (valid) `color_scheme`, the color scheme
-- 		  will still be applied, but no gaurentee is made on the flavor that is 
-- 		  chosen.
--

local color_scheme = "gruvbox"
local flavor = "light"

local function set_color_scheme(name, flavor)

	if name == "tokyo night" then
		if flavor == "night" then
			vim.g.tokyonight_style = "night"
		elseif flavor == "storm" then
			vim.g.tokyonight_style = "storm"
		elseif flavor == "day" then
			vim.g.tokyonight_style = "day"
		else -- moon 
			vim.g.tokyonight_style = "moon"
		end

		vim.cmd[[colorscheme tokyonight]]

	elseif name == "catpuccin" then
		if flavor == "latte" then
			vim.g.catppuccin_flavour = "latte"
		elseif flavor == "frappe" then
			vim.g.catppuccin_flavour = "frappe"
		elseif flavor == "macchiato" then 
			vim.g.catppuccin_flavour = "macchiato"
		else -- mocha
			vim.g.catppuccin_flavour = "mocha"
		end

		vim.cmd[[colorscheme catppuccin]]
	
	elseif name == "gruvbox" then
		if flavor == "dark" then 
			vim.o.background = "dark"
		else -- light
			vim.o.background = "light"
		end

		vim.cmd([[colorscheme gruvbox]])

	end

	vim.cmd[[hi link specialcomment comment]]

end

set_color_scheme(color_scheme, flavor)

