local helpers = require("functions.snippet-helpers")

local print_snippet = helpers.create_print_snippet(
    'print({})'
)

local print_variable_snippet = helpers.create_print_variable_snippet(
    'print("{}:", {})'
)

local doc_comment_snippet = helpers.create_doc_comment_snippet([[
    """
    {}
    """
]])

local snippets = {}
local autosnippets = {
    print_snippet,
    print_variable_snippet,
    doc_comment_snippet,
}

return snippets, autosnippets
