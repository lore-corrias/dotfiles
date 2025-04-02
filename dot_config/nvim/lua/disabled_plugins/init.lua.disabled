local plugin_dir = vim.fn.stdpath("config") .. "/lua/conf-plugins"

for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
  if file ~= "init.lua" and file:match("%.lua$") then
    require("conf-plugins." .. file:gsub("%.lua$", ""))
  end
end
