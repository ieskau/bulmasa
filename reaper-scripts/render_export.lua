-- Quick render of master to output folder
local project_path = reaper.GetProjectPath(0)
local output = project_path .. "/output/renders/"
os.execute("mkdir -p " .. output)

reaper.Main_OnCommand(41824, 0) -- File: Render project, using last settings
