--GolfClubServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Events
local GolfClubClient = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfClubClientRecieve
local GolfClubServer = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfClubServerSend

--EventRuntime
GolfClubServer.OnServerEvent:Connect(function(Player, ClubType, ClubPower)
    Player.PlayerGui.GolfPowerBar.Enabled = false
    Player.PlayerGui.GolfPowerBar.OuterFrame.InnerFrame.PowerSlider.Position = UDim2.new(0.547, -160, 0.489, -22)

    print(Player)
    print(ClubType)
    print(ClubPower)
end)