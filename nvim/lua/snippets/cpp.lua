local helpers = require("functions.snippet-helpers")

local print_snippet = helpers.create_print_snippet(
    'std::cout << {} << std::endl;'
)

local print_variable_snippet = helpers.create_print_variable_snippet(
    'std::cout << "{}: " << {} << std::endl;'
)

local snippets = {}
local autosnippets = {
    print_snippet,
    print_variable_snippet,
}

return snippets, autosnippets
