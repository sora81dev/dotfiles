require("null-ls").setup({
  sources = {
    -- Use prettier instead of nix installed when project which installed node modules prettier.
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin"
    })
  }
})
