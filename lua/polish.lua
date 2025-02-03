
-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

local hl_groups = vim.api.nvim_get_hl(0, {})

for key, hl_group in pairs(hl_groups) do
  if hl_group.italic then
    vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, {italic = false}))
  end
end
