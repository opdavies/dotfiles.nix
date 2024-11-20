local M = {}

local function should_remove_diagnostic(messages_to_filter, message)
  for _, filter_message in ipairs(messages_to_filter) do
    if message:match(filter_message) then
      return true
    end
  end

  return false
end

M.definition = function()
  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, config)
    local bufnr = ctx.bufnr
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

    local new_result = vim.tbl_filter(function(v)
      -- Remove any definitions within the nix store via the .direnv directory.
      if string.find(v.targetUri, ".direnv") then
        return false
      end

      -- Remove definitions within vendor-bin directory for PHP files.
      if ft == "php" then
        if string.find(v.targetUri, "vendor%-bin") then
          return false
        end
      end

      return true
    end, result)

    if #new_result > 0 then
      result = new_result
    end

    vim.lsp.handlers["textDocument/definition"](err, result, ctx, config)
    vim.cmd [[normal! zz]]
  end)
end

M.on_publish_diagnostics = function(_, result, ctx, config)
  local client = vim.lsp.get_client_by_id(ctx.client_id)

  if client.name == "cssls" then
    local filtered_diagnostics = {}

    local messages_to_filter = {
      "Unknown at rule @apply",
      "Unknown at rule @plugin",
      "Unknown at rule @tailwind",
      "Unknown at rule @theme",
    }

    -- For each diagnostic, ensure its mesages doesn't match one I want to
    -- ignore before adding it to the result. If it matches, don't add it to the
    -- result and it won't be shown.
    for _, diagnostic in ipairs(result.diagnostics) do
      if not should_remove_diagnostic(messages_to_filter, diagnostic.message) then
        table.insert(filtered_diagnostics, diagnostic)
      end
    end

    result.diagnostics = filtered_diagnostics
  end

  vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

return M
