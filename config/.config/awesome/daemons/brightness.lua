-- Emits a signal (daemon::brightness)
-- 		- Brightness (in percent)

local awful = require("awful")
local gears = require("gears")

local function send_brightness()
	awful.spawn.easy_async_with_shell("brightnessctl -m | awk -F, '{print $4}' | tr -d %", function(status) 
		awesome.emit_signal("daemon::brightness", tonumber(status))
	end)  
end

-- nvidia_0 is the name of the card
local function start_daemon()
	awful.spawn.with_line_callback("inotifywait /sys/class/backlight/brightness -m -e close_write", {stdout = function(_) 
        send_brightness()
	end})
end

-- Run once to send all clients data
send_brightness()
start_daemon()