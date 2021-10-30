-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/opdavies/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/opdavies/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/opdavies/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/opdavies/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/opdavies/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbuddy.nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/gruvbuddy.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["jellybeans.vim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/jellybeans.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["scss-syntax.vim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/scss-syntax.vim"
  },
  ["seiya.vim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/seiya.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-case-change"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-case-change"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/opdavies/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
