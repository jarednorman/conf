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

XPADDING = 31
YPADDING = XPADDING - 1.5

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

local hotkey = function(index, applicationName)
  hs.hotkey.bind({"alt"}, index, function()
    hs.application.get(applicationName):activate()
  end)
end

hotkey("1", "Google Chrome")
hotkey("2", "iTerm2")
hotkey("3", "Slack")
hotkey("4", "Basecamp 3")
