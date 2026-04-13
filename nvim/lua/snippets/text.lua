local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local todo_snippet = ls.s(
    "td-",
    fmt("# TODO: ", {})
)

local snippets = {}
local autosnippets = {
    todo_snippet,
}

return snippets, autosnippets
