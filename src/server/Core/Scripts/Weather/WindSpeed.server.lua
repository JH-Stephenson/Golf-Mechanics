--WindSpeed

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Variables
local WindSpeed = ReplicatedStorage.Common.Components.Objects.WindSpeed.WindSpeed

--RunTime
while true do
    local Success, ErrorData = pcall(function()
        local GeneratedSpeed = math.random(1, 13)
        WindSpeed.Value = GeneratedSpeed
    
        wait(15)
    end)

    if not Success then
        print(ErrorData)
    end
end