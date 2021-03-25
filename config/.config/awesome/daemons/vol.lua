-- Emits a signal (daemon::vol)
--	- Volume (either in string with percent or string "muted")

local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

local old_vol = ""
local function emit_vol()
    awful.spawn.easy_async("pamixer --get-volume-human", function(out) 
        if (old_vol ~= out) then
            awesome.emit_signal("daemon::vol", out)
            old_vol = out
        end
    end)
end

emit_vol()

gears.timer.start_new(1, function()
    emit_vol()
    return true
end)
