local scheme = require "red/syntax/scheme"

local function endsect(ctx, txt, i)
  if txt[i] == '\n' and txt[i+1] ~= ' ' then
    return 1
  end
end

local function numbersect(ctx, txt, pos, epos)
  local n = ''
  for i = pos, epos do
    if txt[i]:find("[0-9]") then
      n = n .. txt[i]
    elseif txt[i] == '.' then
      break
    else
      return
    end
  end
  return n:len() + 1
end

local col = {
  col = 0,
  keywords = {
    { '\\*', '\\#', '\\-', },
  },
  { -- section
    linestart = '#',
    stop = '\n',
    col = scheme.lib,
  },
  { -- items
    linestart = '*',
    stop = endsect,
    col = scheme.number,
  },
  { -- items
    linestart = '-',
    stop = endsect,
    col = scheme.number,
  },
  { -- items
    linestart = numbersect,
    stop = endsect,
    col = scheme.number,
  },
  { -- quote
    linestart = '>',
    stop = '\n',
    col = scheme.comment,
  },
  { -- code
    linestart = '    ',
    stop = '\n',
    col = scheme.string,
  },
  { -- code
    linestart = '```',
    stop = '```',
    col = scheme.string,
  },
  { -- strong
    start = '**',
    stop = '**',
    col = scheme.keyword,
    keywords = {
      { '\\*', '\\\\', },
    },
  },
  { -- strong
    start = '*',
    stop = '*',
    col = scheme.keyword,
    keywords = {
      { '\\*', '\\\\', },
    },
  },
}

return col
