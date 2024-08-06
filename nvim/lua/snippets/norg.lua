local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local code_snippet_format = [[
    @code {}
    @end
]]

local code_snippet = ls.s(
    "code-",
    fmt(code_snippet_format, {
        ls.i(1),
    })
)

local snippets = {}
local autosnippets = {
    code_snippet,
}

return snippets, autosnippets
