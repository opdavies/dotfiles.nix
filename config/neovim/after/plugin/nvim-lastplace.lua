local has_lastplace, lastplace = pcall(require, "nvim-lastplace")
if not has_lastplace then
  return
end

lastplace.setup {}
