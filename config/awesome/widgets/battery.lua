-------------------------------------------------
-- Battery widget
-------------------------------------------------

local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"

local text = wibox.widget {
  font = "Hack 11",
  widget = wibox.widget.textbox,
}

local widget = wibox.widget.background()
widget:set_widget(text)

gears.timer {
  timeout = 20,
  autostart = true,
  call_now = true,
  callback = function()
    awful.spawn.easy_async_with_shell("cat /sys/class/power_supply/BAT*/uevent", function(out)
      local capacity_raw = string.match(out, "POWER_SUPPLY_CAPACITY=%d*")
      local capacity = string.sub(string.match(capacity_raw, "=%d*"), 2)

      if tonumber(capacity) ~= 100 then
        local status_raw = string.match(out, "POWER_SUPPLY_STATUS=%u")
        local status_stripped = string.match(status_raw, "=%u")
        local status_letter = string.match(status_stripped, "%u"):lower()

        text:set_text("ba:" .. capacity .. status_letter)

        local not_charging = status_letter == "d"
        local is_bat_low = tonumber(capacity) < 21
        local color = "#d2d4de"

        if not_charging and is_bat_low then
          color = "#e27878"
        end

        widget:set_fg(color)
      else
        text:set_text "ba:full"
        widget:set_fg "#b4be82"
      end
    end)
  end,
}

return widget
