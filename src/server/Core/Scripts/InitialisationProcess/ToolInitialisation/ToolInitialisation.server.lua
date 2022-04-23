--ToolInitialisation

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local GolfBallModule = require(game.ServerScriptService.Server.Core.Modules.ObjectCreation.GolfBallCreator)
local GolfTeeModule = require(game.ServerScriptService.Server.Core.Modules.ObjectCreation.GolfTeeCreator)
local GolfDriverModule = require(game.ServerScriptService.Server.Core.Modules.GolfClubs.GolfDriver)

--Events
local ToolActivationEvent = ReplicatedStorage.Common.Events.Tools.ToolActivation

--RunTime
ToolActivationEvent.OnServerEvent:Connect(function(Player, ToolName)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if ToolName == ("Tee") then
                local GolfTee = GolfTeeModule.CreateGolfTee(Player, game.Workspace:FindFirstChild(Player.UserId.."'s Golf Tee"))
            end
        
            if ToolName == ("Golf Ball") then
                local GolfBall = GolfBallModule.CreateGolfBall(Player, game.Workspace:FindFirstChild(Player.UserId.."'s Golf Ball"), game.Workspace:FindFirstChild(Player.UserId.."'s Golf Tee"))
            end

            if ToolName == ("Driver") then
                GolfDriverModule.ClientIntialisation(Player)
			end
        end)
        
        if not Success then
            print(ErrorData)
        end
    end)
end)