local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local code_snippet_format = [[
    @code {}
    @end
]]

local star_format = [[
    - S: {}
    - T: 
    - A: 
    - R: 
]]

local problem_format = [[
    ** {}:
    *** Description:
        - 
    *** Observations:
        - 
    *** Solution:
        - 
]]

local code_snippet = ls.s(
    "code-",
    fmt(code_snippet_format, {
        ls.i(1),
    })
)

local star_snippet = ls.s(
    "star-",
    fmt(star_format, {
        ls.i(1),
    })
)

local problem_snippet = ls.s(
    "pr-",
    fmt(problem_format, {
        ls.i(1),
    })
)

local snippets = {}
local autosnippets = {
    code_snippet,
    star_snippet,
    problem_snippet,
}

return snippets, autosnippets
