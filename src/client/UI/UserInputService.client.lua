--UserInputService

--Services
local PlayersService = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--PlayerVariables
local ServicePlayer = PlayersService.LocalPlayer
local PlayerGui = ServicePlayer.PlayerGui
local PowerBarUI = PlayerGui:FindFirstChild("GolfPowerBar")

--Events
local ClubClientActivate = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubClientActivate
local ClubPowerBarSubmit = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubPowerBarSubmit

--Variables
local UserInputRegister = false
local UserPowerRate = 0

--ToolInUse
local Driver = false
local Iron = false
local Putter = false
local Wedge = false
local Wood = false

ClubClientActivate.OnClientEvent:Connect(function(ServicePlayer, ClubType)
    if ClubType == ("Driver") then
        Driver = true
    elseif ClubType == ("Iron") then
        Iron = true
    elseif ClubType == ("Putter") then
        Putter = true
    elseif ClubType == ("Wedge") then
        Wedge = true
    elseif ClubType == ("Wood") then
        Wood = true
    end
end)