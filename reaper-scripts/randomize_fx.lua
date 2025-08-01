-- Randomly cycle through FX presets on selected track
local track = reaper.GetSelectedTrack(0,0)
if not track then return end
local fx_count = reaper.TrackFX_GetCount(track)
if fx_count == 0 then return end

local fx = math.random(0, fx_count-1)
reaper.TrackFX_SetPreset(track, fx, "RandomizedPreset")
reaper.ShowMessageBox("Random FX applied!", "FX Randomizer", 0)
