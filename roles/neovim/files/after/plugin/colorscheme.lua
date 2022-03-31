local colorbuddy_status_ok, colorbuddy = pcall(require, "colorbuddy")
if not colorbuddy_status_ok then
  return
end

local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
  return
end

colorbuddy.colorscheme "gruvbuddy"

colorizer.setup {}
