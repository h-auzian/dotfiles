local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local helpers = require("functions.snippet-helpers")

local print_snippet = helpers.create_print_snippet(
    'std::cout << {} << std::endl;'
)

local print_variable_snippet = helpers.create_print_variable_snippet(
    'std::cout << "{}: " << {} << std::endl;'
)

local doc_comment_snippet = helpers.create_doc_comment_snippet([[
    /**
     * {}
     */
]])

local pragma_once_snippet = ls.s(
    "pra-",
    fmt("#pragma once", {})
)

local iostream_snippet = ls.s(
    "io-",
    fmt("#include <iostream>", {})
)

local snippets = {}
local autosnippets = {
    print_snippet,
    print_variable_snippet,
    doc_comment_snippet,
    pragma_once_snippet,
    iostream_snippet,
}

return snippets, autosnippets
