vim.fn["edit_alternate#rule#add"]("php", function(filename)
  if filename:find "Test.php$" then
    filename = filename:gsub("Test.php$", ".php")

    if filename:find "tests/src/" then
      -- Drupal tests. Remove the `src/{type}` from the path.
      return filename:gsub("tests/src/(.-)/", "src/")
    else
      return filename:gsub("tests/", "src/")
    end
  else
    filename = filename:gsub(".php$", "Test.php")

    if filename:find "modules/custom" then
      -- Drupal test types.
      local test_types = { "Functional", "FunctionalJavaScript", "Kernel", "Unit" }

      for _, test_type in ipairs(test_types) do
        local filename_with_test_type = filename:gsub("src/", string.format("tests/src/%s/", test_type))

        -- Return the first matching test file that exists.
        if vim.fn.filereadable(filename_with_test_type) == 1 then
          return filename_with_test_type
        end
      end
    end
  end
end)

if vim.fn.filereadable "fractal.config.js" == 1 then
  vim.fn["edit_alternate#rule#add"]("twig", function(filename)
    return (filename:gsub("%.twig$", ".config.yml"))
  end)

  vim.fn["edit_alternate#rule#add"]("yml", function(filename)
    return (filename:gsub("%.config.yml$", ".twig"))
  end)
end

vim.keymap.set("n", "<leader>ea", "<CMD>EditAlternate<CR>", { silent = true })
