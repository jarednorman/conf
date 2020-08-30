-- This moves windows into my preferred screen position on my desktop.
hs.hotkey.bind({"cmd", "alt", "shift"}, "`", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h

  local width = frame.w
  local height = frame.h

  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = barHeight
  f.x = 0
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
