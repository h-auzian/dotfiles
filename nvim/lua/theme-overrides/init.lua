-- Tries to load a lua script with the same name as the currently selected
-- theme, in order to apply possible theme overrides if the flle exists.
-- To check the current highlight groups that can be overridden, run :hi.

local color_scheme = vim.g.colors_name
pcall(require, "theme-overrides." .. color_scheme)
