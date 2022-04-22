--ServerToolInitalisation

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local GolfBallModule = require(game.ServerScriptService.Server.Core.Modules.ObjectCreation.GolfBallCreator)
local GolfTeeModule = require(game.ServerScriptService.Server.Core.Modules.ObjectCreation.GolfTeeCreator)

--Events
local ToolActivatedEvent = ReplicatedStorage.Common.Events.ToolActivatedEvent

--RunTime
ToolActivatedEvent.OnServerEvent:Connect(function(Player, ToolName)
    if ToolName == ("Tee") then
        local GolfTee = GolfTeeModule.CreateGolfTee(Player, game.Workspace:FindFirstChild(Player.UserId.."'s Golf Tee"))
    end

    if ToolName == ("Golf Ball") then
        local GolfBall = GolfBallModule.CreateGolfBall(Player, game.Workspace:FindFirstChild(Player.UserId.."'s Golf Ball"), game.Workspace:FindFirstChild(Player.UserId.."'s Golf Tee"))
    end
end)