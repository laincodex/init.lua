local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

function SearchYanked()
    local yanked = vim.fn.getreg('"');
    builtin.grep_string({ search = yanked });
end

vim.keymap.set('v', '<leader>s', "y:lua SearchYanked()<cr>")

local telescope = require('telescope')
    local layout_config = {
      width = 0.99,
      height = 0.99,
      prompt_position = 'bottom',
      preview_width = 0.3,
    }

telescope.setup({
  pickers = {
    find_files = {
      layout_config = layout_config,
    },
    git_files = {
      layout_config = layout_config,
    },
    buffers = {
      layout_config = layout_config,
    },
    live_grep = {
      layout_config = layout_config,
    },
    git_status = {
      layout_config = layout_config,
    },
  },
})

telescope.load_extension "file_browser"
vim.keymap.set('n', '<leader>fb', ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {})

-- local telescope = require('telescope').load_extension("file_browser")
-- vim.keymap.set('n', '<leader>lf', telescope.file_browser({ path = vim.fn.expand("%:p:h"), select_buffer=true }), { noremap = true })
