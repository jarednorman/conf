-- This moves windows into position for streaming.
hs.hotkey.bind({"cmd", "alt", "shift"}, "M", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h

  local width = 1006
  local height = 900

  local win = hs.window.focusedWindow()
  local f = win:frame()

  local padding = (frame.h - height) / 2

  f.y = barHeight + padding
  f.x = padding
  f.w = width
  f.h = height

  win:setFrame(f)
end)

TERMWIDTH = 960
XPADDING = 32
YPADDING = XPADDING - 0.5

-- This moves windows into my preferred screen position on my desktop.
hs.hotkey.bind({"cmd", "alt", "shift"}, "`", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h

  local width = frame.w - 2 * XPADDING
  local height = frame.h - 2 * YPADDING

  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = barHeight + YPADDING
  f.x = XPADDING
  f.w = width
  f.h = height

  win:setFrame(f)
end)

-- This moves windows into my preferred screen position on my desktop.
hs.hotkey.bind({"cmd", "alt", "shift"}, "1", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h

  local width = frame.w - 3 * XPADDING - TERMWIDTH
  local height = frame.h - 2 * YPADDING

  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = barHeight + YPADDING
  f.x = XPADDING
  f.w = width
  f.h = height

  win:setFrame(f)
end)

-- This moves windows into my preferred screen position on my desktop.
hs.hotkey.bind({"cmd", "alt", "shift"}, "2", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h

  local width = TERMWIDTH
  local height = frame.h - 2 * YPADDING

  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = barHeight + YPADDING
  f.x = frame.w - XPADDING - width
  f.w = width
  f.h = height

  win:setFrame(f)
end)
hs.hotkey.bind({"alt"}, "1", function()
  hs.application.get("Firefox"):activate()
end)

hs.hotkey.bind({"alt"}, "2", function()
  hs.application.get("iTerm2"):activate()
end)

hs.hotkey.bind({"alt"}, "3", function()
  hs.application.get("Slack"):activate()
end)

hs.hotkey.bind({"alt"}, "4", function()
  hs.application.get("Basecamp 3"):activate()
end)
