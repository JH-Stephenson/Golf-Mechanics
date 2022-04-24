--ClubPowerBarServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Events
local ClubClientActivate = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubClientActivate
local ClubPowerBarSubmit = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubPowerBarSubmit

ClubPowerBarSubmit.OnServerEvent:Connect(function(ServicePlayer, ClubType, PowerRate)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local WorkspaceCharacter = game.Workspace:FindFirstChild(ServicePlayer.Name)
            local PlayerGui = ServicePlayer.PlayerGui
            local PowerBarUI = PlayerGui:WaitForChild("GolfPowerBar")

            local WorkspaceClub = WorkspaceCharacter:FindFirstChild(ClubType)
            local ClubHead = WorkspaceClub:FindFirstChild("Head")

            PowerBarUI.Enabled = false
            ServicePlayer:SetAttribute("CurrentPowerRate", PowerRate)
            ServicePlayer:SetAttribute("CurrentlySwinging", "True")
            ClubHead:SetAttribute("GolfBallTouch", "True")

            wait(3)

            ClubHead:SetAttribute("GolfBallTouch", "False")
            ServicePlayer:SetAttribute("CurrentlySwinging", "False")
            ServicePlayer:SetAttribute("CurrentPowerRate", 0)
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)