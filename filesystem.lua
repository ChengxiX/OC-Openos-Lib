local lfs = require("lfs")
local filesystem = {}

function filesystem.list(path)
  local res = {}
  local index = 1
  for i in lfs.dir(path) do
    table.insert(res, i)
  end
  return function ()
    index = index + 1
    return res[index - 1]
  end
end

function filesystem.exists(filepath)
  file,err = io.open(filepath)
  if file == nil and err ~= nil then
    return false
  else
    if file ~= nil then file:close() end
    return true
  end
end
return filesystem