-- This moves windows into my preferred screen position on my desktop.
hs.hotkey.bind({"cmd", "alt", "shift"}, "`", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h
  local dockWidth = mode.w - frame.w

  local ratio = 0.969791667
  local width = 128 * 10 + 8
  local height = 63 * 20 - 10

  local win = hs.window.focusedWindow()
  local f = win:frame()

  local leftMargin = 100

  f.y = barHeight
  f.x = leftMargin
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
