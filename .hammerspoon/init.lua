--hs.logger.defaultLogLevel = "verbose"
require("hs.ipc") -- to enable cli interaction

-- global config
config = {
  apps = {
    terms    = { 'iterm2'                   },
    browsers = { 'Opera', 'Firefox', 'Google Chrome', 'Safari' }
  },

  wm = {
    defaultDisplayLayouts = {
      ['Color LCD']    = 'monocle',
      ['C49RG9x'] = 'main-center'
    },

    displayLayouts = {
      ['Color LCD']    = { 'monocle', 'main-right', 'side-by-side'     },
      ['C49RG9x'] = { 'main-center', 'main-right', 'side-by-side' }
    }
  },

  window = {
    highlightBorder = false,
    highlightMouse  = true,
    historyLimit    = 0
  },

  network = {
    home = 'andersens'
  }
}

--hswm = require("hswm")

-- SpoonInstall is the only spoon you need to install manually.
-- http://www.hammerspoon.org/Spoons/SpoonInstall.html
-- Once installed other spoons can be automatically installed.
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

-- define the yper/leader keys I prefer to use
local hyper = {"alt", "cmd"}
local hypershift = { "alt", "cmd", "shift" }
local hypersmash = {"alt", "cmd", "ctrl" }
local meh = {"alt","shift","ctrl"}
-- ReloadConfiguration to restart Hammerspoon
-- As I often ended up wit partial configs tat would
-- fail to load i clear te watch paths and just use te otkey.
Install:andUse("ReloadConfiguration",
               {
                 config = { watch_paths = {} },
                 hotkeys = { reloadConfiguration = { hypersmash, "h"} }
               }
)


-- If you want to set the layouts that are enabled
--tiling.set('layouts', {
--  'fullscreen', 'main-vertical'
--})


--Install:andUse("UnsplashZ")

--[[ht = hs.loadSpoon("HammerText")
ht.keywords ={
  nname = "Max Rydahl Andersen",
  ddate = function() return os.date("%Y-%m-%d") end,
}
ht:start()
--]]

--[[Install:andUse("HammerText",
               {
                 start = true,
                 config = {
                   keywords = {
                     xdate = function() return os.date("%B %d, %Y") end,
                     nname = "Max Rydahl Andersen"
                   }
                 }
               }
)

--]]

Install:andUse("WindowGrid",
               {
                 config = { gridGeometries = { { "16x4" } } },
                 hotkeys = {show_grid = {hyper, "g"}},
                 start = true
               }
) 

pwdgen = Install:andUse("PasswordGenerator",
               {
                 config = {
                   password_style = "xkcd",
                   word_count = 3,
                   word_leet = 1,
                   word_separators = "-",
                   word_uppercase = 1
                 }, hotkeys = {  
                  copypaste =  {hyper,"x"} 
                }
               }
)


local hotkey = require "hs.hotkey"
local grid = require "hs.grid"

--- start quick open applications 
function open_app(name)
  return function()
      hs.application.launchOrFocus(name)
      if name == 'Finder' then
          hs.appfinder.appFromName(name):activate()
      end
  end
end

hs.hotkey.bind(meh,"m",open_app("MailMate"))
hs.hotkey.bind(meh,"b",open_app("BusyCal"))
hs.hotkey.bind(meh,"r",open_app("Rambox"))

hs.hotkey.bind(meh,"e",open_app("Ecamm Live Beta")) 
hs.hotkey.bind(meh,"i",open_app("iTerm"))
hs.hotkey.bind(meh,"p",open_app("1Password 7"))




hs.hotkey.bind(hypersmash, "f", function() 
  local win = hs.window.focusedWindow()

  if(win == null) then
    local frontapp = hs.application.frontmostApplication()
    print(frontapp)
    print(frontapp:focusedWindow())
    print(hs.inspect(frontapp:allWindows()))
  end

  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

--  f.x = max.x
--  f.y = max.y
  f.w = 1920
  f.h = 1080
  win:setFrame(f)
end)

function pushWindowDownMore()
  hs.grid.pushWindowDown()
  hs.grid.pushWindowDown()
end


function pushWindowUpMore()
  hs.grid.pushWindowUpMore()
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

hotkey.bind(hyper, 'm', grid.maximizeWindow)

Install:andUse("Keychain")
spoon.Keychain.logger.defaultLogLevel = "verbddose"


function pdfpenimprint()
  print("Imprinting it all...")
  hs.osascript.applescriptFromFile("allpageswithtext.applescript")
end
hotkey.bind(hypersmash, 'p', pdfpenimprint)


function mountdrives()
  hs.applescript.applescript([[
    tell application "Finder"
      try
        mount volume "smb://admin@blackdata.local/media"
        mount volume "smb://admin@blackdata.local/photo"
        mount volume "smb://max@blackdata.local/backup"
      end try
    end tell
    ]])

end
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

Install:andUse("PopupConjugateSelection",
               {
                 config = {
                   popup_style = wm.utility|wm.HUD|wm.titled|wm.closable|wm.resizable,
                 },
                 hotkeys = {
                   conjugate_to_fr = { hypersmash, "c" }
                 }
               }
)


-- keyboard info
HSKeybindings_visible = false
function toggle_HSKeybindings()
  if HSKeybindings_visible then
    spoon.HSKeybindings:hide()
    HSKeybindings_visible = false
  else
    spoon.HSKeybindings:show()
    HSKeybindings_visible = true
  end
end
Install:andUse("HSKeybindings")
hs.hotkey.bind(hyper, "/", toggle_HSKeybindings)



-- layouts
positions = {
  maximized = hs.layout.maximized,
  centered = {x=0.15, y=0.15, w=0.7, h=0.7},

  left34 = {x=0, y=0, w=0.34, h=1},
  left50 = hs.layout.left50,
  left66 = {x=0, y=0, w=0.66, h=1},
  left70 = hs.layout.left70,

  right30 = hs.layout.right30,
  right34 = {x=0.66, y=0, w=0.34, h=1},
  right50 = hs.layout.right50,
  right66 = {x=0.34, y=0, w=0.66, h=1},

  upper50 = {x=0, y=0, w=1, h=0.5},
  upper50Left50 = {x=0, y=0, w=0.5, h=0.5},
  upper50Right15 = {x=0.85, y=0, w=0.15, h=0.5},
  upper50Right30 = {x=0.7, y=0, w=0.3, h=0.5},
  upper50Right50 = {x=0.5, y=0, w=0.5, h=0.5},

  lower50 = {x=0, y=0.5, w=1, h=0.5},
  lower50Left50 = {x=0, y=0.5, w=0.5, h=0.5},
  lower50Right50 = {x=0.5, y=0.5, w=0.5, h=0.5},

  chat = {x=0.5, y=0, w=0.35, h=0.5}
}

--
-- Layouts
--

-- https://github.com/Hammerspoon/hammerspoon/issues/547
focusbrowserwl=hs.window.layout.new({
    screens={['C49RG9x']="0,0"},
    -- Opera/safari windows, excluding preferences and fullscreen windows (for video)
    -- allowScreens='0,0' so that it only applies to windows on the main screen, 
    -- so in desk mode i can temporarily "tear off" Safari windows to the side 
    -- screens for manual management
    -- {{['Opera']={allowScreens='0,0', hasTitlebar=true,fullscreen=false,rejectTitles={'^Address bar drop down$'}}},
    {{['Firefox']={allowScreens='0,0', hasTitlebar=true,fullscreen=false}},
      -- main window in the middle, 2 windows tiled on the left side, remaining 
      -- windows on the right; the selector "closest" lets me change the "main" 
      -- window by sloppily moving it to the center (I use hs.grid)
      'move 1 closest [31.25,0,62.50,100] 0,0 | tile 2 vert [0,0,31.25,100] 0,0',
      'tile all 2x1 [62.5,0,100,100] 0,0'},
    { hs.window.filter.new(
        { MailMate = { allowRoles = "AXStandardWindow", rejectTitles="Activity Viewer" } }), "tile 2 focused 2x1 [62.50,0,100,100] 0,0" }
}, "FocusBrowser")

focusmailwl=hs.window.layout.new({
    screens={['C49RG9x']="0,0"},
    {{['Firefox']={allowScreens='0,0', hasTitlebar=true,fullscreen=false,rejectTitles={'^Address bar drop down$'}}},
      "tile 2 focused 2x1 [0,0,31.25,100] 0,0"    },
    { hs.window.filter.new(
        { MailMate = { allowRoles = "AXStandardWindow", rejectTitles="Activity Viewer" } }),
      'move 1 closest [31.25,0,62.50,100] 0,0 | tile 2 vert [0,0,31.25,100] 0,0',
      'tile all 2x1 [62.5,0,100,100] 0,0' }
}, "FocusMail")

sharedbigwl=hs.window.layout.new({ -- shared big layout
    screens={['C49RG9x']="0,0"},
    -- Finder windows also tiled on the right
    {'Finder','tile all 2x1 [70,0,100,100] 0,0'},
    -- Screen Sharing always at the top left whatever the resolution
    {'Screen Sharing','tile [0,0,100,100] 0,0'},
    {'Tweetbot', 'tile [18.75,0,31.25,100] 0,0'},
    {'Rambox', 'tile [12.5,0,31.25,100] 0,0'},
    {{['Textual IRC Client']={allowRoles="AXStandardWindow"}}, 'tile [12.5,0,31.25,100] 0,0'},
    {'Messages', 'tile [12.5,6,31.25,50] 0,0'},
    {'DevHub', 'tile [0,0,31.25,100] 0,0'},
    {'iTerm2', 'tile [62.50,0,81.25,100] 0,0'},
    {'Spotify','tile [62.50,50,100,100] 0,0'},
    {{['BusyCal']={rejectTitles={"General"}, allowRoles="AXStandardWindow"}}, 'tile [0,0,31.25,100] 0,0'},
   },'SharedBig')

--focusbrowserwl:start()
--focusmailwl:start()–

--sharedbigwl:start()


layouts = {
  {
    name="Writing Docs",
    description="Google Doc For fun and profit",
    apps={
      {"Firefox"},
      {"Tweetbot"},
      {"MailMate"}
    },
    layouts={
      focusbrowserwl
    }
  },
  {
    name="Mail",
    description="Pedal to the metal",
    apps={
      {"MailMate"},
    },
    layouts={
      focusmailwl
    }
  },
  {
    name="Peace",
    description="Hide everything",
    apps={
    }
  },
  {
    name="streaming",
    description="Kill anything that can interrupt",
    apps={
      {"Firefox"},
      {"Bluejeans"},
      {"Ecamm Live"},
    },
    kill={
      {"Rambox"},
      {"DevHub"},
      {"Tweetbot"},
      {"Messages"},
      {"MailMate"},
      {"Cisco Webex Meetings"},
      {"Spotify"}
    },
    layouts={
      focusbrowserwl
    }
  }
}

currentLayout = nil

-- launch apps if needed and apply layout
function applyLayout(layout)

  local screen = hs.screen.mainScreen()

  local chosenApps = layout.apps

  print("Current Layout " .. hs.inspect(currentLayout, {depth=2}))
  previousLayout = currentLayout
  currentLayout = layout

  -- stop whatever layout was active in previouslayout
  print("Previous layout " .. hs.inspect(previousLayout, {depth=1}))
  if previousLayout then
    print("Stopping previous layouts")
    for _, lo in ipairs(previousLayout.layouts) do
      print(lo)
      lo:stop()
    end
  end

  -- start layouts for new layout
  print("Starting layouts")
  for _, lo in ipairs(currentLayout.layouts) do
    print(lo)
    lo:start()
  end

  -- hide every app
  for _, app in ipairs(hs.application.runningApplications()) do
    if app then
  --    app:hide()
    end
  end

  -- launch or focus the apps chosen
  for _,row in pairs(chosenApps) do
    app = row[1]
    hs.application.launchOrFocus(app)
  end

  if currentLayout["kill"] ~= nil then
    for _,row in pairs(currentLayout["kill"]) do
      app = row[1]

      print("Trying to kill", app)
      todie = hs.appfinder.appFromName(app)
      print(app, hs.inspect(todie))
      if todie then
        hs.application.kill(todie)
      end
    end
  else
    print(hs.inspect(currentLayout.kill, {depth=2}))
    print("Nothing to kill")
  end

end

layoutChooser = hs.chooser.new(function(selection)
    if not selection then return end

    --applyLayout(layouts[selection.index])
end)
i = 0
layoutChooser:choices(hs.fnutils.imap(layouts, function(layout)
                                        i = i + 1

                                        return {
                                          index=i,
                                          text=layout.name,
                                          subText=layout.description
                                        }
end))
layoutChooser:rows(#layouts)
layoutChooser:width(20)
layoutChooser:subTextColor({red=0, green=0, blue=0, alpha=0.4})

hs.hotkey.bind(hyper, ';', function()
          layoutChooser:show()
end)


-- hs.screen.watcher.new(function()
--    if not currentLayout then return end

 --   applyLayout(currentLayout)

--end):start()

--applyLayout(layouts[1])

-- magic layouts

-- for debugging
function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

hs.window.filter.default:subscribe(hs.window.filter.windowFocused,
                                   function(window, appName)
                                     if false then
                                       print('Created: -' .. window:title() .. '- role: -' .. window:role() .. '-' .. window:subrole() .. " - " .. appName)
                                       print(hs.inspect(window))
                                       print(window:isStandard())
                                       print(hs.inspect(window:zoomButtonRect()))
                                       print(window:application())
                                     end
end)


function cell(x,y,w,h)
  return string.format("[%s,%s,%s,%s]", x*6.25, y*25, w*6.25, h*25)
end




-- pause/toggle live layouts
paused = hs.settings.get("pauseLayout")
if paused == nil then
  paused = false
  hs.settings.set("pauseLayout", paused)
end

function toggleLayout(newstate)
  print("newstate " .. tostring(newstate))
  newstate = newstate or not hs.settings.get("pauseLayout")

  print("toggle layout " .. tostring(newstate))
  
  if newstate then
    hs.alert.show("Automatic Layout Enabled")    
    hs.window.layout.resumeAllInstances()
  else
    hs.alert.show("Automatic Layout Disabled")
    hs.window.layout.pauseAllInstances()
  end

  hs.settings.set("pauseLayout", newstate)
end

toggleLayout(paused)
hotkey.bind(hyper, 'l', toggleLayout)


-- commander
res = hs.screen.find('-500,240 700x1300')
print("SCREEN:" .. hs.inspect(res, {metatables=true, depth=4}))

-- wifi/network watching
function wifiwatcher(wather, message, interface, rssi, rate)
  print(message)
  print(interface)
  print(rssi)
  print(rate)
end

wifiWatcher = hs.wifi.watcher.new(wifiwatcher)
wifiWatcher:watchingFor({"SSIDChange", "linkChange", "powerChange"})
wifiWatcher:start()


-- show logo to indicate restart
Install:andUse('FadeLogo')
spoon.FadeLogo.image_size = hs.geometry.size(80, 80)
spoon.FadeLogo.run_time = 0.5
spoon.FadeLogo:start()

