--CFrameCalculator

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Variables
local WindSpeed = ReplicatedStorage.Common.Components.Objects.WindSpeed.WindSpeed

--Module
local CFrameCalculator = {}

function CFrameCalculator.CalculatePart2(BezierPoint1, SwingStrength)
    local HalfSwingStrength = -SwingStrength / 2
    local QuarterSwingStrength = -SwingStrength / 4

    local HalfWindSpeed = -WindSpeed / 2
    local QuarterWindSpeed = -WindSpeed / 4

    return CFrame * CFrame.new(QuarterSwingStrength - WindSpeed, HalfWindSpeed + 5, HalfWindSpeed - -5)
end

function CFrameCalculator.CalculatePart3(HumanoidRootPart, SwingStrength, StartPart)

end

function CFrameCalculator.CalculatePart4()

end

--EndModule
return CFrameCalculator

--WillTakeThePartToTheLeft
--PartName.CFrame = PartName.CFrame * CFrame.new(0,0,1) -- Change this based on where you want to go, it's on an XYZ axis

--MidPart1.CFrame = StartPart.CFrame * CFrame.new((-SwingDistance / 4) -WindSpeedValue, 5 + (WindSpeedValue / 2), -5 - (WindSpeedValue / 2))
--MidPart2.CFrame = StartPart.CFrame * CFrame.new((-SwingDistance / 2) -WindSpeedValue, 7 + (WindSpeedValue / 2), -10 - (WindSpeedValue / 2))
--EndPart.CFrame = StartPart.CFrame * CFrame.new(-SwingDistance / 2, 10, -15 - (WindSpeedValue / 2))