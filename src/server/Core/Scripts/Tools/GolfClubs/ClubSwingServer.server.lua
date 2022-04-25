--ClubSwingServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--GolfClubEvents
local DriverHit = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfDriver.HitGolfBall

--RunTime
DriverHit.OnServerEvent:Connect(function(ServicePlayer)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local CurrentPowerRate = ServicePlayer:GetAttribute("CurrentPowerRate")
            
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)