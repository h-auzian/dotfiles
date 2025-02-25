-- Tries to load a lua script with the same name as the currently selected
-- theme, in order to apply possible theme overrides if the flle exists.
-- To check the highlight groups that can be overridden, run ":hi".
-- To filter highlight groups by name, run ":filter <search> hi".

local color_scheme = "noirbuddy"

-- For some reason, explicitly setting the "noirbuddy" color scheme will not
-- apply the overriden colors correctly, probably due to plugin load order, so
-- it is excluded.
if color_scheme ~= "noirbuddy" then
    vim.cmd("colorscheme " .. color_scheme)
end

-- Apply the overrides, if applicable.
pcall(require, "theme-overrides." .. color_scheme)
