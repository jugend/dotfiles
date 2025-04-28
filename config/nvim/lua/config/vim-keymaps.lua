-- [[ Custom Functions ]]
--
function ReloadConfig()
  dofile(vim.env.MYVIMRC) -- Reload the config
  vim.notify('Config reloaded!', vim.log.levels.INFO)
end

function EditInCommand(command, back_nos)
  return function()
    local cmd_line = string.format(':lua %s', command)
    vim.api.nvim_feedkeys(cmd_line, 'n', true)
    vim.api.nvim_input(string.rep('<Left>', back_nos))
  end
end

-- [[ Vim Keymaps ]]
--
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
--
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
--
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window', noremap = true })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window', noremap = true })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window', noremap = true })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window', noremap = true })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
--
-- Not working
-- vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
-- vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
-- vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
-- vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Reverse semicolon and colon chars
vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('n', ':', ';', { noremap = true })
vim.keymap.set('v', ';', ':', { noremap = true })
vim.keymap.set('v', ':', ';', { noremap = true })

-- Productivity mappings, when forgot to be in insert or visual mode
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kk', '<Esc>', { noremap = true })
vim.keymap.set('i', 'hh', '<Esc>', { noremap = true })
vim.keymap.set('i', 'll', '<Esc>', { noremap = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('i', '<C-[>', '<Esc>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('v', '<C-l>', '<Esc>', { noremap = true })

-- Save files
vim.keymap.set('i', '<C-s>', '<C-o>:w<CR>', { noremap = true })
vim.keymap.set('n', '<C-s>', '<C-o>:w<CR>', { noremap = true })

-- Find Files
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { noremap = true })
vim.keymap.set('n', '<', function()
  local word = vim.fn.expand '<cword>' -- Get the word under the cursor
  require('telescope.builtin').grep_string { search = word }
end)

-- Map it to a key (e.g., <leader>r to reload)
vim.keymap.set('n', '<leader>E', '<cmd>e<cr>', { desc = 'Reload current file', noremap = true })
vim.keymap.set('n', '<leader>rc', ReloadConfig, { desc = 'Reload init.lua config', noremap = true })
vim.keymap.set('n', '<leader>rb', ReloadConfig, { desc = 'Reload init.lua config', noremap = true })
vim.keymap.set('n', '<leader>rl', ReloadConfig, { desc = 'Reload lazy.vim plugins', noremap = true })

-- Run commands
vim.keymap.set('n', '<leader>l<space>', ':lua<space>', { desc = 'Run :lua', noremap = true })
vim.keymap.set('n', '<leader>lp', EditInCommand('print("")', 2), { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>lv', EditInCommand('print(vim.o.)', 1), { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>lc', EditInCommand('vim.cmd("")', 2), { desc = 'Run :lua vim.cmd(...)', noremap = true })
vim.keymap.set('n', '<leader>h<space>', ':help<space>', { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>hl', ':help<space>lua-guide<CR>', { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>ht', ':help<space>Tutor<CR>', { desc = 'Run :lua print(...)', noremap = true })

vim.keymap.set('n', '<leader>iw', ':lua vim.cmd("set invwrap")<CR>', { desc = 'Inverse text wrap', noremap = true })

-- Fold LEvels
vim.keymap.set('n', '<leader><leader>1', '<cmd>:lua vim.opt.foldlevel=1<CR>', { desc = 'Set vim foldlevel=1', noremap = true })
vim.keymap.set('n', '<leader><leader>2', '<cmd>:lua vim.opt.foldlevel=2<CR>', { desc = 'Set vim foldlevel=2', noremap = true })
vim.keymap.set('n', '<leader><leader>3', '<cmd>:lua vim.opt.foldlevel=3<CR>', { desc = 'Set vim foldlevel=3', noremap = true })
vim.keymap.set('n', '<leader><leader>4', '<cmd>:lua vim.opt.foldlevel=4<CR>', { desc = 'Set vim foldlevel=4', noremap = true })
vim.keymap.set('n', '<leader><leader>5', '<cmd>:lua vim.opt.foldlevel=5<CR>', { desc = 'Set vim foldlevel=5', noremap = true })
vim.keymap.set('n', '<leader><leader>c', '<cmd>:lua vim.opt.foldlevel=99<CR>', { desc = 'Set vim foldlevel=99', noremap = true })

-- vim.api.nvim_echo({ { cmd_line } }, true, {})
-- Quick Control Shortcuts
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file ', noremap = true })
vim.keymap.set('n', '<leader>x', ':x<CR>', { desc = 'Save and quite file ', noremap = true })
vim.keymap.set('n', '<leader>e', ':.lua<CR>', { desc = 'Execute current line ', noremap = true })
vim.keymap.set('v', '<leader>e', ':lua<CR>', { desc = 'Execute current selection', noremap = true })

vim.keymap.set('n', '<leader><space>', '<cmd>tabnext<CR>', { desc = 'Tab Next', noremap = true })
vim.keymap.set('n', '<leader><leader><space>', '<cmd>tabprevious<CR>', { desc = 'Tab Previous', noremap = true })
vim.keymap.set('n', '<leader><leader>q', '<cmd>q<CR>', { desc = 'Quite file without save', noremap = true })
vim.keymap.set('n', '<leader><leader>!', '<cmd>q<CR>', { desc = 'Quite file without save', noremap = true })

-- Write files
vim.keymap.set('n', '<leader>ws', '<cmd>w<CR>', { desc = 'Save file ', noremap = true })
vim.keymap.set('n', '<leader>wx', '<cmd>x<CR>', { desc = 'Save and exit file', noremap = true })

-- Neo Tree
vim.keymap.set('n', '<leader>f', ':Neotree reveal<CR>', { desc = 'Reveal file in Neo Tree', noremap = true })

-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true })
--
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
-- vim.keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true })

-- Search
vim.keymap.set('n', '<C-t>', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>a', function()
--   require('telescope.builtin').live_grep()
-- end, { noremap = true, , desc = 'Search in files (Ack style)' })

-- Open command line prompt
-- vim.keymap.set('n', '<leader>a', ':Telescope live_grep default_text=', { noremap=true })
--
-- Edit files
-- Add entry to edit config nvim init.lua file
vim.keymap.set('n', '<leader>ei', '<cmd>e ~/.config/nvim/init.lua<cr>', { desc = 'Edit init.lua' })

-- Copilot
vim.keymap.set('n', '<leader>ea', '<cmd>e ~/.aliases<cr>', { desc = 'Edit ~/.aliases' })
vim.keymap.set('n', '<leader>ea', '<cmd>e ~/.aliases<cr>', { desc = 'Edit ~/.aliases' })
vim.keymap.set('n', '<leader>eal', '<cmd>e ~/.aliases.local<cr>', { desc = 'Edit ~/.aliases.local' })
vim.keymap.set('n', '<leader>eap', '<cmd>e ~/.aliases.private<cr>', { desc = 'Edit ~/.aliases.private' })
vim.keymap.set('n', '<leader>eb', '<cmd>e ~/.bashrc<cr>', { desc = 'Edit ~/.bashrc' })
vim.keymap.set('n', '<leader>ebp', '<cmd>e ~/.bash_profile<cr>', { desc = 'Edit ~/.bash_profile' })
vim.keymap.set('n', '<leader>ebpl', '<cmd>e ~/.bash_profile.local<cr>', { desc = 'Edit ~/.bash_profile.local' })
vim.keymap.set('n', '<leader>es', '<cmd>e ~/.slate<cr>', { desc = 'Edit ~/.slate' })
vim.keymap.set('n', '<leader>ef', '<cmd>e ~/.functions<cr>', { desc = 'Edit ~/.functions' })
vim.keymap.set('n', '<leader>eal', '<cmd>e ~/.aliases.local<cr>', { desc = 'Edit ~/.aliases.local' })

-- Location Navigation
vim.keymap.set('n', '<leader>lo', '<cmd>hlopen<cr>', { desc = ':lopen - Open Location Window' })
vim.keymap.set('n', '<leader>ln', '<cmd>lnext<cr>', { desc = ':lnext - Location Next' })
vim.keymap.set('n', '<leader>lp', '<cmd>lprevious<cr>', { desc = ':lprevious - Location Previous' })
vim.keymap.set('n', '<leader>co', '<cmd>copen<cr>', { desc = ':open - Open Quickfix Window' })
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<cr>', { desc = ':cnext - Next Error' })
vim.keymap.set('n', '<leader>cp', '<cmd>cprevious<cr>', { desc = ':cprevious - Previous Error' })

-- Add buffer navigation shortcut

-- Copilot-- Add buffer navigation shortcut
vim.keymap.set('i', '<C-space>', ':CopilotChatToggle<CR>', { noremap = true })
vim.keymap.set('n', '<C-w>c', '<cmd>CopilotChatPrompts<CR>', { noremap = true })
vim.keymap.set('i', '<C-/>', '<Plug>(copilot-suggest)', { noremap = true })
vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-accept)', { noremap = true })
vim.keymap.set('i', '<C-]>', '<Plug>(copilot-next)', { noremap = true })
vim.keymap.set('i', '<C-]>', '<Plug>(copilot-prev)', { noremap = true })
vim.keymap.set('i', '<C->>', '<Plug>(copilot-dismiss)', { noremap = true })
vim.keymap.set('v', '<leader>ce', '<cmd>CopilotChatExplain<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cr', '<cmd>CopilotChatReset<CR>', { noremap = true })

-- Command Line shortcut
vim.keymap.set('c', 'jk', '<C-c>', { noremap = true })
vim.keymap.set('c', '<C-l>', '<C-c>', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-d>', '<Del>', { noremap = true })
vim.keymap.set('c', '<M-b>', '<S-Left>', { noremap = true })
vim.keymap.set('c', '<M-f>', '<S-Right>', { noremap = true })
