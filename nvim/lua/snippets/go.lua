local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local error_snippet_format = [[
    if err != nil {{
        log.Fatal(err)
    }}

]]

local error_snippet = ls.s(
    "err-",
    fmt(error_snippet_format, {})
)

local snippets = {}
local autosnippets = {
    error_snippet,
}

return snippets, autosnippets
