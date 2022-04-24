--GolfClubModule

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Module
local GolfClubModule = {}

--Events
local ClubClientActivate = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubClientActivate
local ClubPowerBarSubmit = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubPowerBarSubmit

function GolfClubModule.InitaliseClub(ServicePlayer, GolfClubName)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local PlayerUI = ServicePlayer.PlayerGui
            local PowerBarUI = PlayerUI:FindFirstChild("GolfPowerBar")
            
            wait(3)

            ClubClientActivate:FireClient(ServicePlayer, "Driver")
            PowerBarUI.Enabled = true
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end

return GolfClubModule