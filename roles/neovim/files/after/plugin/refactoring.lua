local status_ok, refactoring = pcall(require, "refactoring")
if not status_ok then
  return
end

-- TODO: add keymaps - https://github.com/ThePrimeagen/refactoring.nvim#configuration-for-refactoring-operations
refactoring.setup {}
