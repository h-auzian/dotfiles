-- Always shows the OSD seek bar by calling it constantly using a timer.

local show_seek_bar = function()
    local vid = mp.get_property_number("vid", 0)
    if vid > 0 then
        return
    end

    mp.commandv("show-progress")
end

local osd_duration_in_seconds = mp.get_property_number("osd-duration", 1000) / 1000
mp.add_periodic_timer(osd_duration_in_seconds, show_seek_bar)

mp.register_event("file-loaded", show_seek_bar)
