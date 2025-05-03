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

-- Other common keymaps
-- Select word
vim.keymap.set('n', '<leader>w', 'viw')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>td', f.toggle_diagnostic_loclist, { desc = '[T]oggle [d]iagnostic location list', noremap = true })

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

-- Terminal mode
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Map it to a key (e.g., <leader>r to reload)
vim.keymap.set('n', '<leader>E', '<cmd>e<CR>', { desc = 'Reload current file', noremap = true })
vim.keymap.set('n', '<leader>rc', f.reload_configs, { desc = 'Reload init.lua config', noremap = true })
vim.keymap.set('n', '<leader>rb', f.reload_configs, { desc = 'Reload init.lua config', noremap = true })
vim.keymap.set('n', '<leader>rl', '<cmd>Lazy sync<CR>', { desc = 'Reload lazy.vim plugins', noremap = true })

-- command Shortcuts
vim.keymap.set('n', '<leader>l<space>', '<cmd>lua<space>', { desc = 'Run :lua', noremap = true })
vim.keymap.set('n', '<leader>lp', f.edit_in_command('print("")', 2), { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>lv', f.edit_in_command('print(vim.o.)', 1), { desc = 'Run :lua print(...)', noremap = true })
vim.keymap.set('n', '<leader>lq', f.edit_in_command('vim.cmd("")', 2), { desc = 'Run :lua vim.cmd(...)', noremap = true })
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
vim.keymap.set('n', '<leader><leader>x', '<cmd>x<CR>', { desc = 'Save and quite file ', noremap = true })
vim.keymap.set('n', '<leader><leader>e', '<cmd>.lua<CR>', { desc = 'Execute current line ', noremap = true })
vim.keymap.set('v', '<leader><leader>e', '<cmd>lua<CR>', { desc = 'Execute current selection', noremap = true })

vim.keymap.set('n', '<leader><space>', '<cmd>tabnext<CR>', { desc = 'Tab Next', noremap = true })
vim.keymap.set('n', '<leader><leader><space>', '<cmd>tabprevious<CR>', { desc = 'Tab Previous', noremap = true })
vim.keymap.set('n', '<leader><leader>q', '<cmd>q<CR>', { desc = 'Quite file without save', noremap = true })
vim.keymap.set('n', '<leader><leader>!', '<cmd>qa<CR>', { desc = 'Quite file without save', noremap = true })

-- Write files
vim.keymap.set('n', '<leader>ws', '<cmd>w<CR>', { desc = 'Save file ', noremap = true })

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
vim.keymap.set('n', '<leader>epl', '<cmd>e ~/.config/nvim/lua/config/plugins.lua<CR>', { desc = 'Edit plugins.lua' })

-- Project files
vim.keymap.set('n', '<leader>ep', '<cmd>e ./package.json<CR>', { desc = 'Edit package.json' })
vim.keymap.set('n', '<leader>epc', '<cmd>e ./server/package.json<CR>', { desc = 'Edit client/package.json' })
vim.keymap.set('n', '<leader>eps', '<cmd>e ./client/package.json<CR>', { desc = 'Edit server/package.json' })

-- Edit files
vim.keymap.set('n', '<leader>ea', '<cmd>e ~/.aliases<CR>', { desc = 'Edit ~/.aliases' })
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
vim.keymap.set('n', '<leader>ln', '<cmd>lnext<CR>', { desc = ':lnext - Location Next' })
vim.keymap.set('n', '<leader>lp', '<cmd>lprevious<CR>', { desc = ':lprevious - Location Previous' })
vim.keymap.set('n', '<leader>lc', '<cmd>lclose<CR>', { desc = ':lclose - Location Close' })

-- Quick fix navigation
vim.keymap.set('n', '<leader>co', '<cmd>copen<CR>', { desc = ':copen - Open Quickfix Window' })
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<CR>', { desc = ':cnext - Next Error' })
vim.keymap.set('n', '<leader>cp', '<cmd>cprevious<CR>', { desc = ':cprevious - Previous Error' })
vim.keymap.set('n', '<leader>cc', '<cmd>close<CR>', { desc = ':cclose - Quickfix Close' })

-- Buffer
vim.keymap.set('n', '<leader>j', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>J', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [d]elte' })

-- [[ PLugins Keymaps ]]

-- [ Fzf Lua ]
vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<CR>', { desc = 'Fzf files', noremap = true })
vim.keymap.set('n', '<C-t>', '<cmd>FzfLua grep_cword<CR>', { desc = 'Fzf word under the cursor', noremap = true })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep_native<CR>', { desc = 'Fzf live grep', noremap = true })
vim.keymap.set('n', '<leader>a', '<cmd>FzfLua grep<CR>', { desc = 'Fzf grep text', noremap = true })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Fzf buffers', noremap = true })
vim.keymap.set('n', '<leader>fo', '<cmd>FzfLua<CR>', { desc = 'Fzf options', noremap = true })
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua commands<CR>', { desc = 'Fzf nvim commands', noremap = true })
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
vim.keymap.set('n', '<leader>ft', '<cmd>TodoFzfLua<CR>', { desc = 'Fzf TODO, NOTE', noremap = true })

-- [ Telescope ]
-- vim.keymap.set('n', '<leader>tg', ':Telescope grep_string search=', { noremap = true, desc = 'Telescope Grep String' })
-- vim.keymap.set('n', '<leader>td', ':Telescope live_grep search_dirs=', { noremap = true, desc = 'Telescope Live Grep' })
-- vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { noremap = true, 'Open telescope' })
-- vim.keymap.set('n', '<C-t>', require('telescope.builtin').grep_string, { noremap = true, desc = '[S]earch current [W]ord' })

-- [ neo-tree ]
-- vim.keymap.set('n', '<leader>f', '<cmd>Neotree reveal<CR>', { desc = 'Reveal file in Neotree', noremap = true })
-- vim.keymap.set('n', '<leader>F', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file in Neotree', noremap = true })
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true })
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
-- vim.keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true })

-- [ Copilot ]
vim.keymap.set('n', '<leader>tc', '<cmd>Copilot toggle<CR>', { desc = '[T]oggle [c]opilot', noremap = true })
vim.keymap.set('n', '<leader>cg', '<cmd>Copilot suggestion<CR>', { desc = 'Copilot suggestion', noremap = true })
vim.keymap.set('n', '<leader>cs', '<cmd>Copilot status<CR>', { desc = 'Copilot status', noremap = true })
vim.keymap.set('n', '<leader>cp', '<cmd>Copilot panel<CR>', { desc = 'Copilot panel', noremap = true })

-- [ Copilot Chat ]
vim.keymap.set('n', '<C-G>', '<cmd>CopilotChatToggle<CR>i', { noremap = true })
vim.keymap.set('v', '<C-G>', '<cmd>CopilotChatToggle<CR>i', { noremap = true })
vim.keymap.set('n', '<leader>cp', '<cmd>CopilotChatPrompts<kCR>', { noremap = true })
vim.keymap.set('n', '<leader>cr', '<cmd>CopilotChatReset<CR>', { desc = 'Copilot reset', noremap = true })
vim.keymap.set('v', '<C-e>', '<cmd>CopilotChatExplain<CR>', { noremap = true })

-- Conform Plugin
vim.keymap.set('n', '<leader>ci', '<cmd>ConformInfo<CR>', { desc = 'Conform Info', noremap = true })

-- [ Lazygit Plugin ]
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<CR>', { desc = 'Open Lazygit [g]', noremap = true })

-- [ nvim-tree ]
vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeFindFileToggle<CR>', { desc = '[T]oggle [f]ile navigation', noremap = true })
vim.keymap.set('n', '<leader><leader>f', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file navigation', noremap = true })

-- [ Gitsigns ]
-- visual mode
local gitsigns = require 'gitsigns'
vim.keymap.set('v', '<leader>hs', function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'git [s]tage hunk' })
vim.keymap.set('v', '<leader>hr', function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'git [r]eset hunk' })

-- normal mode
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
vim.keymap.set('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
vim.keymap.set('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
vim.keymap.set('n', '<leader>hD', function()
  gitsigns.diffthis '@'
end, { desc = 'git [D]iff against last commit' })

-- Toggle inline
vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
vim.keymap.set('n', '<leader>tp', gitsigns.preview_hunk_inline, { desc = '[T]oggle git [p]review hunk inline' })

-- Git comands
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame<CR>', { desc = 'git[g] blame[b]', noremap = true })
vim.keymap.set('n', '<leader>gc', '<cmd>Gitsigns<CR>', { desc = 'git[g] commands[c]', noremap = true })

-- [ Mason ]
vim.keymap.set('n', '<leader>tm', '<cmd>Mason<CR>', { desc = '[T]oggle [m]ason', noremap = true })

-- [ Specter ]
-- Normal mode
local spectre = require 'spectre'
vim.keymap.set('n', '<leader>tr', '<cmd>lua require("spectre").toggle()<CR>', { desc = '[T]oggle search and [r]eplace' })
vim.keymap.set('n', '<leader>rr', spectre.open, { desc = 'Open Spectre (Search and Replace)' })
vim.keymap.set('n', '<leader>rw', ':%s/<C-r><C-w>/', { desc = 'Open Spectre (Search and Replace)' })
vim.keymap.set('n', '<leader>rs', function()
  require('spectre').open_visual { select_word = true }
end, { desc = 'Search current word' })

-- Visual mode
vim.keymap.set('v', '<leader>rs', spectre.open_visual, { desc = 'Search selection' })
