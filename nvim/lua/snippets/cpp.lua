local general = require("functions.snippet-helpers")

local print_variable_snippet = general.create_print_variable_snippet(
    'std::cout << "{}: " << {} << std::endl;'
)

local snippets = {}
local autosnippets = {
    print_variable_snippet,
}

return snippets, autosnippets
