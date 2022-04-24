--ClubSwingServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--GolfClubEvents
local DriverHit = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfDriver.HitGolfBall

--RunTime
DriverHit.OnServerEvent:Connect(function(ServicePlayer)
    
end)