local function branch_trunc()
    return function(str)
        local winwidth = vim.fn.winwidth(0)
        local maxlen = winwidth - 50
        if winwidth < 80 then return ''
        elseif #str > maxlen then
            return str:sub(1, maxlen)
        end
        return str
    end
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup({
            sections = {
                lualine_c = {
                    { 'branch', fmt=branch_trunc() },
                    { 'diff' },
                    { 'diagnostics' },
                },
                lualine_b = {
                    { 'filename', path = 1, },
                },
            },
            inactive_sections = {
                lualine_b = {
                    { 'filename', path = 3, },
                },
            },
            extensions = { 'neo-tree' },
        })
    end,
}
