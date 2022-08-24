local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '~/.local/share/nvim/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
