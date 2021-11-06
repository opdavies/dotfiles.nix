local function init()
  require 'opdavies.vim'.init()
  require 'opdavies.packer'.init()
end

return {
  init = init
}
