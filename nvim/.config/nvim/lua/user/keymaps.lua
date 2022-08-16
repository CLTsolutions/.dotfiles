local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--========
-- MODES
--========
  --  "n" = normal_mode
  --  "i" = insert_mode
  --  "v" = visual_mode
  --  "x" = visual_block_mode
  --  "t" = term_mode
  --  "c" = command_mode

--========
-- INSERT
--========
  -- remap escape
keymap("i", "jj", "<Esc>", opts)

  -- move text up and down quickly (like in vs code)
keymap("i", "∆", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "˚", "<Esc>:m .-2<CR>==gi", opts)

--========
-- NORMAL
--========
  -- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

  -- netrw
keymap("n", "<leader>e", ":Lex 30<CR>", opts)

  -- nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>o", ":Format<CR>", opts)

  -- resize with arrows
keymap("n", "<C-u>", ":resize +2<CR>", opts)
keymap("n", "<C-d>", ":resize -2<CR>", opts)
keymap("n", "<C-s>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-g>", ":vertical resize +2<CR>", opts)

  -- navigate, remove, and reorder buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":Bdelete!<CR>", opts)
keymap("n", "<leader>n", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>p", ":BufferLineMovePrev<CR>", opts)

  -- remove highlight after search
keymap("n", "<leader>c", ":noh<CR>", opts)

  -- move text up and down quickly (like in vs code)
keymap("n", "∆", ":m .+1<CR>==", opts)
keymap("n", "˚", ":m .-2<CR>==", opts)

  -- markdown preview
keymap("n", "<leader>m", ":MarkdownPreview<CR>", opts)

  -- TELESCOPE
    -- find and grep files
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes'))<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers()<cr>", opts)
    -- git
keymap("n", "<leader>gc", "<cmd>lua require'telescope.builtin'.git_bcommits()<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require'telescope.builtin'.git_status()<cr>", opts)


keymap("n", "Ω",":lua ToggleWordWrap()<CR>", opts)

--========
-- VISUAL
--========
  -- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

  -- move text up and down
keymap("v", "∆", ":m >+1<CR>gv=gv", opts)
keymap("v", "˚", ":m <-2<CR>gv=gv", opts)

  -- persists yanked text
-- keymap("v", "p", '"_dP', opts)

--==============
-- VISUAL BLOCK
--==============
  -- move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "∆", ":move '>+1<CR>gv-gv", opts)
keymap("x", "˚", ":move '<-2<CR>gv-gv", opts)

--==========
-- TERMINAL
--==========
  -- better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--=======
-- OTHER
--=======
  -- word wrap
function ToggleWordWrap()
    if vim.wo.wrap == true then
        vim.wo.wrap = false
        print("line wrap is OFF")
    else
        vim.wo.wrap = true
        print("line wrap is ON")
    end
end
