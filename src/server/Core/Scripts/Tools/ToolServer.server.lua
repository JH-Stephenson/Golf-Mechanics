--ToolServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local GBCM = require(game.ServerScriptService.Server.Core.Modules.ObjectCreation.GolfBallCreator)
local GTCM = require(game.ServerScriptService.Server.Core.Modules.ObjectCreation.GolfTeeCreator)

--ToolEvents
local ToolActivatedEvent = ReplicatedStorage.Common.Events.Tools.ToolActivatedEvent

--RunTime
ToolActivatedEvent.OnServerEvent:Connect(function(ServicePlayer, ToolName)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if ToolName == ("Golf Ball") then
                GBCM.CreateGolfBall(ServicePlayer, game.Workspace:FindFirstChild(ServicePlayer.UserId.."'s Golf Ball"), game.Workspace:FindFirstChild(ServicePlayer.UserId.."'s Golf Tee"))
            elseif ToolName == ("Tee") then
                GTCM.CreateGolfTee(ServicePlayer, game.Workspace:FindFirstChild(ServicePlayer.UserId.."'s Golf Tee"))
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)