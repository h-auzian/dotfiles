local status_ok, grapple = pcall(require, "grapple")
if not status_ok then
	return
end

grapple.setup({
    scope = "cwd",
})

-- Keybindings
local set = vim.keymap.set
local prefix = "<leader>ñ"
local set_key = "<space>"

local function set_grapple_keybind(key)
    set("n", prefix .. key, function() grapple.select({ name = key }) end)
    set("n", prefix .. set_key .. key, function() grapple.tag({ name = key }) end)
end

local keys = {
    "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
    "a", "s", "d", "f", "g", "h", "j", "k", "l",
    "z", "x", "c", "v", "b", "n", "m",
}

local special_keys = {
    "|", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
    "ñ", "Ñ", "{", "}", "[", "]",
    "<", ">", ",", ";", ".", ":", "-", "_",
}

for _, key in pairs(keys) do
    local variants = { key, string.upper(key) }
    for _, variant in pairs(variants) do
        set_grapple_keybind(variant)
    end
end

for _, key in pairs(special_keys) do
    set_grapple_keybind(key)
end


set("n", prefix .. set_key .. set_key, function() grapple.open_tags() end)
