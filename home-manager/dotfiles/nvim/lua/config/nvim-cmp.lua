require('cmp').setup({
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
})
