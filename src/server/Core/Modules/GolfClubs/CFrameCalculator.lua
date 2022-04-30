--CFrameCalculator

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local Raycasting = require(game.ServerScriptService.Server.Core.Modules.Raycasting.RaycastingModule)

--Variables
local WindSpeed = ReplicatedStorage.Common.Components.Objects.WindSpeed.WindSpeed.Value

--Module
local CFrameCalculator = {}

function CFrameCalculator.CalculatePart2(BezierPoint1, SwingStrength)
    return BezierPoint1.CFrame * CFrame.new((-SwingStrength / 4) -WindSpeed, 5 + (WindSpeed / 2), -5 - (WindSpeed / 2))
end

function CFrameCalculator.CalculatePart3(BezierPoint1, SwingStrength)
    return BezierPoint1.CFrame * CFrame.new((-SwingStrength / 2) -WindSpeed, 7 + (WindSpeed / 2), -10 - (WindSpeed / 2))
end

function CFrameCalculator.CalculatePart4CFrame(BezierPoint1, SwingStrength)
    return BezierPoint1.CFrame * CFrame.new(-SwingStrength / 2, 10, -15 - (WindSpeed / 2))
end

function CFrameCalculator.CalculatePart4Position(BezierPoint4)
    local Raycast = Raycasting.FindPartGround(BezierPoint4)
    return Raycast.Position + Vector3.new(0, (BezierPoint4.Size.Y / 2), 0)
end

--EndModule
return CFrameCalculator

--[[
Comments for Building Relevant Calculations
return CFrameCalculator

WillTakeThePartToTheLeft
PartName.CFrame = PartName.CFrame * CFrame.new(0,0,1) -- Change this based on where you want to go, it's on an XYZ axis

--Things That Did Work
MidPart1.CFrame= StartPart.CFrame * CFrame.new((-SwingDistance / 4) -WindSpeedValue, 5 + (WindSpeedValue / 2), -5 - (WindSpeedValue / 2))
MidPart2.CFrame = StartPart.CFrame * CFrame.new((-SwingDistance / 2) -WindSpeedValue, 7 + (WindSpeedValue / 2), -10 - (WindSpeedValue / 2))
EndPart.CFrame = StartPart.CFrame * CFrame.new(-SwingDistance / 2, 10, -15 - (WindSpeedValue / 2))

local BezierPoint4Raycast = Raycasting.FindPartGround(BezierPoint4)
BezierPoint4.Position = BezierPoint4Raycast.Position + Vector3.new(0, (BezierPoint4.Size.Y / 2), 0)
]]