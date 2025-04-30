-- [[ Vim Keymaps ]]
--
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
--
local f = require 'config.functions'

-- Reverse semicolon and colon chars
vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('n', ':', ';', { noremap = true })
vim.keymap.set('v', ';', ':', { noremap = true })
vim.keymap.set('v', ':', ';', { noremap = true })

-- Productivity mappings, when forgot to be in insert or visual mode
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kk', '<Esc>', { noremap = true })
vim.keymap.set('i', 'hh', '<Esc>', { noremap = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('v', '<C-l>', '<Esc>', { noremap = true })

-- Remove search highlights
vim.keymap.set('n', '<Esc>', '<vmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>N', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Command mode
vim.keymap.set('c', 'jk', '<C-c>', { noremap = true })
vim.keymap.set('c', '<C-l>', 'C-c>', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-d>', '<Del>', { noremap = true })
vim.keymap.set('c', '<M-b>', '<S-Left>', { noremap = true })
vim.keymap.set('c', '<M-f>', '<S-Right>', { noremap = true })

-- Insert mode
vim.keymap.set('i', '<C-l>', '<C-c>', { noremap = true })
vim.keymap.set('i', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('i', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('i', '<C-d>', '<Del>', { noremap = true })
vim.keymap.set('i', '<M-b>', '<S-Left>', { noremap = true })
vim.keymap.set('i', '<M-f>', '<S-Right>', { noremap = true })
-- vim.keymap.set('i', '<C-p>', '<Up>', { noremap = true })
-- vim.keymap.set('i', '<C-n>', '<Down>', { noremap = true })

-- Map it to a key (e.g., <leader>r to reload)
vim.keymap.set('n', '<leader>E', '<cmd>e<CR>', { desc = 'Reload current file', noremap = true })
vim.keymap.set('n', '<leader>rc', f.reload_configs, { desc = 'Reload init.lua config', noremap = true })
vim.keymap.set('n', '<leader>rb', f.reload_configs, { desc = 'Reload init.lua config', noremap = true })
vim.keymap.set('n', '<leader>rl', '<cmd>Lazy sync<CR>', { desc = 'Reload lazy.vim plugins', noremap = true })

-- command Shortcuts
vim.keymap.set('n', '<leader>l<space>', '<cmd>lua<space>', { desc = 'Run :lua', noremap = true })
vim.keymap.set('n', '<leader>lp', f.edit_in_command('print("")', 2), { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>lv', f.edit_in_command('print(vim.o.)', 1), { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>lc', f.edit_in_command('vim.cmd("")', 2), { desc = 'Run :lua vim.cmd(...)', noremap = true })
vim.keymap.set('n', '<leader>h<space>', '<cmd>help<space>', { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>hl', '<cmd>help<space>lua-guide<CR>', { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>ht', '<cmd>help<space>Tutor<CR>', { desc = 'Run :lua print(...)', noremap = true })

vim.keymap.set('n', '<leader>iw', '<cmd>lua vim.cmd("set invwrap")<CR>', { desc = 'Inverse text wrap', noremap = true })

-- Fold Levels
vim.keymap.set('n', '<leader><leader>1', '<cmd>lua vim.opt.foldlevel=1<CR>', { desc = 'Set vim foldlevel=1', noremap = true })
vim.keymap.set('n', '<leader><leader>2', '<cmd>lua vim.opt.foldlevel=2<CR>', { desc = 'Set vim foldlevel=2', noremap = true })
vim.keymap.set('n', '<leader><leader>3', '<cmd>lua vim.opt.foldlevel=3<CR>', { desc = 'Set vim foldlevel=3', noremap = true })
vim.keymap.set('n', '<leader><leader>4', '<cmd>lua vim.opt.foldlevel=4<CR>', { desc = 'Set vim foldlevel=4', noremap = true })
vim.keymap.set('n', '<leader><leader>5', '<cmd>lua vim.opt.foldlevel=5<CR>', { desc = 'Set vim foldlevel=5', noremap = true })
vim.keymap.set('n', '<leader><leader>c', '<cmd>lua vim.opt.foldlevel=99<CR>', { desc = 'Set vim foldlevel=99', noremap = true })

-- Quick Control Shortcuts
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file ', noremap = true })
vim.keymap.set('n', '<leader>x', '<cmd>x<CR>', { desc = 'Save and quite file ', noremap = true })
vim.keymap.set('n', '<leader>e', '<cmd>.lua<CR>', { desc = 'Execute current line ', noremap = true })
vim.keymap.set('v', '<leader>e', '<cmd>lua<CR>', { desc = 'Execute current selection', noremap = true })

vim.keymap.set('n', '<leader><space>', '<cmd>tabnext<CR>', { desc = 'Tab Next', noremap = true })
vim.keymap.set('n', '<leader><leader><space>', '<cmd>tabprevious<CR>', { desc = 'Tab Previous', noremap = true })
vim.keymap.set('n', '<leader><leader>q', '<cmd>q<CR>', { desc = 'Quite file without save', noremap = true })
vim.keymap.set('n', '<leader><leader>!', '<cmd>qa<CR>', { desc = 'Quite file without save', noremap = true })

-- Write files
vim.keymap.set('n', '<leader>ws', '<cmd>w<CR>', { desc = 'Save file ', noremap = true })

-- nvim-tree
vim.keymap.set('n', '<leader>g', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Reveal file in Neotree', noremap = true })

-- Edit files
vim.keymap.set('n', '<leader>ei', '<cmd>e ~/.config/nvim/init.lua<CR>', { desc = 'Edit init.lua' })
vim.keymap.set('n', '<leader>eo', '<cmd>e ~/.config/nvim/lua/config/vim-options.lua<CR>', { desc = 'Edit vim-options.lua' })
vim.keymap.set('n', '<leader>ek', '<cmd>e ~/.config/nvim/lua/config/vim-keymaps.lua<CR>', { desc = 'Edit vim-keymaps.lua' })
vim.keymap.set('n', '<leader>es', '<cmd>e ~/.config/nvim/lua/config/vim-scripts.lua<CR>', { desc = 'Edit vim-scripts.lua' })
vim.keymap.set('n', '<leader>ef', '<cmd>e ~/.config/nvim/lua/config/functions.lua<CR>', { desc = 'Edit functions.lua' })
vim.keymap.set('n', '<leader>eto', '<cmd>e ~/.config/nvim/lua/plugins/theme-onedark.lua<CR>', { desc = 'Edit theme-onedark.lua' })
vim.keymap.set('n', '<leader>ecf', '<cmd>e ~/.config/nvim/lua/plugins/conform.lua<CR>', { desc = 'Edit conform.lua' })
vim.keymap.set('n', '<leader>et', '<cmd>e ~/.config/nvim/lua/plugins/telescope.lua<CR>', { desc = 'Edit telescope.lua' })
vim.keymap.set('n', '<leader>ez', '<cmd>e ~/.config/nvim/lua/plugins/fzf-lua.lua<CR>', { desc = 'Edit telescope.lua' })
vim.keymap.set('n', '<leader>eco', '<cmd>e ~/.config/nvim/lua/plugins/copilot.lua<CR>', { desc = 'Edit copilot.lua' })
vim.keymap.set('n', '<leader>ecc', '<cmd>e ~/.config/nvim/lua/plugins/copilot-chat.lua<CR>', { desc = 'Edit copilot-chat.lua' })
vim.keymap.set('n', '<leader>eb', '<cmd>e ~/.config/nvim/lua/plugins/blink.cmp.lua<CR>', { desc = 'Edit blink.cmp.lua' })
vim.keymap.set('n', '<leader>en', '<cmd>e ~/.config/nvim/lua/plugins/nvim-lspconfig.lua<CR>', { desc = 'Edit nvim-lspconfig.lua' })

-- Project files
vim.keymap.set('n', '<leader>epl', '<cmd>e ~/.config/nvim/lua/config/plugins.lua<CR>', { desc = 'Edit plugins.lua' })
vim.keymap.set('n', '<leader>eph', '<cmd>e i/package.json<CR>', { desc = 'Edit package.json' })
vim.keymap.set('n', '<leader>epc', '<cmd>e i/server/package.json<CR>', { desc = 'Edit client/package.json' })
vim.keymap.set('n', '<leader>eps', '<cmd>e i/client/package.json<CR>', { desc = 'Edit server/package.json' })

-- Edit files
vim.keymap.sejt('n', '<leader>ea', '<cmd>e ~/.aliases<CR>', { desc = 'Edit ~/.aliases' })
vim.keymap.set('n', '<leader>eal', '<cmd>e ~/.aliases.local<CR>', { desc = 'Edit ~/.aliases.local' })
vim.keymap.set('n', '<leader>eap', '<cmd>e ~/.aliases.private<CR>', { desc = 'Edit ~/.aliases.private' })
vim.keymap.set('n', '<leader>eb', '<cmd>e ~/.bashrc<CR>', { desc = 'Edit ~/.bashrc' })
vim.keymap.set('n', '<leader>ebp', '<cmd>e ~/.bash_profile<CR>', { desc = 'Edit ~/.bash_profile' })
vim.keymap.set('n', '<leader>ebpl', '<cmd>e ~/.bash_profile.local<CR>', { desc = 'Edit ~/.bash_profile.local' })
vim.keymap.set('n', '<leader>es', '<cmd>e ~/.slate<CR>', { desc = 'Edit ~/.slate' })
vim.keymap.set('n', '<leader>en', '<cmd>e ~/.functions<CR>', { desc = 'Edit ~/.functions' })
vim.keymap.set('n', '<leader>eal', '<cmd>e ~/.aliases.local<CR>', { desc = 'Edit ~/.aliases.local' })

-- Location Navigation
vim.keymap.set('n', '<leader>lo', '<cmd>lopen<CR>', { desc = ':lopen - Open Location Window' })
-- vim.keymap.set('n', '<leader>ln', '<cmd>lnext<CR>', { desc = ':lnext - Location Next' })
-- vim.keymap.set('n', '<leader>lp', '<cmd>lprevious<CR>', { desc = ':lprevious - Location Previous' })

-- Quick fix navigation
vim.keymap.set('n', '<leader>co', '<cmd>copen<CR>', { desc = ':open - Open Quickfix Window' })
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<CR>', { desc = ':cnext - Next Error' })
vim.keymap.set('n', '<leader>cp', '<cmd>cprevious<CR>', { desc = ':cprevious - Previous Error' })

-- Buffer navigation
vim.keymap.set('n', '<leader>j', '<cmd>bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>J', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })

-- [[ PLugins Keymaps ]]

-- Fzf Lua
vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<CR>', { desc = 'Fzf files', noremap = true })
vim.keymap.set('n', '<C-t>', '<cmd>FzfLua grep_cword<CR>', { desc = 'Fzf word under the cursor', noremap = true })
vim.keymap.set('n', '<leader>a', '<cmd>FzfLua grep<CR>', { desc = 'Fzf grep text', noremap = true })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Fzf buffers', noremap = true })
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua<CR>', { desc = 'Fzf command options', noremap = true })
vim.keymap.set('n', '<leader>fi', ':FzfLua grep cwd=', { desc = 'Fzf in directory', noremap = true })
vim.keymap.set('n', '<leader>fn', '<cmd>FzfLua files cwd=~/.config/nvim<CR>', { desc = 'Fzf nvim configs', noremap = true })
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'Fzf files', noremap = true })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = 'Fzf buffers', noremap = true })
vim.keymap.set('n', '<leader>fl', '<cmd>FzfLua live_grep_native<CR>', { desc = 'Fzf live grep', noremap = true })
vim.keymap.set('n', '<leader>fw', '<cmd>FzfLua grep_cword<CR>', { desc = 'Fzf word under the cursor', noremap = true })
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua live_grep_resume<CR>', { desc = 'Fzf resume', noremap = true })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua helptags<CR>', { desc = 'Fzf nvim help', noremap = true })
vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua keymaps<CR>', { desc = 'Fzf shortcuts', noremap = true })
vim.keymap.set('n', '<leader>fd', '<cmd>FzfLua diagnostics_document<CR>', { desc = 'Fzf diagnostic in file', noremap = true })
vim.keymap.set('n', '<leader>fw', '<cmd>FzfLua diagnostics_workspace<CR>', { desc = 'Fzf diagnostic in workspace', noremap = true })

-- Telescope
vim.keymap.set('n', '<leader>tg', ':Telescope grep_string search=', { noremap = true, desc = 'Live Grep' })
vim.keymap.set('n', '<leader>tl', ':Telescope grep_string search=', { noremap = true, desc = 'Live Grep' })
vim.keymap.set('n', '<leader>td', ':Telescope live_grep search_dirs=', { noremap = true, desc = 'Live Grep' })
-- vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { noremap = true })
-- vim.keymap.set('n', '<C-t>', function()
--   local word = vim.fn.expand '<cword>' -- Get the word under the cursor
--   require('telescope.builtin').grep_string { search = word }
-- end)
-- vim.keymap.set('n', '<C-t>', require('telescope.builtin').grep_string, { noremap = true, desc = '[S]earch current [W]ord' })

-- neo-tree
-- vim.keymap.set('n', '<leader>f', '<cmd>Neotree reveal<CR>', { desc = 'Reveal file in Neotree', noremap = true })
-- vim.keymap.set('n', '<leader>F', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file in Neotree', noremap = true })
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true })
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
-- vim.keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true })

-- Copilot
vim.keymap.set('n', '<leader>ct', '<cmd>Copilot toggle<CR>', { desc = 'Copilot toggle', noremap = true })
vim.keymap.set('n', '<leader>cg', '<cmd>Copilot suggestion<CR>', { desc = 'Copilot suggestion', noremap = true })
vim.keymap.set('n', '<leader>cs', '<cmd>Copilot status<CR>', { desc = 'Copilot status', noremap = true })
vim.keymap.set('n', '<leader>cp', '<cmd>Copilot panel<CR>', { desc = 'Copilot panel', noremap = true })

-- Copilot Chat
vim.keymap.set('n', '<C-G>', '<cmd>CopilotChatToggle<CR>i', { noremap = true })
vim.keymap.set('n', '<leader>cp', '<cmd>CopilotChatPrompts<kCR>', { noremap = true })
vim.keymap.set('n', '<leader>cr', '<cmd>CopilotChatReset<CR>', { desc = 'Copilot reset', noremap = true })
vim.keymap.set('v', '<C-e>', '<cmd>CopilotChatExplain<CR>', { noremap = true })

-- Conform
vim.keymap.set('n', '<leader>ci', '<cmd>ConformInfo<CR>', { desc = 'Conform Info', noremap = true })
