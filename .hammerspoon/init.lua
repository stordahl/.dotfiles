hs.loadSpoon('HCalendar')
spoon.HCalendar:start()

hs.loadSpoon('Cherry')
--spoon.Cherry:bindHotkeys({ start = {"cmd", "alt", "ctrl"}, "C" })
hs.hotkey.bind({"cmd", "ctrl"}, "C", function()
  spoon.Cherry:start()
  hs.alert.show("Started! 🍒")
end)



local function reloadConfig(files)
    local doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World")
end)
