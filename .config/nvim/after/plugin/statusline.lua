local colors = require('bluemarble.palette').dark()
local gl = require('galaxyline')
local gls = gl.section

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
    end
    return false
end

local function buffer_is_readonly()
    if vim.bo.filetype == 'help' then
        return false
    end
    return vim.bo.readonly
end

local function filename()
    local file = vim.fn.expand('%:t')

    if vim.fn.empty(file) == 1 then return '' end

    local modified_icon = '*'
    local readonly_icon = '[Read-Only]'

    if buffer_is_readonly() then
        file = readonly_icon .. ' ' ..file
    end

    if vim.bo.modifiable  and vim.bo.modified then
        file = file .. modified_icon
    end

    return ' ' .. file .. ' '
end

gls.left[1] = {
    FirstElement = {
        provider = function() return ' ' end,
        highlight = { colors.brightbg, colors.brightbg },
    },
}

gls.left[2] = {
    GitBranch = {
        provider = 'GitBranch',
        icon = ' 󰊢 ',
        highlight = { colors.yellow, colors.brightbg },
        separator = ' ',
        separator_highlight = { colors.blue, colors.brightbg },
    },
}

gls.left[3] = {
    FileName = {
        provider = filename,
        condition = buffer_not_empty,
        highlight = { colors.magenta, colors.brightbg },
        modified_icon = '*',
    }
}

gls.left[4] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = ' ?? ',
        highlight = { colors.red, colors.brightbg }
    }
}

gls.left[5] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = ' ? ',
        highlight = { colors.yellow, colors.brightbg }
    }
}

gls.right[1] = {
    LineInfo = {
        provider = 'LineColumn',
        highlight = { colors.white, colors.brightbg },
    }
}

gls.right[2] = {
    PerCent = {
        provider = 'LinePercent',
        highlight = { colors.white, colors.brightbg },
        separator = '|',
        separator_highlight = { colors.white, colors.brightbg },
    }
}
