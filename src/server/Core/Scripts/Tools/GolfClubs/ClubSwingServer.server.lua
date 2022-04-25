--ClubSwingServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local SwingDistanceModule = require(game.ServerScriptService.Server.Core.Modules.GolfClubs.SwingDistanceModule)
local SwingModule = require(game.ServerScriptService.Server.Core.Modules.GolfClubs.SwingModule)

--GolfClubEvents
local DriverHit = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfDriver.HitGolfBall

--RunTime
DriverHit.OnServerEvent:Connect(function(ServicePlayer)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local CurrentPowerRate = ServicePlayer:GetAttribute("CurrentPowerRate")
            local ServerSwingDistance = SwingDistanceModule.GenerateDriverDistance(CurrentPowerRate)
            local SwingBall = SwingModule.HitBall(ServicePlayer, ServerSwingDistance)
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)