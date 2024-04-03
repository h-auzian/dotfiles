local general = require("functions.snippet-helpers")

local print_variable_snippet = general.create_print_variable_snippet(
    'print("{}:", {})'
)

local doc_comment_snippet = general.create_doc_comment_snippet([[
    """
    {}
    """
]])

local snippets = {}
local autosnippets = {
    print_variable_snippet,
    doc_comment_snippet,
}

return snippets, autosnippets
