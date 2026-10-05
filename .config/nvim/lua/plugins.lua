vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
--  'https://github.com/meanderingprogrammer/render-markdown.nvim'
--  'https://github.com/OXY2DEV/markview.nvim'
})

require('telescope').setup({
  defaults = {
    -- config
  }
})

-- require('render-markdown').setup()

require("nvim-treesitter").setup()
require("nvim-treesitter").install({ "markdown", "markdown_inline" })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start()
    end
  end,
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

-- terminal keymaps
vim.keymap.set("n", "<leader>gg", function()
  vim.cmd("vsplit | terminal lazygit")
  vim.cmd("startinsert")
end, { desc = "Open lazygit" })
