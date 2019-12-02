-- This moves windows into position for streaming.
hs.hotkey.bind({"cmd", "alt", "shift"}, "M", function()
  local mode = hs.screen.mainScreen():currentMode()
  local frame = hs.screen.mainScreen():frame()
  local barHeight = mode.h - frame.h

  local win = hs.window.focusedWindow()
  local f = win:frame()

  local padding = (frame.h - 1048) / 2

  f.y = barHeight + padding
  f.x = padding
  f.w = 1258
  f.h = 1048
  win:setFrame(f)
end)

