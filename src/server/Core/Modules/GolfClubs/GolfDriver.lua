--GolfDriver

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

--Events
local GolfDriverClient = ReplicatedStorage.Common.Events.Tools.GolfDriver.GolfDriverClientSend
local GolfDriverServer = ReplicatedStorage.Common.Events.Tools.GolfDriver.GolfDriverClientRecieve

--Module
local GolfDriverModule = {}

function GolfDriverModule.ClientIntialisation(Player)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local PlayerGui = Player.PlayerGui
            local Character = game.Workspace:FindFirstChild(Player.Name)
        
            print(Player)
        end)
    end)
end

return GolfDriverModule