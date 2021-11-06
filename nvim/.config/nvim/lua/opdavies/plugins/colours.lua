local function init()
  require("colorbuddy").colorscheme("gruvbuddy")

  require'colorizer'.setup()
end

return {
  init = init
}
