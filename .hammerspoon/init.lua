-- require "cherry"   -- Tiny Pomodoro timer

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

Install:andUse("ReloadConfiguration")
spoon.ReloadConfiguration:start()


local hyper = {"alt", "cmd"}
local hypershift = { "alt", "cmd", "shift" }
local hypersmash = {"alt", "cmd", "ctrl" }

Install:andUse("WindowGrid",
               {
                 config = { gridGeometries = { { "16x4" } } },
                 hotkeys = {show_grid = {hyper, "g"}},
                 start = true
               }
)

local hotkey = require "hs.hotkey"
local grid = require "hs.grid"

function pushWindowDownMore()
  hs.grid.pushWindowDown()
  hs.grid.pushWindowDown()
end


function pushWindowUpMore()
  hs.grid.pushWindowUoMore()
  hs.grid.pushWindowUpMore()
end


function pushWindowLeftMore()
  hs.grid.pushWindowLeft()
  hs.grid.pushWindowLeft()
end


function pushWindowRightMore()
  hs.grid.pushWindowRight()
  hs.grid.pushWindowRight()
end


--Move windows
hotkey.bind(hyper, 'down', grid.pushWindowDown)
hotkey.bind(hyper, 'up', grid.pushWindowUp)
hotkey.bind(hyper, 'left', grid.pushWindowLeft)
hotkey.bind(hyper, 'right', grid.pushWindowRight)

--Move windows
hotkey.bind(hypersmash, 'down', pushWindowDownMore)
hotkey.bind(hypersmash, 'up', pushWindowUpMore)
hotkey.bind(hypersmash, 'left', pushWindowLeftMore)
hotkey.bind(hypersmash, 'right', pushWindowRightMore)

--resize windows
hotkey.bind(hypershift, 'up', grid.resizeWindowShorter)
hotkey.bind(hypershift, 'down', grid.resizeWindowTaller)
hotkey.bind(hypershift, 'right', grid.resizeWindowWider)
hotkey.bind(hypershift, 'left', grid.resizeWindowThinner)

-- translate
local wm=hs.webview.windowMasks
Install:andUse("PopupTranslateSelection",
               {
                 config = {
                   popup_style = wm.utility|wm.HUD|wm.titled|wm.closable|wm.resizable,
                 },
                 hotkeys = {
                   translate_to_en = { hypersmash, "t" }
                 }
               }
)

-- keyboard info
Install:andUse("KSheet",
               {
                 hotkeys = {
                   toggle = { hyper, "/" }
}})

-- show logo to indicate restart
Install:andUse('FadeLogo')
spoon.FadeLogo.image_size = hs.geometry.size(80, 80)
spoon.FadeLogo.run_time = 0.5
spoon.FadeLogo:start()

