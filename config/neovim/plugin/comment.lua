local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  padding = true,

  opleader = {
    line = "gc",
    block = "gb",
  },

  mappings = {
    basic = true,
    extra = true,
    extended = false,
  },
}
