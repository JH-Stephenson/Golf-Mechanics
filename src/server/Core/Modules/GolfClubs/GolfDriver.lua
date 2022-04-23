--GolfDriver

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

--Events
local GolfClubClient = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfClubClientRecieve
local GolfClubServer = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfClubServerSend

--Module
local GolfDriverModule = {}

function GolfDriverModule.ClientIntialisation(Player)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local PlayerGui = Player.PlayerGui
            local Character = game.Workspace:FindFirstChild(Player.Name)

            --Animation will play here.
            wait(3)

            local PowerBarUI = PlayerGui:FindFirstChild("GolfPowerBar")
            PowerBarUI.Enabled = true

            GolfClubClient:FireClient(Player, "Driver")
            print("Server has opened the PowerBar for "..Player.UserId)
        end)
    end)
end

return GolfDriverModule