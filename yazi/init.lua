function Linemode:custom()
    local time = math.floor(self._file.cha.mtime or 0)
    local time_str = time > 0 and os.date("%d %b %Y - %H:%M", time) or ""
    local size = self._file:size()
    local size_str = size and ya.readable_size(size) or ""
    return ui.Line(string.format("%s | %s", size_str, time_str))
end

require("fs-usage"):setup({
    bar = false,
    warning_threshold = -1,
    style_normal = { bg = "#303030" },
    padding = { open = "█", close = "█" },
})
