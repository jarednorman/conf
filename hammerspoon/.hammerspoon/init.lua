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

-- This moves windows into my preferred screen position on my desktop.
hs.hotkey.bind({"cmd", "alt", "shift"}, "P", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h

  local xPadding = 202
  local yPadding = 86

  local width = frame.w - 2 * xPadding
  local height = frame.h - 2 * yPadding

  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = barHeight + yPadding
  f.x = xPadding
  f.w = width
  f.h = height

  win:setFrame(f)
end)

hs.hotkey.bind({"alt"}, "1", function()
  hs.application.get("Firefox"):activate()
end)

hs.hotkey.bind({"alt"}, "2", function()
  hs.application.get("Alacritty"):activate()
end)

hs.hotkey.bind({"alt"}, "3", function()
  hs.application.get("Slack"):activate()
end)

hs.hotkey.bind({"alt"}, "4", function()
  hs.application.get("Basecamp 3"):activate()
end)
