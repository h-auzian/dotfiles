local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

M = {}

function M.create_print_snippet(format)
    return ls.s(
        "pr-",
        fmt(format, {
            ls.i(1),
        })
    )
end

function M.create_print_variable_snippet(format)
    return ls.s(
        "pv-",
        fmt(format, {
            ls.f(function(arg)
                return arg[1][1]:upper()
            end, 1),
            ls.i(1),
        })
    )
end

function M.create_doc_comment_snippet(format)
    return ls.s(
        "doc-",
        fmt(format, {
            ls.i(1),
        })
    )
end

return M
