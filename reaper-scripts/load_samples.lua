-- Load random samples from folder into new tracks
local sample_dir = reaper.GetResourcePath() .. "/scripts/music-automation/samples/drums/kicks/"
function get_random_file(path)
    local files = {}
    local i = 0
    local file = reaper.EnumerateFiles(path, i)
    while file do
        table.insert(files, file)
        i = i + 1
        file = reaper.EnumerateFiles(path, i)
    end
    if #files == 0 then return nil end
    return path .. files[math.random(#files)]
end

reaper.Undo_BeginBlock()
local sample = get_random_file(sample_dir)
if sample then
    reaper.InsertMedia(sample, 0)
    reaper.ShowMessageBox("Loaded sample: " .. sample, "Random Sample Loader", 0)
else
    reaper.ShowMessageBox("No samples found!", "Error", 0)
end
reaper.Undo_EndBlock("Load Random Sample", -1)
