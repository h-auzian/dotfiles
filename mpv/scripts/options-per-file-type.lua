-- Set some settings depending if the playlist contains videos or audio.

-- For videos, require changing the files manually and avoid looping, as the
-- player is usually focused.

-- For audio, just play each file automatically and in a loop, since the player
-- usually running in the background.

mp.register_event("file-loaded", function()
    local vid = mp.get_property_number("vid", 0)
    if not startup_completed then
        if vid > 0 then
            mp.set_property("keep-open", "always")
            mp.set_property("loop-playlist", "no")
        else
            mp.set_property("keep-open", "yes")
            mp.set_property("loop-playlist", "inf")
        end
        startup_completed = true
    end
end)
